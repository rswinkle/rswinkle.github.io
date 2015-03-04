#include <iostream>
#include <stdlib.h>
#include <string>
#include <fstream>

using namespace std;



typedef unsigned int word;
typedef char bit;


int parseSpace(int, string);
word parse_R(string, string);			//functions for each type of instruction
word parse_I(string, string);
word parse_J(string, string);

class Label
{
     private:
     int address;
     string name;
  
     public:
     Label(){};
     
     Label(int x, string name1)
     {
          address = x;
          name = name1;
     }

     int getAddress() { return address; }

     string getName() { return name; }

     void setAddress(int x) { address=x; }

     void setName(string name1) { name=name1; }

};



     Label labelArray[100];		//array to contain labels

int main(int argc, char *argv[])
{    

    

     ifstream fin;
     ofstream fout;
     
     char ch;
     
     string line, opcode, operands, label, line2;

     
    
     int space, x, y, z, pound, count, labelCount,labelcheck;
     
     
     
     fin.open(argv[1]);


     fout.open(argv[2]);

     

    count = 0;
     labelCount=0;
     
     while(!fin.eof())
     {
         
    
                

          getline(fin, line);
          
          
          
          if(!fin)
              break;

          

          labelcheck=0;
          

          if(line[0] != ' ' && line[0] != '\t')				//instructions can't start on the edge only labels
          {													//so if there's text immediately parse it as a label
               space=line.find_first_of(" ",0);
               label=line.substr(0,(space-1+1));
               labelArray[labelCount].setAddress(count);		//add the new label to the label array
               labelArray[labelCount].setName(label);
               labelCount++;	
				labelcheck=1;								//set labelcheck so I know how to continue parsing						
          }

          
          if(labelcheck==0)
          	z=line.find_first_of(" ",1);			//find first space starting at 1 if no label
          else
			z=line.find_first_of(" ",			//need to modify if there was a label


          opcode=line.substr(1,(z-1)+1-1);
          
          y=parseSpace(z, line);
            

          x=line.find_first_of(",",y);
           
          pound=line.find_first_of("#",0);


          

          if(pound==-1)
               operands=line.substr(x-3);
          else
               operands=line.substr(x+2,(pound-1)-(x+2)+1);

            
          if(opcode=="add" || opcode=="sub" || opcode=="and" || opcode=="or" || opcode=="nor" || opcode=="slt")
          {
               fout<<parse_R(opcode, operands)<<endl;
          }
          else if(opcode=="ori" || opcode=="lw" || opcode=="sw" || opcode=="beq")// ||        )
          {
               fout<<parse_I(opcode, operands)<<endl;
          }
          else if(opcode=="j")// ||           )
          {    
               fout<<parse_J(opcode, operands)<<endl;
          }

          count++;

     }
  

     fin.close();
     fout.close();

}

          
          
          
          
    


int parseSpace(int start, string x)
{
     for(int i = start;;i++)
     {
          if(x[i]!=' ' && x[i]!='\t')
               return i;
     }
}

               
           
          


word parse_R(string op, string operands)
{
     word opcode_bin, funct_bin, encoding, rDST, rS, rT;

     rDST = atoi(operands.substr(1,2).c_str());

     rS = atoi(operands.substr(6,2).c_str());

     rT = atoi(operands.substr(11,2).c_str());

     opcode_bin = 0;

     if (op=="add")
     {
          funct_bin = 0x20;
     }
     else if(op=="sub")
     {
          funct_bin = 0x22;
     }
     else if (op=="and")
     {
          funct_bin = 0x24;
     }
     else if(op=="or")
     {
          funct_bin = 0x25;
     }
     else if(op=="nor")
     {
          funct_bin = 0x27;
     }
     else if(op=="slt")
     {
          funct_bin = 0x2A;
     }
     
     encoding = (opcode_bin << 26) | (rS << 21) | (rT << 16) | (rDST << 11) | funct_bin;

     return encoding;
}


word parse_I(string op, string operands)
{
     word opcode_bin, encoding, rS, rT;
     int x, imm;
     string label;

     rS = atoi(operands.substr(1,2).c_str());

     rT = atoi(operands.substr(6,2).c_str());
     
     x = operands.find_first_of(" ",9);

     label = operands.substr(9,(x-1)-(9+1)).c_str();

     if (op =="ori")
     {
          opcode_bin = 0xD;
     }
     else if(op=="lw")
     {
          opcode_bin = 0x23;
     }
     else if(op=="sw")
     {
          opcode_bin = 0x2B;
     }
     else if(op=="beq")
     {
          opcode_bin = 0x4;


          for(int i=0;i<100;i++)
          {
               //if(labelArray[i
               
               if(label+":"==labelArray[i].getName())
               {
                    imm=labelArray[i].getAddress();
                    break;
               }
          }

     }
     
     // add other instructions here


     encoding = (opcode_bin <<26) | (rS <<21) | (rT << 16) | (imm & 0x0000FFFF);  // negative imm?

     return encoding;
}

     


word parse_J(string op, string operands)
{
     word opcode_bin, encoding, imm;

     string label;

     int x = operands.find_first_of(" ");
     label = operands.substr(0,(x-1)+1).c_str();

     if(op=="j")
     {
          opcode_bin = 0x2;

          for(int i=0;i<100;i++)
          {
               //if(labelArray[i
               
               if(label+":"==labelArray[i].getName())
               {
                    imm=labelArray[i].getAddress();
                    break;
               }
          }




     }

     // add more instructions here

     encoding = (opcode_bin <<26) | (imm & 0x0000FFFF);

     return encoding;

}












