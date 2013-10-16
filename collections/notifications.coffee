@Notifications = new Meteor.Collection('notifications')

Notifications.allow
  update: ownsDocument

@createCommentNotification = (comment) ->
  codeCookie = CodeCookies.findOne(comment.codeCookieId)

  if comment.userId isnt codeCookie.userId
    Notifications.insert
      userId: codeCookie.userId
      codeCookieId: codeCookie._id
      commentId: comment._id
      commenterEmail: comment.email
      read: false
