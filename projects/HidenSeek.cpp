#include <iostream>
#include <string>
#include <fstream>
#include <ctime>
#include <cstdlib>
#include <vector>
#include <Windows.h>



using namespace std;





int main()
{
   WIN32_FIND_DATA FileData;
   HANDLE hFind;
   DWORD fileAttributes;
// *** changed to wofstream (because we have to use wide characters for this program).
       wofstream fout;
// ***   vector<string> directories;
       vector<wstring> directories;
// ***    string currentDirectory = "C:/*.*";
       wstring currentDirectory = L"C:/*.*";
// ***    string hideFile;
       wstring hideFile;
   int x,y;


// ***  srand(time(0));
       srand((unsigned int)time(0));

   y=((rand()%8)+1);


   for(int i=0;i<y;i++)
   {

       directories.clear();

// *** Added (LPCWSTR) so the conversion explicitly happens.
       hFind=FindFirstFile((LPCWSTR)currentDirectory.c_str(), &FileData);
       //cout<<FileData.cFileName<<endl;

       if(FileData.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY)
              directories.push_back(FileData.cFileName);


       while(true){
            if(FindNextFile(hFind, &FileData))
              {
                    if(FileData.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY)
                    {
                         directories.push_back(FileData.cFileName);
                         //cout<<FileData.cFileName<<endl;
                    }
              }
            else break;
       }

       if(directories.empty())
            break;



       x = rand()%directories.size();
       currentDirectory = currentDirectory.substr(0, (currentDirectory.size()-3));
// ***        currentDirectory += (directories[x]+"/*.*");
               currentDirectory.append(directories[x]);
               currentDirectory.append(L"/*.*");



   }

   currentDirectory = currentDirectory.substr(0, (currentDirectory.size()-3));

   hideFile=currentDirectory + L"I'm Hiding.txt";


   fout.open(hideFile.c_str());

   fout<<"Dang! You found me.  I'll win next time";

   fout.close();

   FindClose(hFind);

// *** changed cout to wcout to support the wide string (wstring) output.
   wcout<<hideFile<<endl;

   system("pause");

   return 0;
}
