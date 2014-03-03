# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  testArea = $('.test-area')
  codeOutput = $(".code-output")
  slider1 = $(".slider-one")
  slider2 = $(".slider-two")
  slider3 = $(".slider-three")

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

    
    #When text box is changed, update slider
    $(".amount").change ->
      value = @value
      selector = $("#" + @id.split("_")[0])
      selector.slider "value", value
      $(this).trigger_events()


  $("#radio").buttonset().on "click", ->
    testArea.shadowify()
    codeOutput.codeify()

  $("#picker").colpick
    colorScheme: 'light'
    layout: "rgbhex"
    color: "454545"
    onSubmit: (hsb, hex, rgb, el) ->
      $(el).colpickHide()
    onChange: (hsb,hex,rgb,el) ->
      $(this).trigger_events()

  $.fn.trigger_events = (new_value) ->
    testArea.shadowify()
    codeOutput.codeify()

  colorPick = $(".colpick_hex_field input")

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







