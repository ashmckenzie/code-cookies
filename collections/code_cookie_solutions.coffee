@CodeCookieSolutions = new Meteor.Collection('code_cookie_solutions')

Meteor.methods
  newCodeCookieSolution: (attrs) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    if !attrs.implementation
      throw new Meteor.Error 422, 'You need an implementation'

    if !attrs.codeCookieId
      throw new Meteor.Error 422, 'You should only post solutions against a valid Code Cookie'

    codeCookieSolution = _.extend(_.pick(attrs, 'codeCookieId', 'implementation', 'description'),
      userId: user._id,
      userEmail: user.emails[0].address,
      votes: 0,
      upVoters: [],
      downVoters: [],
      createdAt: new Date().getTime()
    )

    codeCookieSolution._id = CodeCookieSolutions.insert(codeCookieSolution)

    CodeCookies.update(codeCookieSolution.codeCookieId, $inc: { solutionCount: 1 })

    createSolutionNotification(codeCookieSolution)
    codeCookieSolution._id
