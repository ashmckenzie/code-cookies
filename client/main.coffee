# Meteor.startup ->

Meteor.subscribe 'codeCookies'
Meteor.subscribe 'notifications'

Deps.autorun ->
  Meteor.subscribe 'comments', Session.get('currentCodeCookieId')
