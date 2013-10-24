Template.whosOnline.helpers
  whosOnline: ->
    # Not sure why we get dupes, but we do :(
    #
    onlineUserIds = []

    _.reject(Meteor.presences.find().fetch(), (e) ->
      if _.contains(onlineUserIds, e.userId)
        true
      else
        onlineUserIds.push(e.userId)
        false
    )
