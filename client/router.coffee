Meteor.Router.add
  '/':                  'home',
  '/new':               'newCodeCookie',
  '/code-cookies/:_id':
    to: 'codeCookiePage',
    and: (id) ->
      Session.set('currentCodeCookieId', id)

Meteor.Router.filters requireLogin: (page) ->
  if Meteor.user()
    page
  else if Meteor.loggingIn()
    'loading'
  else
    'accessDenied'

Meteor.Router.filter 'requireLogin',
  only: [ 'newCodeCookie' ]
