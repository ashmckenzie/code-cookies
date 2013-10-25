Template.codeCookiesList.helpers
  cookies: ->
    CodeCookies.find({}, sort: { createdAt: -1 })
