Template.codeCookiePage.helpers
  currentCodeCookie: ->
    codeCookie = CodeCookies.findOne(Session.get('currentCodeCookieId'))

    if !codeCookie
      Meteor.Router.to('home')
    else
      codeCookie

  showNewCodeCookieSolution: ->
    true
