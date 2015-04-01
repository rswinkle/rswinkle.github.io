<html>
<%block name"header">
	<head>
	<style type="text/css">
	body {margin-left:15%; margin-right:15%; background-color:#B0C4DE; font-family:verdana;}
	</style>

	<title>Robert Winkler's site</title>
	</head>
</%block>

<body>

<%block name="navigation">
	<h1 style="text-align:center">Robert Winkler</h1>
	<table style="margin-right:auto; margin-left:auto; width:40%">
		<tr style="text-align:center">
			<td><a href="http://rswinkle.github.io">Home</a></td>
			<td><a href="http://rswinkle.github.io/blog/blog_index.html">Blog</a></td>
			<td><a href="http://rswinkle.github.io/projects.html">Projects</a></td>
			<td><a href="http://rswinkle.github.io/about.html">About</a></td>
		</tr>
	</table>
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
