<%inherit file="base.mako"/>
<%block name="title">
<title>Blog | Robert Winkler</title>
</%block>

<div class="row">

<div class="col-9 maincontent">
<%block name="maincontent">
	% for i in range(len(posts)):
		<article>

		<h1>
			<a href="${link_titles[i][0]}">${link_titles[i][1]}</a>
		</h1>

		<span class="datentags">
		${dates[i]}
		<span style="float:right;">
		#
		% for t in tags[i]:
				<a href="${t[0]}"> ${t[1]}</a>
		% endfor
		</span>
		</span>

		${posts[i]}
		</article>
		<br>
	% endfor
</%block>
</div><div class="col-3 sidebar">
<%include file="sidebar.html" />
</div>

</div>

