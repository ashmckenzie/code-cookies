Template.codeCookieSolutions.rendered = ->
  prettyPrint()

Template.codeCookieSolutions.helpers
  showSolutions: ->
    # TODO: fix dupe
    CodeCookieSolutions.find(codeCookieId: this._id, { sort: { votes: -1, createdAt: -1 }}).count() > 0

  solutions: ->
    CodeCookieSolutions.find(codeCookieId: this._id, { sort: { votes: -1, createdAt: -1 }})
