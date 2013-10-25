Meteor.methods
  upVote: (codeCookieSolutionId) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    codeCookieSolution = CodeCookieSolutions.findOne(codeCookieSolutionId)

    if !codeCookieSolution
      throw new Meteor.Error 422, 'Code Cookie solution not found'

    CodeCookieSolutions.update(
      codeCookieSolution._id, {
        $addToSet: { upVoters: user._id },
        $pull: { downVoters: user._id },
        $inc: { votes: 1 }
      }
    )

  downVote: (codeCookieSolutionId) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    codeCookieSolution = CodeCookieSolutions.findOne(codeCookieSolutionId)

    if !codeCookieSolution
      throw new Meteor.Error 422, 'Code Cookie solution not found'

    CodeCookieSolutions.update(
      codeCookieSolution._id, {
        $addToSet: { downVoters: user._id },
        $pull: { upVoters: user._id },
        $inc: { votes: -1 }
      }
    )

