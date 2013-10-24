Template.newComment.events 'submit form': (e, template) ->
  e.preventDefault()
  $content = $(e.target).find('[name=content]')

  comment =
    content: $content.val()
    codeCookieId: template.data._id

  Meteor.call 'newComment', comment, (error, commentId) ->
    if !error
      $content.val ''

