Template.codeCookieSolutions.rendered = ->
  prettyPrint()

Template.codeCookieSolutions.helpers
  solutions: ->
    CodeCookieSolutions.find(codeCookieId: this._id, { sort: { votes: -1, createdAt: -1 }})
