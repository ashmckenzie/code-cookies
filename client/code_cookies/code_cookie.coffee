Template.codeCookie.rendered = ->
  editor = ace.edit('editor')
  editor.setTheme('ace/theme/monokai')
  editor.getSession().setMode('ace/mode/ruby')
  editor.setReadOnly(true)
