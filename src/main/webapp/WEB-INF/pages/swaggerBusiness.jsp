<!DOCTYPE html>
<html>
<head>
  <title>Swagger UI</title>
  <link href='//fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
  <link href='css/highlight.default.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
  <script type="text/javascript" src="lib/shred.bundle.js"></script>
  <script src='lib/jquery-1.8.0.min.js' type='text/javascript'></script>
  <script src='lib/jquery.slideto.min.js' type='text/javascript'></script>
  <script src='lib/jquery.wiggle.min.js' type='text/javascript'></script>
  <script src='lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
  <script src='lib/handlebars-1.0.0.js' type='text/javascript'></script>
  <script src='lib/underscore-min.js' type='text/javascript'></script>
  <script src='lib/backbone-min.js' type='text/javascript'></script>
  <script src='lib/swagger.js' type='text/javascript'></script>
  <script src='swagger-ui.js' type='text/javascript'></script>
  <script src='lib/highlight.7.3.pack.js' type='text/javascript'></script>
  <script src='lib/swagger-oauth.js' type='text/javascript'></script>

  <script type="text/javascript">
    var clientId = "your-client-id";
    var realm = "your-realm";

    $(function() {
      var docLocation = window.location.origin + "/swagger-springmvc-demo/api-docs/business-api";
      window.swaggerUi = new SwaggerUi({
            url: docLocation,
            dom_id: "swagger-ui-container",
            onComplete: function(swaggerApi, swaggerUi) {
              if (typeof initOAuth == "function")
                initOAuth();
            },
            onFailure: function(data) {
              if (console) {
                console.log("Unable to Load SwaggerUI");
              }
            },
            docExpansion: "none"
          }
      );

      $('#input_apiKey').change(function() {
        var key = $('#input_apiKey')[0].value;
        console.log("key: " + key);
        if (key && key.trim() != "") {
          console.log("added key " + key);
          window.authorizations.add("key", new ApiKeyAuthorization("api_key", key, "query"));
        }
      })
      window.swaggerUi.load();
    });
  </script>


</head>

<body>
<div id='header'>
  <div class="swagger-ui-wrap">
    <a id="logo" href="http://swagger.wordnik.com">swagger</a>

    <form id='api_selector'>
      <div class='input icon-btn'>
        <img id="show-pet-store-icon" src="images/pet_store_api.png" title="Show Swagger Petstore Example Apis">
      </div>
      <div class='input icon-btn'>
        <img id="show-wordnik-dev-icon" src="images/wordnik_api.png" title="Show Wordnik Developer Apis">
      </div>
      <div class='input'><input placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl" type="text"/></div>
      <div class='input'><input placeholder="api_key" id="input_apiKey" name="apiKey" type="text"/></div>
      <div class='input'><a id="explore" href="#">Explore</a></div>
    </form>
  </div>
</div>

<div id="message-bar" class="swagger-ui-wrap">
  &nbsp;
</div>

<div id="swagger-ui-container" class="swagger-ui-wrap">

</div>

</body>

</html>
