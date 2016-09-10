Shell = require 'shell'
format = require 'string-format';
conv = new (require 'showdown').Converter()

module.exports = HaskellHoogle =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'haskell-hoogle:lookup', => @lookup()

  getSearchText: () ->
    editor = atom.workspace.getActivePaneItem()
    return editor.getLastSelection().getText()

  lookup: ->
    hoogleUrlTemplate = atom.config.get('haskell-hoogle.hoogleUrl')
    text = @getSearchText()
    url = format(hoogleUrlTemplate, {query: text})
    req = new XMLHttpRequest()
    req.open("GET", url, false) #FIXME: this should be async
    req.send(null)
    reply = JSON.parse(req.responseText)
    if reply.parseError || reply.results.length == 0
      atom.notifications.addWarning('No documentation for "'+text+'"', {dismissable: true})
    else
      for res in reply.results
        htmlRes = '<span class="haskell-hoogle-notification-self">'+res.self+'</span>'+
                  '<br/>'+conv.makeHtml(res.docs)+
                  '<a class="haskell-hoogle-doc-link" href="'+res.location+'">doc</a>'
        atom.notifications.addInfo(htmlRes, {dismissable: true})

  config:
    hoogleUrl:
      title: 'Hoogle URL'
      type: 'string'
      description: '`{query}` will be replaced by the searched text; use `{{` and `}}` for writing curly braces.'
      default: 'https://www.haskell.org/hoogle/?mode=json&hoogle={query}&start=1&count=100'
