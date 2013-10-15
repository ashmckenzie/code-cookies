Template.newCodeCookie.rendered = ->
  editor = ace.edit("editor")
  editor.setTheme("ace/theme/monokai")
  editor.getSession().setMode("ace/mode/ruby")

  editor.focus()

Template.newCodeCookie.events "submit form": (e) ->
  e.preventDefault()
  editor = ace.edit("editor")

  codeCookie =
    name: $(e.target).find("[name=name]").val()
    content: editor.getValue()
    userId: Meteor.user()._id
    userEmail: Meteor.user().emails[0].address

  codeCookie._id = CodeCookies.insert(codeCookie)
  Meteor.Router.to "home"
