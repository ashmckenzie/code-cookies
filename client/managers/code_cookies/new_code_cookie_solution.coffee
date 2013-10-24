Template.newCodeCookieSolution.rendered = ->

  editorImplementation = ace.edit('editor-implementation')
  editorImplementation.setTheme('ace/theme/tomorrow_night')
  editorImplementation.getSession().setMode('ace/mode/ruby')

  # editorTest = ace.edit('editor-test')
  # editorTest.setTheme('ace/theme/tomorrow_night')
  # editorTest.getSession().setMode('ace/mode/ruby')

Template.newCodeCookieSolution.events "submit form": (e, template) ->
  e.preventDefault()

  # TODO: Fix up this dupe
  editorImplementation = ace.edit('editor-implementation')

  codeCookieSolution =
    codeCookieId: template.data._id,
    implementation: editorImplementation.getValue(),
    description: $(e.target).find("[name=description]").val()

  Meteor.call 'newCodeCookieSolution', codeCookieSolution, (error, id) ->
    if error
      Errors.throw error.reason

# Template.newCodeCookieSolution.events "click .test-implementation": (e) ->

#   e.preventDefault()

#   # TODO: Fix up this dupe
#   editorImplementation = ace.edit('editor-implementation')
#   editorTest = ace.edit('editor-test')

#   codeCookieSolution =
#     implementation: editorImplementation.getValue(),
#     test: editorTest.getValue()

#   # $.post('http://localhost:9876/execute', codeCookieSolution, (data, textStatus, jqXHR) ->
#   #   debugger
#   # )
