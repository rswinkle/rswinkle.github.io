import csv, sqlite3, sys

if len(sys.argv) != 2:
    print("usage:", sys.argv[0], "data_to_convert.csv")
    exit(0)

con = sqlite3.connect("goodreads.db")
cur = con.cursor()

create_str_full = """CREATE TABLE goodreads
    (id INTEGER PRIMARY KEY,
    title,
    author,
    author_lf,
    additional_authors,
    ISBN,
    ISBN13,
    rating,
    avg_rating,
    publisher,
    binding,
    pages,
    year_published,
    original_publication_year,
    date_read,
    date_added,
    Bookshelves,
    Bookshelves with positions,
    Exclusive Shelf,
    review,
    spoiler,
    Private Notes,
    Read Count,
    Recommended For,
    Recommended By,
    Owned Copies,
    Original Purchase Date,
    Original Purchase Location,
    Condition,
    Condition Description,
    BCID
    )"""

create_str = """CREATE TABLE goodreads
    (id INTEGER PRIMARY KEY,
    title TEXT,
    author TEXT,
    author_lf TEXT,
    additional_authors TEXT,
    ISBN,
    ISBN13,
    rating INT,
    avg_rating FLOAT,
    publisher TEXT,
    binding TEXT,
    pages INT,
    year_published INT,
    original_publication_year INT,
    date_read DATE,
    date_added DATE,
    review TEXT
    );"""

insert_str = """INSERT INTO goodreads
    (id,
    title,
    author,
    author_lf,
    additional_authors,
    ISBN,
    ISBN13,
    rating,
    avg_rating,
    publisher,
    binding,
    pages,
    year_published,
    original_publication_year,
    date_read,
    date_added,
    review
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"""



cur.execute(create_str) # use your column names here

with open(sys.argv[1]) as fin: # `with` statement available in 2.5+
    # csv.DictReader uses first line in file for column headings by default
    dr = csv.DictReader(fin) # comma is default delimiter
    to_db = [(i['Book Id'], i['Title'], i['Author'],
        i['Author l-f'], i['Additional Authors'],
        i['ISBN'], i['ISBN13'], i['My Rating'], i['Average Rating'], i['Publisher'],
        i['Binding'], i['Number of Pages'], i['Year Published'], i['Original Publication Year'],
        i['Date Read'], i['Date Added'], i['My Review']) for i in dr]

cur.executemany(insert_str, to_db)
con.commit()
con.close()
