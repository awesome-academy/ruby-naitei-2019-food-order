'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  api_host: '"http://localhost:3000"',
  api_login_google: '"localhost:3000/auth/google_oauth2"'
})
