# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  #define scoped variables
  testArea = $('.test-area')
  codeOutput = $(".code-output")
  slider1 = $(".slider-one")
  slider2 = $(".slider-two")
  slider3 = $(".slider-three")

  #set up of each slider
  $(".slider").each ->
      begin = $(this).data("begin")
      end = $(this).data("end")
      $(this).slider
        range: "min"
        value: 10
        min: begin
        max: end
        slide: (event, ui) ->
          
          #update text box quantity
          slideramount = ("#" + $(this).attr("id") + "_amount")
          $(slideramount).val ui.value
          $(this).trigger_events()

      
      #initialise text box quantity
      slideramount = ("#" + $(this).attr("id") + "_amount")
      $(slideramount).val $(this).slider("value")

    
    #when text box is changed, update slider
    $(".amount").change ->
      value = @value
      selector = $("#" + @id.split("_")[0])
      selector.slider "value", value
      $(this).trigger_events()

  #initialise radio buttons for outer/inset
  $("#radio").buttonset().on "click", ->
    $(this).trigger_events()

  #initialise color picker
  $("#picker").colpick
    colorScheme: 'light'
    layout: "rgbhex"
    color: "454545"
    onSubmit: (hsb, hex, rgb, el) ->
      $(el).colpickHide()
    onChange: (hsb,hex,rgb,el) ->
      $(this).trigger_events()

  #this scoped variable must be defined after color picker initialisation
  colorPick = $(".colpick_hex_field input")

  #function that applies the CSS effect
  $.fn.shadowify = () ->
    cssStyleString = "#{slider1.val()}px #{slider2.val()}px #{slider3.val()}px ##{colorPick.val()}"
    if $('#radio2').next().attr("aria-pressed") == "true"
      @css
        'box-shadow': "inset " + cssStyleString
        '-webkit-box-shadow': "inset " + cssStyleString
        '-moz-box-shadow': "inset " + cssStyleString
        '-o-box-shadow': "inset " + cssStyleString
    else
      @css
        'box-shadow': cssStyleString
        '-webkit-box-shadow': cssStyleString
        '-moz-box-shadow': cssStyleString
        '-o-box-shadow': cssStyleString
    
  #function that updates the output text
  $.fn.codeify = () ->
    cssStyleString = "#{slider1.val()}px #{slider2.val()}px #{slider3.val()}px ##{colorPick.val()}"
    if $('#radio2').next().attr("aria-pressed") == "true"
      @val 'box-shadow: ' + "inset " + cssStyleString + ";\n" +
        '-webkit-box-shadow: ' + "inset " + cssStyleString + ";\n" + 
        '-moz-box-shadow: ' + "inset " + cssStyleString + ";\n" + 
        '-o-box-shadow: ' + "inset " + cssStyleString + ";"
    else
      @val 'box-shadow: ' + cssStyleString + ";\n" +
        '-webkit-box-shadow: ' + cssStyleString + ";\n" + 
        '-moz-box-shadow: ' + cssStyleString + ";\n" + 
        '-o-box-shadow: ' + cssStyleString + ";"

  #helper that calls both functions
  $.fn.trigger_events = () ->
    testArea.shadowify()
    codeOutput.codeify()

  #Initializes css output on page load
  codeOutput.codeify()




