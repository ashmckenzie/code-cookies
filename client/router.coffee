Meteor.Router.add
  '/':                  'home',
  '/new':               'newCodeCookie',
  '/code-cookies/:_id':
    to: 'codeCookiePage',
    and: (id) ->
      Session.set('currentCodeCookieId', id)
