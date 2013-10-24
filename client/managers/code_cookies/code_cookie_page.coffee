Template.codeCookiePage.helpers
  currentCodeCookie: ->
    codeCookie = CodeCookies.findOne(Session.get('currentCodeCookieId'))

    if !codeCookie
      Meteor.Router.to('home')
    else
      codeCookie

  showNewCodeCookieSolution: ->
    user = Meteor.user()

    if user
      CodeCookieSolutions.find(userId: user._id).count() == 0
    else
      false
