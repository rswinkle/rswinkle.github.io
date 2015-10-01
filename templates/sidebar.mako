<h2>Recent Posts</h2>
<ul>
% for post in link_titles:
	<li><a href="${post[0]}">${post[1]}</a></li>
% endfor
</ul>

<h2>Tags</h2>
<ul>
% for tag in tags:
	<li><a href="${tag[0]}">${tag[1]}</a></li>
% endfor
</ul>
<%doc>
<h2>Archives</h2>
<ul>
% for month in months:
	<li><a href="${post[0]}">${post[1]}</a></li>
% endfor
</ul>
</%doc>

