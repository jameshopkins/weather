module.exports = {
  entry: ['./index.js'],
  output: {
    path: './public',
    filename: 'index.js'
  },
  resolve: {
    modules: ['node_modules'],
    extensions: ['.js', '.elm']
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          plugins: ["transform-es2015-modules-commonjs"]
        }
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/, /Stylesheets\.elm/],
        loader: 'elm-webpack-loader'
      }
    ]
  }
};
