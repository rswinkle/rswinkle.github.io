<!DOCTYPE html>
<%block name="header">
	<head>
	<link rel="stylesheet" type="text/css" href="/css/global.css">
	<title>Robert Winkler's site</title>
	</head>
</%block>

<body>

<%block name="navigation">
	<div class="navbar">
		<h1>Robert Winkler</h1>
		<table>
			<tr>
				<td><a href="http://rswinkle.github.io">Home</a></td>
				<td><a href="http://rswinkle.github.io/blog/blog_index.html">Blog</a></td>
				<td><a href="http://rswinkle.github.io/projects.html">Projects</a></td>
				<td><a href="http://rswinkle.github.io/about.html">About</a></td>
			</tr>
		</table>
	</div>
</%block>

${next.body()}

<%block name="profiles">
	<h4>Online Profiles:</h4>
	<ul>
		<li><a href="http://www.linkedin.com/pub/robert-winkler/25/605/596">LinkedIn</a></li>
		<li><a href="https://github.com/rswinkle">Github</a></li>
		<li><a href="https://www.openhub.net/accounts/robert_winkler">Open HUB</a></li>
	</ul>
</%block>

</body>

</html>
