Handlebars.registerHelper 'currentUsergravatarImageUrl', ->
  user = Meteor.user()
  if user
    Gravatar.imageUrl user.emails[0].address
  else
    ''

Handlebars.registerHelper 'gravatarImageUrl', (email) ->
  Gravatar.imageUrl email
