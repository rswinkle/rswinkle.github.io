Historical Projects
===================

This is a list of old, mostly text/console based projects that aren't significant enough to
warrant their own page.  They're listed in reverse chronological order.

## CPIM2
This is a complete rewrite of the old C PIM below.  See Github project <a href="http://www.github.com/rswinkle/CPIM2">here</a>.

## OpenGL Graphics
This is just a very uncomprehensive page of miscellaneous OpenGL graphics programs I've made.  Hopefully I'll update it frequently.  The page is <a href="/projects/graphics.html">here</a>.

## Spelling Game
See Github project <a href="http://www.github.com/rswinkle/spelling_game">here</a>.

## string_matching
See Github project <a href="http://www.github.com/rswinkle/string_matching">here</a>.

## CInverse
See Github project <a href="http://www.github.com/rswinkle/cinverse">here</a>, and the test results
<a href="/projects/cinverse/CUnitAutomated-Results.xml">here</a>. See CVector description for info about viewing
the test results.

## CSkiplist
See Github project <a href="http://www.github.com/rswinkle/cskiplist">here</a>, and the test results
<a href="/projects/cskiplist/CUnitAutomated-Results.xml">here</a>. See CVector description for info about viewing
the test results.

## C PIM
This is a simple console based contact information manager written in C using a linked list and dynamic memory allocation.  Some of its
more interesting and (relatively) complex features are the ability to save contacts to a file (in the form of xml data) specified by the user
and of course being able to open and load the contacts from the file.  Also the user can add up to 25 custom attributes
to each contact (first and last name and phone are hard coded in).  Unfortunately there are some limitations.  It only searchs
and sorts contacts based on the last name and it is case sensitive.  I tried to make the program as safe and structured as possible
checking every memory function etc. however I know there are still some unsafe/unchecked operations (for example I didn't check every single fgetc()'s).  The source code
and Makefile (for linux) and the Dev-C++ project with the compiled executable are <a href="/projects/C PIM.zip">here</a>.

## C BMP
This is a command line tool for manipulating bitmap image files.  <a href="/projects/screenshotlinux.png">Here</a>
is a screenshot of the interface listing what it can do.  The source code
and Makefile (for linux) and the Dev-C++ project with the compiled executable are <a href="/projects/CBMP.zip">here</a>.

## Watering Lawn
This C++ program solves the Watering Lawn problem from the ASU Women in Computer Science (WCS)
2009 programming competition. The cpp file is <a href="/projects/wateringlawn.cpp">here</a>.

## Gopher
These 2 programs are based on the Gopher and Hawks problem also from the ASU WCS 2009 programming competition.
Both of them solve it (with a very slight modification) and have a little extended functionality as well.
The source code for both, executables (for windows and linux), the problem, a README etc.
are <a href="/projects/gopher.zip">here</a>. I know this was a pretty simple problem but I think it's
pretty cool and it was fun to make.  Also I started it using a brute force method, ie tons of loops within loops
and if statements with breaks and continues all over the place.  After a couple hundred lines of code and a couple of hours of work I just gave up
on that version and started over again.  The result is the much cleaner (hopefully) and more structured (definitely)
approach included in the zip file.

## Shooter
This is a birds-eye shooter that I made for a beginning game development class using GameMaker.
I tried to use GML as much as possible instead of the drag and drop interface.  It is much more fun for me
to work with code than the visual method; it is also much easier in my opinion and obviously more flexible.
It is very much a work in progress with no levels or campaign yet and a relatively buggy but playable "Arena"
I hope to add levels to it and iron out the bugs sometime.  Also, I am not an artist in any way so I'm aiming for a functional
but visually simple game.  The executable (windows only unfortunately since GameMaker uses DirectX) is
<a href="/projects/Shooter v0.2.zip">here</a>

## Hide and Seek
This is a windows only C++ program I wrote for CSE 100 honors project based on an idea I'd been wanting to try.  The program
hides a text file on your C drive and you have to find it.  It is not invasive or malicious in any way.
It will even give you a hint if you can't find it (you can find it pretty quickly in most OS's if there's a way to see
recently modified files).  I've tested it in Vista and Ubuntu with Wine.  It explains the directions when you run it.
The source is <a href="/projects/HidenSeek.cpp">here</a>

## MIPS Assembler
This is a very simple and limited MIPS assembler written in C++ for an honors project.  It just converts a text file to binary numbers.
The code must be written in a specific way because it made the parsing easier.  It is unfinished (labels not fully implemented) and minimally tested.
The source code is <a href="/projects/Assembler.cpp">here</a>

