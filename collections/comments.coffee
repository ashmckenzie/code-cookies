@Comments = new Meteor.Collection('comments')

Meteor.methods
  newComment: (attrs) ->
    user = Meteor.user()

    if !user
      Errors.throw('You need to login to make comments')

    if !attrs.content
      Errors.throw('Please write some content')

    if !attrs.codeCookieId or !CodeCookies.findOne(attrs.codeCookieId)
      Errors.throw('You must comment on a code cookie')

    comment = _.extend(_.pick(attrs, 'codeCookieId', 'content'), {
      userId: user._id,
      email: user.emails[0].address,
      createdAt: new Date()
    })

    comment._id = Comments.insert(comment)
    createCommentNotification(comment)
    comment._id
