Promise = require('promise')
$ = require('jquery');
 
# TODO i might want to make this a library, not a mixin
module.exports =
  getBaseUrl: ->
    devMode = process.env.NODE_ENV == 'development'
    if devMode then 'http://localhost:3000' else 'https://obscure-citadel-9804.herokuapp.com'

  getApiUrl: ->
    @getBaseUrl() + "/api/v1"

  fetchFromApi: (path, opts={}) ->
    data = opts.data
    
    Promise.resolve(
      $.ajax
        type: 'GET'
        url: @getApiUrl() + path
        data: data
        headers: { 'Authorization': @getJwt() }
    )

  fetchFromNonApi: (path, opts={}) ->
    data = opts.data
    
    Promise.resolve(
      $.ajax
        type: 'GET'
        url: @getBaseUrl() + path
        data: data
        headers: { 'Authorization': @getJwt() }
    )
