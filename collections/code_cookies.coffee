@CodeCookies = new Meteor.Collection('code_cookies')

Meteor.methods
  newCodeCookie: (attrs) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'You need to login to create code cookies'

    if !attrs.name
      throw new Meteor.Error 422, 'You need a name'

    if !attrs.description
      throw new Meteor.Error 422, 'You need a description'

    if !attrs.content
      throw new Meteor.Error 422, 'You need some content'

    codeCookie = _.extend(_.pick(attrs, 'name', 'description', 'content'),
      userId: user._id,
      userEmail: user.emails[0].address,
      commentCount: 0,
      solutionCount: 0,
      createdAt: new Date().getTime()
    )

    codeCookie._id = CodeCookies.insert(codeCookie)
