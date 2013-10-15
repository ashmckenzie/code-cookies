@Comments = new Meteor.Collection('comments')

Meteor.methods
  comment: (commentAttributes) ->
    # comment._id = Comments.insert(comment)
    # createCommentNotification(comment)
    # comment._id
