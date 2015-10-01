<%inherit file="blog.mako"/>
<%block name="title">
<title>${file_title[1]} | Robert Winkler</title>
</%block>

<%block name="maincontent">
	<article>
	<h1><a href="${file_title[0]}">${file_title[1]}</a></h1>

	<%block name="datentags">
		<span class="datentags">
		${date}
		<span style="float:right;">
		#
		% for tag in tags:
			<a href="${tag[0]}"> ${tag[1]}</a>
		% endfor
		</span>
		</span>
	</%block>


	${post}
	</article>
</%block>



