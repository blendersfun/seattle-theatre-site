seattle-theatre-site
====================

A site for finding theatrical productions in Seattle, and educating oneself about theatre art both generally, and as it pertains to the Seattle scene.

## Build Stuff, So Far:

Was able to use browserify like this:
browserify client/index.jsx public/index.js

However, realized what I really wanted was a jsx -> js transform for server consumption. This worked:
jsx -x jsx client/ public/

These commands require global installs of: browserify, react-tools.
