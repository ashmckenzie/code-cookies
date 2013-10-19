Template.whosOnline.helpers
  whosOnline: ->
    Meteor.presences.find()
