#!/usr/bin/python3

# Copyright (c) 2015 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse, time

from mako.template import Template
from mako.lookup import TemplateLookup


    #<ul>
#	    <li><a href="C_Cpp_mistakes.html">Robert's C/C++ Mistakes</li>
#	    <li><a href="hello_world.html">Hello World!</li>
    #</ul>

def main():

    #in case I decide to use extensions or change output type etc.
    md = markdown.Markdown();

    mylookup = TemplateLookup(directories=['templates'])


    #First generate index page
    index_page = mylookup.get_template('index.mako')
    open('index.html', 'w').write(index_page.render())

    #Now About page ... might get rid of this later, integrate into index/home page
    about_page = mylookup.get_template('about.mako')
    open('about.html', 'w').write(about_page.render())






    #Now generate blog

    posts = glob.glob('blog/*.md')
    date_strs = [] #not used but if I want to add st/nd/rd/th later ...
    dates = []
    titles = []
    for post in posts:
        tmp = open(post).readlines(200)[0:3]
        titles += [tmp[0][:-1]]
        date_strs += tmp[2][:-1]
        print(tmp[2])
        dates += [time.strptime(tmp[2][:-1], '%B %d, %Y')]

    #zip all together so I can sort all by date the separate back into individual lists
    sorted_lists = sorted(zip(posts, titles, date_strs, dates), reverse=True, key=lambda x: x[3])
    posts, titles, date_strs, dates = [[x[i] for x in sorted_lists] for i in range(4)]

    blog_index = mylookup.get_template('blog_index.mako')
    #cut off blog/ and and replace md with html extension
    filenames = [f[5:-2] + 'html' for f in posts]
    file_titles = zip(filenames, titles)

    #print(blog_index.render(posts=file_titles))
    open('blog/blog_index.html', 'w').write(blog_index.render(posts=file_titles))

    blog_post = mylookup.get_template('blog_post.mako')
    for i,f in enumerate(posts):
        out = open('blog/'+filenames[i], 'w')
        out.write(blog_post.render(post=md.convert(open(f).read())))
        out.close()
    


if __name__=="__main__":
    main()
