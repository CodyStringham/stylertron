# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  testArea = $('.test-area')
  codeOutput = $(".code-output")
  slider1 = $(".slider-one")
  slider2 = $(".slider-two")
  slider3 = $(".slider-three")
  color1 = $(".colpick_hex_field input")

  $("#slider1").slider
    range: "min"
    value: 1
    step: 1
    min: -100
    max: 100
    slide: (event, ui) ->
      slider1.trigger_events(ui.value)

  $("#slider2").slider
    range: "min"
    value: 1
    step: 1
    min: -100
    max: 100
    slide: (event, ui) ->
      slider2.trigger_events(ui.value)

  $("#slider3").slider
    range: "min"
    value: 1
    step: 1
    min: 0
    max: 100
    slide: (event, ui) ->
      slider3.trigger_events(ui.value)

  $("#radio").buttonset().on "click", ->
    testArea.shadowify()
    codeOutput.codeify()

  $("#picker").colpick
    layout: "rgbhex"
    color: "454545"
    onSubmit: (hsb, hex, rgb, el) ->
      $(el).colpickHide()
    onChange: (hsb,hex,rgb,el) ->
      $(this).trigger_events()

  $.fn.trigger_events = (new_value) ->
    $(this).val new_value
    testArea.shadowify()
    codeOutput.codeify()

  $.fn.shadowify = () ->
    if $('#radio2').next().attr("aria-pressed") == "true"
      @css '-webkit-box-shadow', "inset #{$(".slider-one").val()}px #{ $(".slider-two").val()}px #{$(".slider-three").val()}px ##{$(".colpick_hex_field input").val()}"
    else
      @css '-webkit-box-shadow', "#{$(".slider-one").val()}px #{ $(".slider-two").val()}px #{$(".slider-three").val()}px ##{$(".colpick_hex_field input").val()}"
    
  $.fn.codeify = () ->
    cssOuputString = "#{$('.slider-one').val()}px #{ $('.slider-two').val()}px #{$('.slider-three').val()}px ##{$('.colpick_hex_field input').val()}"
    if $('#radio2').next().attr("aria-pressed") == "true"
      @val 'box-shadow: ' + "inset " + cssOuputString + ";\n" +
        '-webkit-box-shadow: ' + "inset " + cssOuputString + ";\n" + 
        '-moz-box-shadow: ' + "inset " + cssOuputString + ";\n" + 
        '-o-box-shadow: ' + "inset " + cssOuputString + ";"
    else
      @val 'box-shadow: ' + cssOuputString + ";\n" +
        '-webkit-box-shadow: ' + cssOuputString + ";\n" + 
        '-moz-box-shadow: ' + cssOuputString + ";\n" + 
        '-o-box-shadow: ' + cssOuputString + ";"





