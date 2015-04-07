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
    val = $el.attr("data-os-#{os}")
    $el.attr($el.attr('data-os-attr'), val) if val
