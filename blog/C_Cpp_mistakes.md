# Robert's C/C++ Mistakes
C C++
November 6, 2009

I know there are a million lists of common programming mistakes (for almost every language) but I thought I'd do one myself.  Hopefully in writing about my most common mistakes I'll quit making them or at least remember to check for them first when my code doesn't work.  So  . . .

__1.) *Forgetting a semi-colon.*__

I know it's the most obvious mistake in C/C++.  Whether it's at the end of a class, struct, do-while loop or just a normal statement, I always seem to forget at least one semi-colon the first time I compile something.

__2.) *Adding a semi-colon to the end of an if statement.*__

I think one time I made this mistake was in my Watering Lawn project.  I think I had the following (lines 100-104 in wateringlawn.cpp):

	if(temp1==temp2);
	{
		minsprinks=0;
		break;
	}

which of course drove me crazy because my program was compiling and I knew I had written it right but it wasn't doing what I wanted.  Weird how your eyes can travel over the same place over and over again and you just get used to the semi-colon and totally ignore it.  Unconsciously you just accept that it should be there.  Fortunately I figured it out without too much head banging.

__3.) *Putting one equal sign in an if statement.*__

Yes I recently commited this mistake for I think the first time ever.  I was just typing too quickly and without really focusing.  I realize that there may be some edge cases where you might actually want an equal sign in if statement but I can't think of any and I haven't had any so far.

__4.) *Not looking at the *entire* line.*__

This is especially annoying if I've spent quite a bit of time staring at the line trying to figure it out after already having spent time isolating which line it is.  I had the following line and of course was getting an error.  Thing is I had already fixed the quotes (double to single) for the '('.  I was so focused and frustrated that the compiler was complaining about something I'd already fixed I didn't notice the ones around the A.

`if(x=='(') mystack.push("A");`

__5.) *Using double quotes when I need single quotes.*__

See above.  Sometimes I'm just not paying attention and typing to fast.

__6.) *Using gcc when I'm coding in C++.*__

Duh.

__7.) *Not keep track of exactly where my pointers are pointing.*__

(and realizing when things are pointing at the same thing instead of different things passing C strings around etc.)

__8.) *Not using sizeof when using memory functions in C.*__

(I know you can leave it out for primitives like char and int but I should just always use it so I won't forget for the complex structures).

__9.) *Forgetting a break statement.*__

__10.) *Forgetting to increment a counter.*__

Or similarly forgetting to set the pointer to the next one while looping through a linked list.

Most of these (especially 7-10) I made while writing [C PIM](http://www.robertwinkler.com/projects.php).  Hopefully I can use these as a self checklist or something.

__EDIT: 11.) *Forgetting to close a file stream.*__

__*EDIT 2: 12.) Allocating the wrong amount of memory.*__

__*EDIT 3: 14.) Type problems (wrong conversions, underflow and overflow in arithmetic both integer and real).*__
