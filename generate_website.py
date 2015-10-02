#!/usr/bin/python3

# Copyright (c) 2015 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse, time

from mako.template import Template
from mako.lookup import TemplateLookup



def main():

    #in case I decide to use extensions or change output type etc.
    md = markdown.Markdown();

    mylookup = TemplateLookup(directories=['templates'])


    #First generate standalone pages
    index_page = mylookup.get_template('index.mako')
    open('index.html', 'w').write(index_page.render())

    #Now About page ... might get rid of this later, integrate into index/home page
    about_page = mylookup.get_template('about.mako')
    open('about.html', 'w').write(about_page.render())

    project_page = mylookup.get_template('projects.mako')
    open('projects.html', 'w').write(project_page.render())

    project_page = mylookup.get_template('hist_projects.mako')
    open('hist_projects.html', 'w').write(project_page.render())






    #Now generate blog

    posts = glob.glob('blog/*.md')
    date_strs = [] #not used but if I want to add st/nd/rd/th later ...
    dates = []
    titles = []
    tags = []
    tag_dict = {}
    article_offsets = []


    for post in posts:
        tmp = open(post).readlines(200)[0:4]

        article_offsets += [sum(len(a) for a in tmp)]
        print(article_offsets)
        titles += [tmp[0][:-1]]
        tags += [tmp[2].split()]
        if not tags[-1]:
            tags[-1] += ['untagged']

        date_strs += [tmp[3][:-1]]
        dates += [time.strptime(tmp[3][:-1], '%B %d, %Y')]



    #zip all together so I can sort all by date the separate back into individual lists
    sorted_lists = sorted(zip(posts, titles, tags, article_offsets, date_strs, dates), reverse=True, key=lambda x: x[5])
    posts, titles, tags, article_offsets, date_strs, dates = [[x[i] for x in sorted_lists] for i in range(6)]



    #cut off blog/ and and replace md with html extension
    filenames = [f[5:-2] + 'html' for f in posts]
    file_titles = [x for x in zip(filenames, titles)]

    #associate posts with tags
    #doing this now and not earlier because I want the
    #tag pages to be sorted by date
    for i in range(len(file_titles)):
        for t in tags[i]:
            if t not in tag_dict:
                tag_dict[t] = [i]
            else:
                tag_dict[t] += [i]

    tag_filenames = [('/blog/tag_'+t+'.html', t) for t in tag_dict.keys()]
    open('templates/sidebar.html', 'w').write(mylookup.get_template('sidebar.mako').render(link_titles=file_titles, tags=tag_filenames))


    rendered_posts = []
    tfile_tags = []
    blog_post = mylookup.get_template('blog_post.mako')
    for i,f in enumerate(posts):
        rendered_posts += [md.convert(open(f).read()[article_offsets[i]:])]
        tfile_tags += [[('tag_'+t+'.html', t) for t in tags[i]]]

        out = open('blog/'+filenames[i], 'w')
        out.write(blog_post.render(post=rendered_posts[-1], file_title=file_titles[i], date=date_strs[i], tags=tfile_tags[-1]))
        out.close()
    

    blog_index = mylookup.get_template('blog_index.mako')
    open('blog/blog_index.html', 'w').write(blog_index.render(posts=rendered_posts, link_titles=file_titles, dates=date_strs, tags=tfile_tags))


    #generate tag pages
    tag_index = mylookup.get_template('tag_index.mako')
    for t in tag_dict.keys():
        tposts = [rendered_posts[i] for i in tag_dict[t]]
        tfile_titles = [file_titles[i] for i in tag_dict[t]]
        tdate_strs = [date_strs[i] for i in tag_dict[t]]
        t_file_tags = [tfile_tags[i] for i in tag_dict[t]]

        #I'm sure there's some way to do the 4 lines above all at once ... I'll get it later
        #tposts, tfile_titles, tdate_strs, t_file_tags = [(rendered_posts[i], file_titles[i], date_strs[i], tfile_tags[i]) for i in tag_dict[t]]


        #print(tposts)
        print(t)
        print(date_strs)
        print(t_file_tags)
        print(tag_dict[t])

        out = open('blog/tag_'+ t +'.html', 'w')
        out.write(tag_index.render(tag=t, posts=tposts, link_titles=tfile_titles, dates=tdate_strs, tags=t_file_tags))



    


if __name__=="__main__":
    main()
