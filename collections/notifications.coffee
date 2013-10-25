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
      userEmail: comment.userEmail
      action: 'commented'
      read: false

@createSolutionNotification = (codeCookieSolution) ->
  codeCookie = CodeCookies.findOne(codeCookieSolution.codeCookieId)

  # if codeCookieSolution.userId isnt codeCookie.userId
  Notifications.insert
    userId: codeCookieSolution.userId
    codeCookieId: codeCookie._id
    codeCookieSolutionId: codeCookieSolution._id
    userEmail: codeCookieSolution.userEmail
    action: 'provided a solution'
    read: false
