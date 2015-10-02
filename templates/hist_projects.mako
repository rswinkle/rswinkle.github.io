<%inherit file="base.mako"/>
<%block name="title">
<title>Historical Projects | Robert Winkler</title>
</%block>

<h2>
Historical Projects
</h2>

<p>
This is a list of very old, mostly text/console based projects.
</p>

<h4>C_Interpreter</h4>
<p>
This is a C interpreter written in C.  See Github project <a href="http://www.github.com/rswinkle/C_Interpreter">here</a>.
</p>

<h4>CPIM2</h4>
<p>
This is a complete rewrite of the old C PIM below.  See Github project <a href="http://www.github.com/rswinkle/CPIM2">here</a>.
</p>

<h4>OpenGL Graphics</h4>
<p>
This is just a very uncomprehensive page of miscellaneous OpenGL graphics programs I've made.  Hopefully I'll update it frequently.  The page is <a href="/projects/graphics.html">here</a>.
</p>

<h4>Spelling Game</h4>
<p>
See Github project <a href="http://www.github.com/rswinkle/spelling_game">here</a>.
</p>

<h4>string_matching</h4>
<p>
See Github project <a href="http://www.github.com/rswinkle/string_matching">here</a>.
</p>

<h4>CInverse</h4>
<p>
See Github project <a href="http://www.github.com/rswinkle/cinverse">here</a>, and the test results
<a href="/projects/cinverse/CUnitAutomated-Results.xml">here</a>. See CVector description for info about viewing
the test results.
</p>

<h4>CSkiplist</h4>
<p>
See Github project <a href="http://www.github.com/rswinkle/cskiplist">here</a>, and the test results
<a href="/projects/cskiplist/CUnitAutomated-Results.xml">here</a>. See CVector description for info about viewing
the test results.
</p>

<h4>CVector</h4>
<p>
See Github project <a href="http://www.github.com/rswinkle/cvector">here</a>, Doxygen documentation
<a href="/projects/cvector/index.html">here</a>, and the test results <a href="/projects/cvector/CUnitAutomated-Results.xml">here</a>.
The test results link displays correctly in Firefox (you have to allow it if you're running noscript since it uses xsl for formatting) but
I'm not sure about other browsers.  I was unable to correctly load it in Chrome in Ubuntu.
Both the Doxygen documentation and the test results (and testing code) are included in the Github project.
</p>

<h4>C PIM</h4>
<p>
This is a simple console based contact information manager written in C using a linked list and dynamic memory allocation.  Some of its
more interesting and (relatively) complex features are the ability to save contacts to a file (in the form of xml data) specified by the user
and of course being able to open and load the contacts from the file.  Also the user can add up to 25 custom attributes
to each contact (first and last name and phone are hard coded in).  Unfortunately there are some limitations.  It only searchs
and sorts contacts based on the last name and it is case sensitive.  I tried to make the program as safe and structured as possible
checking every memory function etc. however I know there are still some unsafe/unchecked operations (for example I didn't check every single fgetc()'s).  The source code
and Makefile (for linux) and the Dev-C++ project with the compiled executable are <a href="/projects/C PIM.zip">here</a>.
</p>

<h4>C BMP</h4>
<p>
This is a command line tool for manipulating bitmap image files.  <a href="/projects/screenshotlinux.png">Here</a>
is a screenshot of the interface listing what it can do.  The source code
and Makefile (for linux) and the Dev-C++ project with the compiled executable are <a href="/projects/CBMP.zip">here</a>.
</p>

<h4>Watering Lawn</h4>
<p>
This C++ program solves the Watering Lawn problem from the ASU Women in Computer Science (WCS)
2009 programming competition. The cpp file is <a href="/projects/wateringlawn.cpp">here</a>.
</p>

<h4>Gopher</h4>
<p>
These 2 programs are based on the Gopher and Hawks problem also from the ASU WCS 2009 programming competition.
Both of them solve it (with a very slight modification) and have a little extended functionality as well.
The source code for both, executables (for windows and linux), the problem, a README etc.
are <a href="/projects/gopher.zip">here</a>. I know this was a pretty simple problem but I think it's
pretty cool and it was fun to make.  Also I started it using a brute force method, ie tons of loops within loops
and if statements with breaks and continues all over the place.  After a couple hundred lines of code and a couple of hours of work I just gave up
on that version and started over again.  The result is the much cleaner (hopefully) and more structured (definitely)
approach included in the zip file.
</p>

<!--
This hasn't worked in a browser for years and I hate Java and barely know it so why have this?
<h4>Tic Tac Toe</h4>
<p>
This is a tic tac toe program I wrote for my CSE 205 course.  It is written in Java of course.  It is not polished
but it works well enough (UPDATE 3/4/15: I haven't seen it work in a browser in years now).  It was pretty fun to make despite it's simplicity.  I still need to get a lot more Java practice
The applet can be seen <a href="/projects/tictactoe.php">here</a>
</p>
-->

<h4>Shooter</h4>
<p>
This is a birds-eye shooter that I made for a beginning game development class using GameMaker.
I tried to use GML as much as possible instead of the drag and drop interface.  It is much more fun for me
to work with code than the visual method; it is also much easier in my opinion and obviously more flexible.
It is very much a work in progress with no levels or campaign yet and a relatively buggy but playable "Arena"
I hope to add levels to it and iron out the bugs sometime.  Also, I am not an artist in any way so I'm aiming for a functional
but visually simple game.  The executable (windows only unfortunately since GameMaker uses DirectX) is
<a href="/projects/Shooter v0.2.zip">here</a>
</p>

<h4>Hide and Seek</h4>
<p>
This is a windows only C++ program I wrote for CSE 100 honors project based on an idea I'd been wanting to try.  The program
hides a text file on your C drive and you have to find it.  It is not invasive or malicious in any way.
It will even give you a hint if you can't find it (you can find it pretty quickly in most OS's if there's a way to see
recently modified files).  I've tested it in Vista and Ubuntu with Wine.  It explains the directions when you run it.
The source is <a href="/projects/HidenSeek.cpp">here</a>
</p>

<h4>MIPS Assembler</h4>
<p>
This is a very simple and limited MIPS assembler written in C++ for an honors project.  It just converts a text file to binary numbers.
The code must be written in a specific way because it made the parsing easier.  It is unfinished (labels not fully implemented) and minimally tested.
I hope to finish it soon.  The source code is <a href="/projects/Assembler.cpp">here</a>
</p>

