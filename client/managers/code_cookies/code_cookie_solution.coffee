Template.codeCookieSolution.events
  'click .up-vote.votable': (e) ->
    e.preventDefault()
    Meteor.call('upVote', this._id)

  'click .down-vote.votable': (e) ->
    e.preventDefault()
    Meteor.call('downVote', this._id)

Template.codeCookieSolution.helpers
  upVotedClass: ->
    userId = Meteor.userId()

    return 'votable'

    if userId
      if !@.upVoters || !_.include(@.upVoters, userId)
        'votable'
      else
        'disabled'
    else
      'disabled'

  downVotedClass: ->
    userId = Meteor.userId()

    return 'votable'

    if userId
      if !@.downVoters || !_.include(@.downVoters, userId)
        'votable'
      else
        'disabled'
    else
      'disabled'

