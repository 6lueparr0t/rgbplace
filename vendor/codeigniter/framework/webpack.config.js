var webpack = require("webpack");

module.exports = {
  entry: './assets/js/common/src/main.js',
  output: { filename: 'bundle.js', path: './assets/js/common/' },
  module: {
    loaders: [
      { test: /\.js$/, loader: 'babel-loader', query: { presets: ['react', 'es2015'] } }],
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('production')
      }
    }),
    new webpack.optimize.UglifyJsPlugin()
  ]
};
