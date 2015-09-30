$ ->

  # Set the html attribute specified by `data-os-attr` to the os specific value
  # specified by `data-os-*`. In which * matches the os string of the current
  # browser window.
  #
  # Usage:
  # <a href="" class="js-os-data" data-os-attr="href", data-os-mac="" data-os-windows="bar" data-os-linux="bat">
  #
  os = window.session.browser.os.toLowerCase()
  $('.js-os-data').each ->
    $el = $(this)
    attr = $el.attr('data-os-attr')
    return unless val = $el.attr("data-os-#{os}")
    if attr in ['text','html'] then $el[attr](val) else $el.attr(attr, val)

  if os == 'mac'
    $('.js-mac').removeClass('visually-hidden')
  else if os == 'linux'
    $('.js-linux').removeClass('visually-hidden')
    $('.download').addClass('visually-hidden')
    
# Event tracking for clicks on "Download" or Sign Up"
$(document).on 'click', (e) ->
  gaParams = $(e.target).closest('[data-ga-params]').attr('data-ga-params')
  return unless window.ga && gaParams

  gaParams = gaParams.split(',')
  window.ga('send', 'event', 'Home Page', gaParams[0], gaParams[1])
  return
