Template.codeCookiesList.helpers
  cookies: ->
    CodeCookies.find({}, { sort: { createdAt: -1 }})

  createdAtNice: ->
    moment(@.createdAt).format("dddd, MMMM Do YYYY, h:mm:ss A")
