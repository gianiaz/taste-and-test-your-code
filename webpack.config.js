var Encore = require('@symfony/webpack-encore');

Encore.setOutputPath('public/build/')
      .setPublicPath('/build')
      .cleanupOutputBeforeBuild()
      .autoProvidejQuery()
      .addEntry('app', './assets/js/app.js')
      .splitEntryChunks()
      .enableSingleRuntimeChunk();

module.exports = Encore.getWebpackConfig();


