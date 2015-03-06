#!/usr/bin/python3

# Copyright (c) 2015 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse





def main():
    #in case I decide to use extensions or change output type etc.

    header = open('header.html').read()

    md = markdown.Markdown();
    for f in glob.glob('blog/*.md'):
        out = open(f[0:-2] + 'html', 'w')
        out.write('<html>\n')
        out.write(header)
        out.write(md.convert(open(f).read()))
        out.write('\n</body>\n</html>\n')
        out.close()
        


if __name__=="__main__":
    main()
