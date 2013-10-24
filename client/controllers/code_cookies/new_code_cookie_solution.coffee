Template.newCodeCookieSolution.rendered = ->

  editorImplementation = ace.edit('editor-implementation')
  editorImplementation.setTheme('ace/theme/tomorrow_night')
  editorImplementation.getSession().setMode('ace/mode/ruby')

  editorTest = ace.edit('editor-test')
  editorTest.setTheme('ace/theme/tomorrow_night')
  editorTest.getSession().setMode('ace/mode/ruby')

Template.newCodeCookieSolution.events "click .test-implementation": (e) ->

  e.preventDefault()

  # TODO: Fix up this dupe
  editorImplementation = ace.edit('editor-implementation')
  editorTest = ace.edit('editor-test')

  codeCookieSolution =
    implementation: editorImplementation.getValue()
    test: editorTest.getValue()

  $.post('http://localhost:9876/execute', codeCookieSolution, ->
    debugger
  )

  # Meteor.call 'newCodeCookie', codeCookieSolution, (error, id) ->
  #   console.log(error)
    # if (!error)
    #   Meteor.Router.to "home"
