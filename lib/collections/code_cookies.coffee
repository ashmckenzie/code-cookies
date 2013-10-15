@CodeCookies = new Meteor.Collection('code_cookies')

Meteor.methods
  newCodeCookie: (attrs) ->
    user = Meteor.user()

    if (!user)
      Errors.throw('You need to login to create code cookies')

    codeCookie = _.extend(_.pick(attrs, 'name', 'content'),
      userId: user._id,
      userEmail: user.emails[0].address,
      createdAt: new Date().getTime()
    )

    codeCookie._id = CodeCookies.insert(codeCookie)
