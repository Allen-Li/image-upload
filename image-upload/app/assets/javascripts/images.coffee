# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready ($) ->
  options = 
    $AutoPlay: true
    $ArrowNavigatorOptions: $Class: $JssorArrowNavigator$
    $ThumbnailNavigatorOptions:
      $Class: $JssorThumbnailNavigator$
      $Cols: 9
      $SpacingX: 15
      $SpacingY: 8
      $Align: 360
  jssor_slider1 = new $JssorSlider$('slider_container', options)
  return
