Meteor.methods
  upVote: (codeCookieSolutionId) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    codeCookieSolution = CodeCookieSolutions.findOne(codeCookieSolutionId)

    if !codeCookieSolution
      throw new Meteor.Error 422, 'Code Cookie solution not found'

    options = {
      $inc: { votes: 1 }
    }

    if _.include(codeCookieSolution.downVoters, user._id)
      options["$pull"] =  { downVoters: user._id }
    else
      options["$addToSet"] = { upVoters: user._id }


    CodeCookieSolutions.update(codeCookieSolution._id, options)

  downVote: (codeCookieSolutionId) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    codeCookieSolution = CodeCookieSolutions.findOne(codeCookieSolutionId)

    if !codeCookieSolution
      throw new Meteor.Error 422, 'Code Cookie solution not found'

    options = {
      $inc: { votes: -1 }
    }

    if _.include(codeCookieSolution.upVoters, user._id)
      options["$pull"] =  { upVoters: user._id }
    else
      options["$addToSet"] = { downVoters: user._id }

    CodeCookieSolutions.update(codeCookieSolution._id, options)
