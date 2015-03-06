#!/usr/bin/python3

# Copyright (c) 2015 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse, time



    #<ul>
#	    <li><a href="C_Cpp_mistakes.html">Robert's C/C++ Mistakes</li>
#	    <li><a href="hello_world.html">Hello World!</li>
    #</ul>

def main():

    #in case I decide to use extensions or change output type etc.
    md = markdown.Markdown();

    header = open('header.html').read()

    blog_index = open('blog/blog_index.template').read()
    post_list = '<ul>\n'

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

    sorted_lists = sorted(zip(posts, titles, date_strs, dates), reverse=True, key=lambda x: x[3])
    posts, titles, date_strs, dates = [[x[i] for x in sorted_lists] for i in range(4)]

    for i,f in enumerate(posts):
        fstr = open(f).read()
        filename = f[0:-2] + 'html'
        post_list += '\t<li><a href="' + filename[5:] + '">'
        post_list += titles[i] + '</li>\n'



        out = open(filename, 'w')
        out.write('<html>\n')
        out.write(header)
        out.write(md.convert(open(f).read()))
        out.write('\n</body>\n</html>\n')
        out.close()
    

    post_list += '</ul>\n'
    blog_index = blog_index.replace('{{posts}}', post_list)

    print(post_list)
    print(blog_index)
    open('blog/blog_index.html', 'w').write(blog_index)


if __name__=="__main__":
    main()
