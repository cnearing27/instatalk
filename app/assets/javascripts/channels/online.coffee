jQuery(document).on 'turbolinks:load', ->
  App.online = App.cable.subscriptions.create "OnlineChannel",
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      if data['user'].online && !document.querySelector("[data-user-id='#{data['user'].id}']")
        $('#online_users').append "<li data-user-id='#{data['user'].id}'>#{data['user'].nickname}</li>"
      else if !data['user'].online && data['user'].windows_counter == 0
        document.querySelector("[data-user-id='#{data['user'].id}']").remove()
