# xavier maso's website

  ![](https://travis-ci.org/Pamplemousse/xaviermaso.com.svg?branch=master)

  * powered by [expressjs](http://expressjs.com/)
  * running live at [xaviermaso.com](http://xaviermaso.com/)

## development

```bash
# automatically bundle js and css on change
npm run watch
```

## bundle the assets

```bash
# bundle and minify css, js and fonts
npm run build
```

## run the app
```bash
docker run \
  --name xaviermaso.com \
  -e NODE_ENV=production \
  -p 8080:8000 \
  pamplemousse/xaviermaso.com
```
