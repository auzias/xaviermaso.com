# xavier maso's website

  * powered by [expressjs](http://expressjs.com/)
  * running live at [xaviermaso.com](http://xaviermaso.com/)

### Build the js bundle

```
./node_modules/browserify/bin/cmd.js public/javascripts/main.js > public/javascripts/bundle.js
```

### Build the css bundle

```
./node_modules/stylus/bin/stylus public/stylesheets/main.css --include-css -o public/stylesheets/bundle.css
```

## Todo

  * minify front-end assets
  * get rid of gulp
  * test the code
