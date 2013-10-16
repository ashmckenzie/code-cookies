Meteor.publish 'codeCookies', ->
  CodeCookies.find()

Meteor.publish 'comments', (codeCookieId) ->
  Comments.find codeCookieId: codeCookieId

Meteor.publish 'notifications', ->
  Notifications.find()
