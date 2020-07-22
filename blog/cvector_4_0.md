# CVector 4.0
C libraries
June 15, 2020

I recently finished some relatively major changes and improvements to [CVector](/projects/cvector.html).

Since the most recent changes involved actual changes to the API, both adding new functions and modifing a few existing ones,
I've bumped the version up to 4.0.

Since I've never done an update post like this, and you can look at the main project page and documentation
etc. for all the details I'll just sum up some changes from about the last year (since about 3.1.0 give or take):

* Changing elem_init to return an int to indicate failure/success (and adding that checking where it's called)
* Renaming copy functions to match type-as-suffix convention
* Adding a copyc function that does initialization first, ie copy constructor
* Adding a CVEC_STRDUP macro wrapper which defaults to internal cvec_strdup if user doesn't set it
* Adding "move" function varieties (m suffix) for non-POD vectors that *do not* call elem_init/elem_free or CVEC_STRDUP/free.
* Adding a remove function that doesn't call elem_free/free (predates "move" functions... should I add an m even though the normal
"remove" is called erase?  Or rename remove to erasem for consistency?)
* Fixing several bugs and semi-bugs/QOL issues
* Adding lots of new tests to cover most if not all new functionality
* probably more that I'm forgetting

Renaming remove to erasem occurred to me briefly, and I do appreciate the consistency, but I already had remove and theoretically
not breaking existing code (even if it's just mine) is a worthy goal and I feel the english connotations of erase vs remove are
appropriate here.  Sigh, now I've pretty much talked myself into adding an erasem wrapper macro that calls remove.




