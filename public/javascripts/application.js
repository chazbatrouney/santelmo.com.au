function initPage() {
  $('a.lightbox').lightBox(); // Select all links with lightbox class
  if (window.location.href.match(/gallery/)) {
    $('body').addClass('gallery');
  } else {
    $('body').removeClass('gallery');
  }  
}

// url equality doesn't consider parameters. Right for us now, could be wrong in future.
function urlsEqual(url, other_url) {
  return url.replace(/\?.*$/, '') === other_url.replace(/\?.*$/, '');
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
    .filter(function() { return urlsEqual(options.url, $(this).find('a').get(0).href);} ).addClass('current');
  $('#main').show('slide', {direction: 'right'})
  
  initPage();
});
