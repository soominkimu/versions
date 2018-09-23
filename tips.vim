# to run commands from a local node_modules/.bin
$ npx webpack
$ yarn list webpack   // check webpack versions

# webpack configuration
$ yarn add babel-loader babel-core babel-preset-env babel-preset-react --dev

# create a new file named .babelrc
{
  "presets": ["env", "react"]
}

# create webpack.config.js
module.exports = {
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  }
};

$ curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
