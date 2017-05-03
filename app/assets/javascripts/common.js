$(function () {
  var $topbar = $('#js-topbar')
  var $totop = $('#js-totop')
  var windowsHeight = $(window).height()
  var lastScrollTop = 0

  $(window).on('scroll', function (e) {
    var st = $(this).scrollTop()

    if (st > 0) {
      $totop.show()
    } else {
      $totop.hide()
    }

    if (st > lastScrollTop ) {
      $topbar.addClass('hide')
    } else {
      $topbar.removeClass('hide')      
    }

    lastScrollTop = st
  })

  $totop.on('click', function (e) {
    e.preventDefault()

    $('html, body').animate({ scrollTop: 0 }, 'fast')

    return false
  })
})