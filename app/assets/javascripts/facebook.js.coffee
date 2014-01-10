window.fbAsyncInit = ->
  FB.init
    appId: document.getElementById("fb-root").getAttribute("data-app-id")
    channelUrl: document.getElementById("fb-root").getAttribute("data-channel-url")
    status: true,
    cookie: true,
    xfbml: true

  FB.Event.subscribe('auth.login', (response) ->
    window.location = window.location
  )
  FB.Canvas.setAutoGrow()
  FB.getLoginStatus((data) ->
    if (data.status == "connected")
      uid = data.authResponse.userID
      accessToken = data.authResponse.accessToken;
      FB.api("/me", (data) ->
        console.log("Hello #{data.name}")
      )
    else
      if (response.status == "not_authorized")
      # the user is logged in to Facebook,
      # but has not authenticated your app
      else
      # the user isn't logged in to Facebook.
    )

PageScript = document.getElementsByTagName("script")[0]
return if document.getElementById("FBScript")
FBScript = document.createElement("script")
FBScript.id = "FBScript"
FBScript.async = true
FBScript.src = "//connect.facebook.net/en_US/all.js"
PageScript.parentNode.insertBefore(FBScript, PageScript)