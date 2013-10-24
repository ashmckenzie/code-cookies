# Meteor.startup ->

Meteor.subscribe 'codeCookies'
Meteor.subscribe 'notifications'
Meteor.subscribe 'userPresence'

Deps.autorun ->
  Meteor.subscribe 'comments', Session.get('currentCodeCookieId')
  Meteor.subscribe 'codeCookieSolutions', Session.get('currentCodeCookieId')
