Entry = Backbone.Model.extend
    defaults:
        tag: ''
        title: ''
        description: ''

Entries = Backbone.Collection.extend
    model: Entry
    url: '/assets/data/entries.json'
    initialize: ->
        this.fetch
            success: ->
                Backbone.history.start()

AppView = Backbone.View.extend

    el: 'body'

    events:
        "click a.header-down": "scrollDown"

    scrollDown: (event) ->
        event.stopImmediatePropagation()
        $('html, body').animate { scrollTop: $('#projects').offset().top }, 400

EntryView = Backbone.View.extend

    el: '#site-entry-content'

    template: null

    initialize: ->
        $.ajax
            url: '/site-entry.hbs'
            method: 'GET'
            async: false
            context: this
            success: (data) ->
                this.template = Handlebars.compile data

    render: ->
        $(this.el).html this.template this.model.toJSON()

EntryRouter = Backbone.Router.extend
    routes:
        "": "showHome"
        "projects": "showProjectList"
        "projects/:page": "showProject"

    showHome: ->
        $('body').removeClass('expanded')
        $('body').css "background-color", ""

    showProjectList: ->
        $('body').removeClass('expanded')
        $('html, body').scrollTop $('#projects').offset().top
        $('html, body').animate { scrollTop: $('#projects').offset().top }, 400

    showProject: (page) ->
        matchingEntry = entries.findWhere({tag: page})

        if matchingEntry?
            entryView.model = matchingEntry
            $('body').addClass('expanded')
            entryView.render()

entries = new Entries
entryRouter = new EntryRouter
entryView = new EntryView
appView = new AppView
