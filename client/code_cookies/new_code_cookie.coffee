Template.newCodeCookie.rendered = ->
  editor = ace.edit("editor")
  editor.setTheme("ace/theme/monokai")
  editor.getSession().setMode("ace/mode/ruby")

Template.newCodeCookie.events "submit form": (e) ->
  e.preventDefault()
  editor = ace.edit("editor")

  codeCookie =
    name: $(e.target).find("[name=name]").val()
    description: $(e.target).find("[name=description]").val()
    content: editor.getValue()

  Meteor.call 'newCodeCookie', codeCookie, (error, id) ->
    if (!error)
      Meteor.Router.to "home"
