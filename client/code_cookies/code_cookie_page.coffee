Template.codeCookiePage.helpers
  currentCookie: ->
    CodeCookies.findOne(Session.get('currentCodeCookieId'))
