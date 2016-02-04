## -*- coding: utf-8 -*-
<!DOCTYPE html>
<%block name="header">
	<head>
	<%block name="title">
	<title>Robert Winkler</title>
	</%block>

	<link rel="stylesheet" type="text/css" href="/css/global.css">
	<meta charset="utf-8" />
	<script type="text/javascript" src="/scripts/changetheme.js"></script>

	</head>
</%block>

<body>

<%block name="navigation">
	<div class="navbar">
		<div class="container flex">
			<div>
			<h1>Robert Winkler</h1>
			<a id="theme" href="#dark" onclick="change('/css/global.css', '/css/dark.css');">Dark Theme</a>
			</div>
			<table>
				<tr>
					<td><a href="/">Home</a></td>
					<td><a href="/blog/">Blog</a></td>
					<td><a href="/projects/">Projects</a></td>
				</tr>
			</table>
		</div>
	</div>
</%block>

<div class="container">
${next.body()}
</div>

<%block name="profiles">
	<div class="footer">
		<div class="container flex">
			<a href="https://github.com/rswinkle">
				<img alt="github" src="/images/icons/github.svg">
			</a>
			<a href="https://www.linkedin.com/in/rswinkle">
				<img alt="linkedin" src="/images/icons/linkedin.svg">
			</a>
			<a href="https://www.google.com/+RobertWinkler25">
				<img alt="google+" src="/images/icons/google+.svg">
			</a>
			<a href="https://www.goodreads.com/user/show/909505-robert">
				<img alt="goodreads" src="/images/icons/goodreads.svg">
			</a>
			<a href="https://twitter.com/robertwinkler9">
				<img alt="twitter" src="/images/icons/twitter.svg">
			</a>
			<a href="https://stackoverflow.com/users/2624136/rswinkle">
				<img alt="stackoverflow" src="/images/icons/stackoverflow.svg">
			</a>
			<a href="http://www.youtube.com/c/RobertWinkler25">
				<img alt="youtube" src="/images/icons/youtube.svg">
			</a>
			<a href="https://www.reddit.com/user/robert_winkler/">
				<img alt="reddit" src="/images/icons/reddit.svg">
			</a>
		</div>
	</div>
	<p class="container" style="font-size:0.75em;color:#b3b3b3;text-align:center;">
		© Robert Winkler, 2010 - 2016. Site design based closely on
		<a href="http://www.michaelfogleman.com/">Michael Fogelman's awesome site</a>.
	</p>
</%block>

</body>

</html>
