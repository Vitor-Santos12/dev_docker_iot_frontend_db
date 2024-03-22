const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true
})

vue.config.js

// module.exports = {
//   devServer: {
//     proxy: 'http://127.0.0.1:8081/produtos'
//   }
// }

module.exports = {
  devServer: {
    proxy: {
      '/produtos': {
        target: 'http://127.0.0.1:8081/',
        changeOrigin: true,
        pathRewrite: { '^/produtos': '' },

        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET',
          'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
        }
      }
    }
  }
}
