Meteor.Presence.state = ->
  {
    online: true,
    currentCodeCookieId: Session.get('currentCodeCookieId')
  }
