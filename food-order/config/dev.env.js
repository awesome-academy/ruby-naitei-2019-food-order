'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  api_host: '"http://localhost:3000"',
  cross_host: '"http://localhost:3000/cross"',
  api_login_google: '"localhost:3000/auth/google_oauth2"',
  token_cookie: '"jwt_access"'
})
