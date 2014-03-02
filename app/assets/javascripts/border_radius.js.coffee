# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  colorTest = $('.color-test')

  $('#picker').colpick
    onChange: (hsb,hex,rgb,el) ->
      $(".color-test").shadowify()
      $(".code-output").codeOutput()
      # $('.color-test').css('background-color', '#'+hex);
      # $(el).colpickHide();

  $('#boxer').colpick
    onChange: (hsb,hex,rgb,el) ->
      $('.color-test').css('background-color', '#'+hex);
      # $(el).colpickHide();
      $(".code-output").codeOutput()
    
  $("#slider1").slider
    range: "min"
    value: 1
    step: 5
    min: 0
    max: 400
    slide: (event, ui) ->
      $(".slider-one").trigger_events(ui.value)
      return

  $("#slider2").slider
    range: "min"
    value: 1
    step: 5
    min: 0
    max: 400
    slide: (event, ui) ->
      $(".slider-two").trigger_events(ui.value)
      return

  $("#slider3").slider
    range: "min"
    value: 1
    step: 5
    min: 0
    max: 400
    slide: (event, ui) ->
      $(".slider-three").trigger_events(ui.value)
      return

 
  $.fn.trigger_events = (new_value) ->
    $(this).val new_value
    $(".color-test").shadowify()
    $(".code-output").codeOutput()

  $.fn.shadowify = () ->
    @css '-webkit-box-shadow', "#{$(".slider-one").val()}px #{ $(".slider-two").val()}px #{$(".slider-three").val()}px ##{$(".colpick_hex_field input").val()}"
    
  $.fn.codeOutput = () ->
    console.debug $(".colpick_hex_field input").last().val()
    css_long_ass_string = "#{$('.slider-one').val()}px #{ $('.slider-two').val()}px #{$('.slider-three').val()}px ##{$('.colpick_hex_field input').val()}"
    @val 'box-shadow: ' + css_long_ass_string + ";\n" + '
      -webkit-box-shadow: ' + css_long_ass_string + ";\n" + 
      '-moz-box-shadow: ' + css_long_ass_string + ";\n" + 
      '-o-box-shadow: ' + css_long_ass_string + ";\n" + 
      "background-color: " + "##{$('.colpick_hex_field input').last().val()}"






