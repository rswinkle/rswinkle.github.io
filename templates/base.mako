<!DOCTYPE html>
<%block name="header">
	<head>
	<link rel="stylesheet" type="text/css" href="/css/global.css">
	<%block name="title">
	<title>Robert Winkler</title>
	</%block>
	</head>
</%block>

<body>

	<%block name="navigation">
		<div class="navbar">
			<div class="container flex">
				<h1>Robert Winkler</h1>
				<table>
					<tr>
						<td><a href="/index.html">Home</a></td>
						<td><a href="/blog/blog_index.html">Blog</a></td>
						<td><a href="/projects.html">Projects</a></td>
						<td><a href="/about.html">About</a></td>
					</tr>
				</table>
			</div>
		</div>
	</%block>

	<div class="container">
	${next.body()}
	</div>

	<%block name="profiles">
	<%doc>
		<h4>Online Profiles:</h4>
		<ul>
			<li><a href="http://www.linkedin.com/pub/robert-winkler/25/605/596">LinkedIn</a></li>
			<li><a href="https://github.com/rswinkle">Github</a></li>
			<li><a href="https://www.openhub.net/accounts/robert_winkler">Open HUB</a></li>
		</ul>
	</%doc>
	</%block>

</body>

</html>
