# HTML5 Build Tools

This repo contains the build tools that are used to compress and minimize javascript, css, and html files for web deployment.

# Use

Include this repo as a submodule in the root of your project. Then make a copy of `sample-build.sh` and place it in the root of your project folder. You can use the following to do so:

	:::bash
	git submodule add https://github.com/psyrendust/html5-build-tools.git tools;
	cp tools/sample-build.sh build.sh;

Edit the `build.sh` script to include any files that you would like to process for deployment.

# Compression for deployment

When you are ready to deploy to your server, please run `./build.sh` from the root of your project folder. This will generate a `publish` folder and run htmlcompressor on the html files and yuicompressor on all of the css and js files that you have defined in the `build.sh` script. Please use the assets in the publish folder when uploading to your server.