Handlebars.registerHelper 'dateNice', (date) ->
  moment(date).format("DD/MM/YYYY hh:mm:ss A")
