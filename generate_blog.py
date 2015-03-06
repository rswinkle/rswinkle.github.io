#!/usr/bin/python3

# Copyright (c) 2015 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse



    #<ul>
#	    <li><a href="C_Cpp_mistakes.html">Robert's C/C++ Mistakes</li>
#	    <li><a href="hello_world.html">Hello World!</li>
    #</ul>

def main():

    #in case I decide to use extensions or change output type etc.
    md = markdown.Markdown();

    header = open('header.html').read()

    blog_index = open('blog/blog_index.html').read()
    post_list = '<ul>\n'

    for f in glob.glob('blog/*.md'):
        fstr = open(f).read()
        filename = f[0:-2] + 'html'
        post_list += '\t<li><a href="' + filename + '">'
        post_list += fstr.split('\n', 1)[0] + '</li>\n'


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
