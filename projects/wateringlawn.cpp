//Written by Robert Winkler
//Solves Watering Grass problem from
//the ASU WCS 2009 programming competition
//
//



#include <iostream>
#include <fstream>
#include <cmath> 

using namespace std;




int main()
{

	ifstream fin;					//declare and initialize all the variables I use . . .I know it seems
	ofstream fout;					//like I should be able to use fewer but oh well.  Use what works
								//I guess.
	int numsprinks,length,width;
	
	
	fin.open("WateringGrass_in.txt");
	fout.open("WateringGrass_out.txt");
	
	int position[100] = {0};
	int radius[100] = {0};
	
	int minsprinks = 0;
	
	double intersectRight[100] = {0};
	double intersectLeft[100] = {0};
	
	double theta,x;
	double temp1=0;
	double temp2=0;
	
	int test = 0;
	

	
	while(!fin.eof())						//keep going till file is done
	{
		for(int i=0;i<100;i++)				//clear all arrays and variables (necessary if there's more than one case)
		{								//I realize it makes the initializations above redundant . . .
			position[i] = 0;
			radius[i] = 0;
			intersectRight[i] = 0;
			intersectLeft[i] = 0;
		}
		
		minsprinks = theta = x = temp1 = temp2 = 0;
		
		
		
		
		
		
		fin>>numsprinks>>length>>width;		//read in the case
			
		if(!fin) break;
		
		for(int i=0;i<numsprinks;i++)
			fin>>position[i]>>radius[i];
			

		for(int i=0;i<numsprinks;i++)			//determine the points at which the sprinkler's area crosses the edges of the grass
		{									//of course it will be the same on the top and bottom and the left and right
			if(2*radius[i]>width)					//will be equadistant from the center
			{	
				theta = asin((static_cast<double> (width)/2)/static_cast<double> (radius[i]));		//need to static cast width and radius[i]'s
				x = (static_cast<double> (width)/2)/tan(theta);	
				intersectRight[i] = position[i] + x;
				intersectLeft[i] = position[i] - x;
			}
		}
			
		//notice that the intersectRight and intersectLeft arrays contain 0's for the sprinklers with a diameter not greater than the width

		for(int j=0;j<100;j++)							//main algorithm for finding the minimum sprinklers
		{
			for(int i=0;i<numsprinks;i++)
			{
				if(intersectLeft[i]!=0 || intersectRight[i]!=0)		//throw out those with diameter<=width
				{
					if(intersectLeft[i]<=temp1)
					{
						if(intersectRight[i]>temp2)
							temp2=intersectRight[i];
					}
				}
			}
			if(temp2==0) break;			//if no circle covers the left edge of the grass, break
			minsprinks++;
			
			if(temp1==temp2)				//if no further grass has been covered (and we're not over the right edge)
			{							//then it can't be covered so set minsprinks to 0 and break
				minsprinks=0;
				break;
			}
			
			if(temp2>=length) break;		//if we've covered the right edge of the grass, break
				
			temp1=temp2;
		}
			
		if(minsprinks==0) fout<<"-1"<<endl;		//output the results
		else fout<<minsprinks<<endl;
		
		
		
		
	}
	
	
	
	



	fin.close();
	fout.close();

	return 0;



}
