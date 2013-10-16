Template.codeCookiePage.helpers
  currentCodeCookie: ->
    codeCookie = CodeCookies.findOne(Session.get('currentCodeCookieId'))

    if !codeCookie
      Meteor.Router.to('home')
    else
      codeCookie

  commentList: ->
    Comments.find({ codeCookieId: @._id }, { sort: { createdAt: -1 }})
