Template.codeCookieBrief.helpers
  createdAtNice: ->
    moment(@.createdAt).format("dddd, MMMM Do YYYY, h:mm:ss A")
