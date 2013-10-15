Template.codeCookiesList.helpers
  cookies: ->
    CodeCookies.find({}, { sort: { createdAt: -1 }})

  createdAtNice: ->
    moment(@.createdAt).format("DD/MM/YYYY hh:mm:ss A")
