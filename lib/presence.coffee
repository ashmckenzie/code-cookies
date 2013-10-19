Meteor.Presence.state = ->
  {
    online: true,
    gravatarImageUrl: gravatarImageUrl(),
    currentCodeCookieId: Session.get('currentCodeCookieId')
  }

gravatarImageUrl = ->
  if Meteor.user()
    Gravatar.imageUrl Meteor.user().emails[0].address
  else
    null
