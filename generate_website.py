#!/usr/bin/python3

# Copyright (c) 2015-2016 Robert Winkler
# 
# This software is MIT licensed see link for details
# http://www.opensource.org/licenses/MIT

import glob, markdown, argparse, time
import itertools

from mako.template import Template
from mako.lookup import TemplateLookup

import json
from urllib.request import *
#import urllib3










def main():

	#in case I decide to use extensions or change output type etc.
	md = markdown.Markdown(output_format="html5");

	mylookup = TemplateLookup(directories=['templates'])


	#First generate standalone pages
	index_page = mylookup.get_template('index.mako')
	open('index.html', 'w').write(index_page.render())

	#Now Donations page ... might get rid of this later, integrate into index/home page
	about_page = mylookup.get_template('donations.mako')
	open('donations.html', 'w').write(about_page.render())

	project_page = mylookup.get_template('projects.mako')
	open('projects/index.html', 'w').write(project_page.render())

	#project_page = mylookup.get_template('hist_projects.mako')
	#open('projects/hist_projects.html', 'w').write(project_page.render())


	#Now generate project pages
	project_pages = glob.glob('projects/*.md')
	titles = []
	article_offsets = []
	for page in project_pages:
		tmp = open(page).readlines(200)[0:2]

		article_offsets += [sum(len(a) for a in tmp)]
		print(article_offsets)
		titles += [tmp[0][:-1]]

	#cut off projects/ and and replace md with html extension
	filenames = [f[9:-2] + 'html' for f in project_pages]
	file_titles = [x for x in zip(filenames, titles)]

	project_page = mylookup.get_template('project_page.mako')
	for i,f in enumerate(project_pages):
		print("rendering",f)
		rendered_page = md.convert(open(f).read()[article_offsets[i]:])

		out = open('projects/'+filenames[i], 'w')
		out.write(project_page.render(post=rendered_page, file_title=file_titles[i]))
		out.close()




#dict keys in each repo
#['open_issues', 'branches_url', 'owner', 'full_name', 'issues_url', 'updated_at', 'merges_url', 'clone_url', 'svn_url', 'watchers', 'html_url', 'forks', 'archive_url', 'watchers_count', 'contributors_url', 'git_tags_url', 'language', 'milestones_url', 'notifications_url', 'has_pages', 'has_issues', 'commits_url', 'forks_url', 'forks_count', 'git_refs_url', 'blobs_url', 'description', 'events_url', 'default_branch', 'has_wiki', 'homepage', 'keys_url', 'id', 'compare_url', 'tags_url', 'open_issues_count', 'stargazers_count', 'created_at', 'collaborators_url', 'languages_url', 'mirror_url', 'git_url', 'issue_comment_url', 'private', 'subscribers_url', 'issue_events_url', 'name', 'url', 'git_commits_url', 'statuses_url', 'pulls_url', 'assignees_url', 'trees_url', 'fork', 'subscription_url', 'size', 'downloads_url', 'labels_url', 'teams_url', 'comments_url', 'has_downloads', 'contents_url', 'pushed_at', 'releases_url', 'stargazers_url', 'ssh_url', 'hooks_url']

	#repojson = json.loads(urlopen('https://api.github.com/users/rswinkle/repos').read().decode('utf-8'))
	#repos = sorted([(x['name'], x['stargazers_count']) for x in repojson], reverse=True, key=lambda x: x[2])



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
		#print('opening',post)

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

	print('\n\n')
	
	tag_filenames = sorted([('/blog/tag_'+t+'.html', t) for t in tag_dict.keys()], key=lambda x: x[1])



	#group posts by year and month, reverse sort, strip off the key leaving lists of (struct_time, (file, title)) pairs
	#generate
	archive_groups = [(g[0], list(g[1])) for g in itertools.groupby(zip(dates, file_titles), lambda x: (x[0].tm_year, x[0].tm_mon))]
	archive_groups = sorted(archive_groups, reverse=True)
	archive_groups = [x[1] for x in archive_groups]
	archive = []
	for i in archive_groups:
		archive += [[(time.strftime("%B %Y", i[0][0])), [x[1] for x in i]]]


	if False:
		archive_index = mylookup.get_template('archive_index.mako')
		for i in archive_groups:
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

			out = open('blog/archive_'+ i[0] +'.html', 'w')
			out.write(tag_index.render(title=i[0], tag=t, posts=tposts, link_titles=i[1], dates=tdate_strs, tags=t_file_tags))

	#for i in archive_groups:

	for i in archive:
		i[0] += ' (' + str(len(i[1])) + ')'



	print('\n\n')
	print(archive)


	open('templates/sidebar.html', 'w').write(mylookup.get_template('sidebar.mako').render(link_titles=file_titles, tags=tag_filenames))
	print('\n\n')


	rendered_posts = []
	tfile_tags = []
	blog_post = mylookup.get_template('blog_post.mako')
	for i,f in enumerate(posts):
		rendered_posts += [md.convert(open(f).read()[article_offsets[i]:])]
		tfile_tags += [[('tag_'+t+'.html', t) for t in tags[i]]]

		out = open('blog/'+filenames[i], 'w')
		out.write(blog_post.render(post=rendered_posts[-1], file_title=file_titles[i], date=date_strs[i], tags=tfile_tags[-1]))
		out.close()
	

	blog_index = mylookup.get_template('blog.mako')
	open('blog/index.html', 'w').write(blog_index.render(posts=rendered_posts, link_titles=file_titles, dates=date_strs, tags=tfile_tags))


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
