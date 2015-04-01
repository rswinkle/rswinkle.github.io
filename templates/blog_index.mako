<%inherit file="base.mako"/>
<h2>Posts</h2>
<ul>
% for post in posts:
	<li><a href="${post[0]}">${post[1]}</li>
% endfor
</ul>

<%block name="profiles">
</%block>
