Handlebars.registerHelper 'gravatarImageUrl', ->
  user = Meteor.user()
  if user
    Gravatar.imageUrl(user.emails[0].address)
  else
    ''
