Meteor.publish 'codeCookies', ->
  CodeCookies.find()

Meteor.publish 'comments', (codeCookieId) ->
  Comments.find codeCookieId: codeCookieId

Meteor.publish 'codeCookieSolutions', (codeCookieId) ->
  CodeCookieSolutions.find codeCookieId: codeCookieId

Meteor.publish 'notifications', ->
  Notifications.find()

Meteor.publish 'userPresence', ->
  Meteor.presences.find {}, { fields: { state: true, userId: true }}
