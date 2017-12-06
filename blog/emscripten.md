Playing With Emscripten and WebAssembly
==================
OpenGL C C++ Web
December 6, 2017

So a little over a month ago, I thought it would be cool to try out emscripten and
WebAssembly with one of my students.  We had previously done some "hello world"
type graphics programs and a simple game port and I thought it'd be fun to see
how easy (or not) it was to get those to run in the browser.

While I think it was a good exercise, and emscripten is much better than it was a
couple years ago, I don't think it's ready for primetime yet.  You *cannot* simply
compile your existing graphics/game code and expect it to work.  If you're lucky
you only have to make a few minor changes and with an #ifdef you can use the same
code for your regular executable to.  If you're not, you might have to re-do your
whole program because of the limitations emscripten (which are really the limitations
of the browser/DOM rendering model.  These include turning infinite loops into callback
functions and restricting yourself to OpenGL ES 2/3 which gets translated to WebGL 1/2.

In any case, here are our results:

* [sdl2_template](../projects/emscripten/smallest.html)
* [sdl2_gl_template](../projects/emscripten/smallest_sdl_gl.html)
* [sdl2_interactive](../projects/emscripten/testing.html)

For some reason we could not get file loading to work and the movement in sdl2_interactive is very
inconsistent for no reason that we could determine.  We originally wanted to port [simulate](https://github.com/rswinkle/inventwithpython_pysdl2/blob/master/simulate_pysdl2.py)
which we had previously already ported to C but due to the mainloop callback requirement, it would have required a complete redesign.

Useful links:

* [Execution Environment](https://kripken.github.io/emscripten-site/docs/porting/emscripten-runtime-environment.html)
* [OpenGL Support](https://kripken.github.io/emscripten-site/docs/porting/multimedia_and_graphics/OpenGL-support.html)
* [Tutorial](https://lyceum-allotments.github.io/2016/06/emscripten-and-sdl-2-tutorial-part-1/)



