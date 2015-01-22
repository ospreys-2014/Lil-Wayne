// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/*
 *
 * application.js is meant to be a manifest, it includes other files of JS, but
 * does not contain JS itself.
 *
 */

$(document).ready(function() {
	$(document).on('click', '#login', function(event){
		event.preventDefault();
		$('#login-form').toggle();
	});

	$(document).on('click', '#signup', function(event){
		event.preventDefault();
		$('#signup-form').toggle(	)
	} )

  /* Note, this function could be defined globally, there's no reason to have
   * it inside this onready calback, really */

  function playSomeSound(genre) {
    SC.get('/tracks', {
      genres: genre,
      bpm: {
        from: 100
      }
    },
    function(tracks){
      /* It seems like there should be a faster / builtin way to get 1 random
       * track, no?
       *
       * Further, this whole playSomeSound thing seems actually to be a class
       * like...
       *
       * new RandomSoundCloudSongChooser("country").song()
       *
       *
       * and that class encapsulates all this logic.  Think about that.
       */
      var random = Math.floor(Math.random() * 49);
      var nextTrack = tracks[random]
      SC.oEmbed(nextTrack.uri, { auto_play: true }, document.getElementById('target'));
      currentTrack.title = nextTrack.title
      currentTrack.genre = nextTrack.genre
      popupHandler(currentTrack.title, currentTrack.genre)
    });
  }

	$(document).click(function(event){
		console.log($(event.target).text());
	});

  /* So you have a window.onload event being set in document.ready?  That's
   * werid because they're basically the same thing.  I'm not sure why you did
   * this.
   *
   */
	window.onload = function() {
		SC.initialize({
      /* WHOA!  This would be really good to have be interpolated from ENV
       * variables so that you're not hard-coding your client_id
       *
       */
			client_id: '22e9a7ddce77425a1febb432189e7232'
		});

		$('.genre').click(function(event){
			playSomeSound($(event.target).text());
		});
	};

	$('.teaser__trackTitle sc-truncate sc-orange sc-font-light').innerHTML


	$('#create_note').on('submit', function(event){
		event.preventDefault();
		$target = $(event.target);
		console.log($target.serialize())
		$.ajax({
			url: '/entries',
			type: 'POST',
			data: $(this).serialize()
		})
		.done(function() {
			console.log("success");
			$('.popup').toggle()
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
	})

});
