// thanks
// http://fredguest.com/2015/03/06/building-a-stateless-rails-api-with-react-and-twitter-oauth/
// for the tutorial for setting this webpack nonsense up

var path = require('path');

module.exports = {
  entry: ['./main.jsx'],
  output: {
    path: path.join(__dirname, 'public'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.css$/, loader: 'style!css' },
      { test: /\.jsx$/, loader: 'jsx-loader' },
      { test: /\.coffee$/, loader: 'coffee-loader' },
      { test: /\.scss$/, loader: 'style!css!sass' },
      { test: /\.(jpg|png|ttf|eot|svg|otf|woff(2)?)(\?[a-z0-9]+)?$/, loader: 'file-loader' }
    ]
  },
  plugins: []
};
