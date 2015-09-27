module.exports = {
  getBaseUrl: ->
    devMode = process.env.NODE_ENV == 'development'
    if devMode then 'http://localhost:3000' else 'https://obscure-citadel-9804.herokuapp.com'

  getApiUrl: ->
    @getBaseUrl() + "/api/v1"
}