<%inherit file="base.mako"/>

<div class="mainbody">

<div class="maincontent">

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
</div>

<div class="sidebar">
<h2>Recent Posts</h2>
<ul>
% for post in link_titles:
	<li><a href="${post[0]}">${post[1]}</a></li>
% endfor
</ul>
</div>

</div>

<%block name="profiles">
</%block>
