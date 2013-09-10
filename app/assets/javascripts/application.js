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
  
  // init any twitter guys (code stolen from BindleMe)
  var $tweets = $('#tweets');
  if ($tweets.length) {
    twitterlib.status("san_telmo_", { page: 1, limit: 1 }, function(data) {
      var tweet = data[0],
        text = twitterlib.ify.clean(twitterlib.expandLinks(data[0])),
        link = '<p class="date_stamp"><a href="http://twitter.com/' + tweet.user.screen_name +
          '<p>/status/' + tweet.id_str + '" class="twitter_link"><i>- ' +
          twitterlib.time.relative(tweet.created_at) + '</i></a></p>';

      $tweets.html('<p>' + text +'</p>' + link);
    });    
  }


  var $events = $('#events');
  if ($events.length) {
    twitterlib.timeline("santelmoupdates", { page: 1, limit: 4 }, function(data) {
      var html = ''
      for (var i = 0; i < data.length; i++) {
        var tweet = data[i],
          text = twitterlib.ify.clean(twitterlib.expandLinks(tweet)),
          link = '<p class="date_stamp"><a href="http://twitter.com/' + tweet.user.screen_name +
            '/status/' + tweet.id_str + '" class="twitter_link"><i>- ' +
            twitterlib.time.relative(tweet.created_at) + '</i></a></p>';
        
        html += '<p>' + text +'</p>' + link;
      }
      
      $events.html(html);
    });
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

$(function() {
    $('.expand').click(function(){
      $('.submenu').slideToggle();
    });
});