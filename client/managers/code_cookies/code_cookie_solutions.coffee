Template.codeCookieSolutions.rendered = ->
  prettyPrint()

Template.codeCookieSolutions.helpers
  solutions: ->
    CodeCookieSolutions.find(codeCookieId: this._id)
