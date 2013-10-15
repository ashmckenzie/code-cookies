Template.codeCookie.rendered = ->
  editor = ace.edit('editor')
  editor.setTheme('ace/theme/monokai')
  editor.getSession().setMode('ace/mode/ruby')
  editor.setReadOnly(true)

Template.codeCookie.helpers
  createdAtNice: ->
    moment(@.createdAt).format("dddd, MMMM Do YYYY, h:mm:ss A")
