# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

popoverErrors = (errors) ->
 if isMobile()
   alert "#{errors[0].attribute} - #{errors[0].message}"
 else
   $("[data-error*=\"#{errors[0].attribute}\"]").attr('data-content', errors[0].message).popover('show')

popoverError = (error) ->
 if isMobile()
   alert "#{error.attribute} - #{error.message}"
 else
   $("[rel='popover']").popover 'hide'
   $("[data-error*=\"#{error.attribute}\"]").attr('data-content', error.message).popover('show')

isMobile = ->
 navigator.userAgent.match(/(iPhone|iPod|Android|BlackBerry)/)

popoverOpts =
  offset: 10
  trigger: 'manual'
  animate: true
  template: '<div id="passpop" class="popover"><div class="arrow"/><div class="popover-inner"><div class="popover-content" style="text-align:left;"><p></p></div></div></div>'

ajaxing = false
passQualityColors = [ "#C81818", "#C81818", "#FFAC1D", "#55BB33", "darkGreen" ]
passQualityStatements = ["Bad", "Not Good", "Ok", "Good", "Great!"]

tryCallback = (name, data) ->
  if window.hasOwnProperty(name) and toType(window[name]) == 'function' then window[name](data)

showPasswordStrength = (el) ->
  $(el).keypress ->
    $(el).popover 'hide'
  $(el).keyup (e) ->
    return if $(el).val().length < 3 #don't show to soon
    return if e.which is 13
    quality = zxcvbn($(el).val())
    passDescription = "Password Strength: #{passQualityStatements[quality.score]}"
    $(el).attr("data-content", "<b style=\"color:#{passQualityColors[quality.score]}\">#{passDescription}</b>").popover 'show'
  $(el).blur ->
    $(el).popover "hide"


formSubmit = ->
  if ajaxing
    return false
  $('[rel="popover"]').popover 'hide'
  # for el, index in $('[data-required]')
  #   if $(el).val() == ""
  #     $(el).attr('data-content','This is a required field and cannot be empty.').popover 'show'
  #     $(el).blur ->
  #       $(el).popover 'hide'
      #return false
  $('.loading').show()
  ajaxing = true
  $.ajax
    url: "#{$('form').attr('action')}?#{$('form').serialize()}"
    type: 'POST'
    dataType: 'json'
    success: (data) ->
      tryCallback 'formDone', data
      $('.loading').hide()
      ajaxing = false
      if !data.worked
        popoverErrors(data.errors)
      else
        document.location = data.redirect
    error: ->
      $('.loading').hide()
      ajaxing = false
      $("[data-error*=\"form\"]").attr('data-content', "An error occured. Please check your network connection and try again momentarily.").popover('show')
      tryCallback('formError')
  false

$(document).ready ->
  $('[rel=popover]').popover(popoverOpts)
  ajaxing = false
  $('form').submit formSubmit
  # _.each $('[data-password-strength]'), (el) ->
  #   showPasswordStrength(el)