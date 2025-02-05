var path = require('path')
var webpack = require('webpack')
var merge = require('webpack-merge')
var HtmlWebpackPlugin = require('html-webpack-plugin')
var MiniCssExtractPlugin = require('mini-css-extract-plugin')
var CopyWebpackPlugin = require('copy-webpack-plugin')
var UglifyJsPlugin = require('uglifyjs-webpack-plugin')
var OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin')

console.log('WEBPACK GO!')

// detemine build env
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development'

// common webpack config
var commonConfig = {
  output: {
    path: path.resolve(__dirname, 'dist/'),
    filename: '[hash].js'
  },

  resolve: {
    modules: ['node_modules'],
    extensions: ['.js', '.elm']
  },

  module: {
    noParse: /\.elm$/,
    rules: [
      {
        test: /\.(eot|svg|ttf|woff(2)?)(\?v=\d+\.\d+\.\d+)?/,
        use: 'url-loader'
      }
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'front/static/index.html',
      inject: 'body',
      filename: 'index.html'
    }),
    new webpack.EnvironmentPlugin({
      NODE_ENV: 'development'
    })
  ]
}

// additional webpack settings for prod env (when invoked via 'npm run dev')
if (TARGET_ENV === 'development') {
  console.log('Serving locally...')

  module.exports = merge(commonConfig, {
    entry: [
      path.join(__dirname, 'front/static/index.js')
    ],

    devServer: {
      contentBase: ['front/static/', 'front/static/documents/'],
      hot: true,
      host: '127.0.0.1',
      inline: true,
      port: 8080,
      progress: true
    },

    mode: 'development',

    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            {
              loader: 'elm-webpack-loader',
              options: {
                debug: true,
                forceWatch: true
              }
            }
          ]
        },
        {
          test: /\.(css|scss)$/,
          use: [
            { loader: 'style-loader', options: { sourceMap: true } },
            { loader: 'css-loader', options: { sourceMap: true } },
            { loader: 'postcss-loader', options: { sourceMap: true } },
            { loader: 'sass-loader', options: { sourceMap: true } }
          ]
        }
      ]
    },

    plugins: [
      new webpack.HotModuleReplacementPlugin()
    ]
  })
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if (TARGET_ENV === 'production') {
  console.log('Building for prod...')

  module.exports = merge(commonConfig, {
    entry: path.join(__dirname, 'front/static/index.js'),

    mode: 'production',

    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: 'elm-webpack-loader'
        },
        {
          test: /\.(css|scss)$/,
          use: [
            MiniCssExtractPlugin.loader,
            'css-loader',
            'postcss-loader',
            'sass-loader'
          ]
        }
      ]
    },

    optimization: {
      minimizer: [
        new UglifyJsPlugin(),
        new OptimizeCSSAssetsPlugin({})
      ]
    },

    plugins: [
      new CopyWebpackPlugin([
        {
          from: 'front/static/img/',
          to: 'static/img/'
        },
        {
          from: 'front/static/documents/xaviermaso.pdf',
          to: 'xaviermaso.pdf'
        },
        {
          from: 'front/static/documents/internship_report_2018.pdf',
          to: 'internship_report_2018.pdf'
        },
        {
          from: 'front/static/img/favicon.ico'
        }
      ]),

      // extract CSS into a separate file
      new MiniCssExtractPlugin({
        filename: '[hash].css',
        chunkFilename: '[id].[hash].css'
      })
    ]
  })
}
