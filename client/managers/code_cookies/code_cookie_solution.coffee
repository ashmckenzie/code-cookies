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

    if userId
      if !@.upVoters || @.votes == 0 || !_.include(@.upVoters, userId)
        'votable'
      else
        'disabled'
    else
      'disabled'

  downVotedClass: ->
    userId = Meteor.userId()

    if userId
      if !@.downVoters || @.votes == 0 || !_.include(@.downVoters, userId)
        'votable'
      else
        'disabled'
    else
      'disabled'

