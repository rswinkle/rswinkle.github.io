<%inherit file="base.mako"/>

<div class="row">
	<div class="col-9">
		<p class="lead">
		My name is Robert Winkler.  I live in Scottsdale, AZ and have lived in the valley for
		most of my life.  I am a programmer and my favorite languages are C and Python.
		I'm most interested in OpenGL/3D Graphics and low level/embedded/system programming.
		I enjoy <a href="https://www.goodreads.com/review/list/909505-robert">reading,</a>
		running, biking, playing frisbee, and working on <a href="/projects/">my programming projects.</a>
		If you find something interesting or useful, there are several ways you can
		<a href="/donations.html">support</a> my work.
		</p>
	</div><div class="col-3">
		<img src="https://secure.gravatar.com/avatar/bc9865f852b212f4f5f7dc428a5b856f?s=512" style="display:block; margin:auto;">
		<h3 style="text-align: center;">My Current Gravatar</h3>
	</div>
</div>

<div class="row">
	<div class="col-9">
		<h2>Recent Posts</h2>
		<ul style="list-style:none; padding:0; margin:0">
		% for post in link_titles:
			<li><a href="${post[0]}">${post[1]}</a></li>
		% endfor
		</ul>
	</div><div class="col-3">
		<h2>Most recent Project</h2>
		<ul>
			<li class="imgblock">
				<a href="/projects/sdl_img.html">
				<img alt="sdl_img" src="/images/sdl_img.png">
				</a>
				<h3>sdl_img</h3>
			</li>
		</ul>
	</div>
</div>
