$(function () {
  var $topbar = $('#js-topbar')
  var lastScrollTop = 0

  $(window).on('scroll', function (e) {
    var st = $(this).scrollTop()

    if (st > lastScrollTop ) {
      $topbar.addClass('hide')
    } else {
      $topbar.removeClass('hide')      
    }

    lastScrollTop = st
  })
})