Meteor.publish 'codeCookies', ->
  CodeCookies.find()

Meteor.publish 'notifications', ->
  Notifications.find()
