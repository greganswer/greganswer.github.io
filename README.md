# Portfolio

- [Production](#production)
  - [Deployment](#deployment)
  - [GitHub pages](#github-pages)
- [Development](#development)
  - [Troubleshooting](#troubleshooting)
    - [Branch named 'master' already exists](#branch-named-master-already-exists)
- [References](#references)

## Production

### Deployment

Commit your changes, on the `source` branch, then run the following command:

    yarn deploy

### GitHub pages

If you wish to have a custom domain for you portfolio, 

1. Add the [copy-webpack-plugin](https://www.npmjs.com/package/copy-webpack-plugin)
1. Add a `CNAME` file to the `src` folder with your custom domain in it. E.g: `greganswer.com`
1. Add the following to the `plugins` section of `webpack.common.js` file:

    ```javascript
    // This config allows to use jQuery $ sign
      plugins: [
        new CopyWebpackPlugin([
          'src/CNAME'
        ]),
      ]
    ```

Reference: [Custom domain gets deleted on deploy - CNAME not working](https://github.com/tschaub/gh-pages/issues/236)

## Development

### Troubleshooting

#### Branch named 'master' already exists

If you see the following error:

    ProcessError: fatal: A branch named 'master' already exists.

Run the following command:

    rm -rf node_modules/gh-pages/.cache

## References 

- https://dev.to/javascripterika/deploy-a-react-app-as-a-github-user-page-with-yarn-3fka
- https://medium.com/@hossainkhan/using-custom-domain-for-github-pages-86b303d3918a
- https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site
- https://github.com/tschaub/gh-pages/issues/27