// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

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