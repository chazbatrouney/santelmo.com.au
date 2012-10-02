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
    function callback(data) {
      var tweet = data[0],
        text = twitterlib.ify.clean(twitterlib.expandLinks(data[0])),
        link = '<a href="http://twitter.com/' + tweet.user.screen_name +
          '/status/' + tweet.id_str + '" class="twitter_link"></a><i>- ' +
          twitterlib.time.relative(tweet.created_at) + '</i>';

      $tweets.html('<p>' + text +'</p>' + link);
    }
    twitterlib.status("san_telmo_", { page: 1, limit: 1 }, callback);    
  }

/*
  var $events = $('#events');
  if ($events.length) {
    function callback(data) {
      var tweet = data[0],
        text = twitterlib.ify.clean(twitterlib.expandLinks(data[0])),
        link = '<a href="http://twitter.com/' + tweet.user.screen_name +
          '/status/' + tweet.id_str + '" class="twitter_link"></a><i>- ' +
          twitterlib.time.relative(tweet.created_at) + '</i>';

      $events.html('<p>' + text +'</p>' + link);
    }
    twitterlib.status("chazbatrouney", { page: 1, limit: 2 }, callback);
  }
*/


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
