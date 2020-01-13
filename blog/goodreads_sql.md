Goodreads + SQL = Fun
=====================
books reading SQL
January 12, 2020

I've been learning SQL (and particularly SQLite) slowly and casually over the
last couple months and as I mentioned in my New Year's post, I want to continue
that and use it in more ways and in more projects.  Thus far I've read through
a lot of SQLite documentation, done a decent number of Hackerrank problems, gone
through the W3Schools questions, and more importantly used SQLite in some random
Python scripts and added a SQLite based implementation to
[CPIM2](https://github.com/rswinkle/CPIM2/tree/sqlite).

I realized soon after starting with SQL that one dataset that would be fun to play with
would be my Goodreads library.  Using their export function which gives you a csv file
and a relatively simple Python script, I could create a SQLite3 database.  Since I had
another few books I wanted to read before the end of the year and plenty more SQL exercises
and such to occupy me I decided to wait so I could have all of 2019 available for analysis
and statistics, and finally it's time.


I've been using Goodreads for several years now and while I've probably missed a book
here and there, I've been reasonably consistent about adding books since I first created
an account.  When I first started I added 100's of books immediately in a futile attempt
to create a definitive list of every book (or at least every fictional one) I've ever read.

Given that, take my ratings for the first couple hundred or so books with a grain of salt.
I have gone back and adjusted some occasionally to be more inline with my current ratings
but even if I remembered all of them it's impossible to rate things perfectly, especially
years or decades after you experienced it.

There are a few multi-book items in there, so items is not quite equivalent to books.

One last thing; unfortunately the goodreads export system is not perfect and for some reason
does not export date_read reliably at all (just leaves it blank most of the time) so that
precludes some more interesting analysis I wanted to do for the last few years.

Without further ado, here are some statistics:

| total_items | 515 |
| total_pages | 197367.0 |
| avg(pages)  | 383.982490272374 |


| binding                  |   count(binding)   |
| -----------------------  | ------------------ |
| Paperback                |                211 |
| Kindle Edition           |                152 |
| Hardcover                |                70  |
| Mass Market Paperback    |                58  |
| ebook                    |                20  |
| Audible Audio            |                3   |
|                          |                1   |

If you want to see the data and perform some SQL queries of your own (in the browser!),
I put the project up on REPL so you can see it [here](/projects/repls.html).  Just
select which repl "Goodreads + SQL".






