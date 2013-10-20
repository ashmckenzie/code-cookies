Template.codeCookieComments.helpers

  commentList: ->
    Comments.find({ codeCookieId: @._id }, { sort: { createdAt: -1 }})
