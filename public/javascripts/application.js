function initPage() {
  $('a.lightbox').lightBox(); // Select all links with lightbox class
  if (window.location.href.match(/gallery/)) {
    $('body').addClass('gallery');
  } else {
    $('body').removeClass('gallery');
  }  
}

$(function() {
  $('a.pjax').pjax('#bg', {fragment: '#bg', timeout: 2000});
  initPage();
});

$('#bg').live('pjax:start', function() {
  $('#main').hide('slide', {direction: 'right'})
});

$('#bg').live('pjax:end', function(event, xhr, options) {
  $('.link').removeClass('current')
    .filter(function() { return $(this).find('a').get(0).href == options.url; }).addClass('current');
  $('#main').show('slide', {direction: 'right'})
  
  initPage();
});
