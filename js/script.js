/*global: $:true*/
//@codekit-prepend "jQuery.tubeplayer.js, video.js, sync.js";

// HELPERS
function video_id_from_string( string ) {
	return string.match(/v=(.{11})/)[1];
}

// video jquery object
var $video;

// Dom Ready
$(document).ready(function(){
	"use strict";
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	/* YouTube
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	// cache the object
	$video = $('#videoFrame');
	
	// some values here need to be set by server
	// this also loads swfobject, might wanna include that too
	$video.tubeplayer({
		allowFullScreen: 'true',
		height: '100%',
		initialVideo: 'qPTyy4itI',
		modestbranding: false,
		showControls: 0,
		start: 0, 
		wmode: 'opaque', // http://kb2.adobe.com/cps/127/tn_12701.html
		width: '100%',
		
		// Events
		// Muting
		onMute: function() {
			$('#mute').removeClass('inactive');
		},
		onUnMute: function() {
			$('#mute').addClass('inactive');
		},
		// Seeking (Progress Bar)
		onSeek: function(time) {
			update_progress_bar();
		},
		// skip once song ended
		// technically, the server should set the next track
		onPlayerEnded: function() {
			vp_skip();
		},
		// Set Active playlist item
		onPlayerPlaying: function() {
			video_set_active($video.tubeplayer('data').videoID);
		},
		
		// Error Handling
		onErrorNotFound: function() {
			alert("Sorry, couldn't find your video. Try another one.");
		},
		onErrorNotEmbeddable: function() {
			alert("Sorry, this video can't be embedded. Try another one.");
		},
		onErrorInvalidParameter: function() {
			alert("Sorry, something went AWOL...");
		}
	});
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	/* Misc
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	$('#progressBar').click( function(e) {
		var progress_bar = $('#progressBar');
		var ratio = (e.pageX - progress_bar.offset().left )/ progress_bar.outerWidth();
		$('#progressBar .elapsed').width( Math.round( ratio * progress_bar.outerWidth() ) + 'px');
		$video.tubePlayer('seek', Math.round( $video.tubeplayer('data').duration * ratio ), true);
		return false;
	});

	// get playlist
	$.get( 'playlist.php', function(data){
		// populate
		$.each(data, function(index, value){
			// also pushes to playlist
			video_queue(value.video_id, value.title);
		});
	}, 'json' );

	// controls
	$('#play_btn').click(function(){
		$.post('playlist.php', {'action': 'play'});
	});

	// optimize this please
	// is eventing better than setting class here?
	$('#mute').click( function(){
		if ( $video.tubeplayer('volume') < 1 ) {
			$video.tubeplayer('unmute');
		} else {
			$video.tubeplayer('mute');
		}
	});


	$('#add-video').submit(function(){
		// get value
		var video_new = $('#videoNew').val();
		video_new = video_id_from_string( video_new );

		// update server
		$.post('playlist.php', {action: 'add', video: video_new}, function(data) {
			// reset input field
			$('#videoNew').val('');
		}, 'json');

		return false;
	});

	// play video
	$('.title').live('click', function(){
		// get video id
		var video_id = $(this).parents('li').attr('id');
		video_id = video_id.replace('video_', '');

		$.post('playlist.php', {action: 'play', video: video_id}, function(data) {
			//console.log('now playing set to: ' + video_id);
		}, 'json');

		//
		return false;
	});

	// remove video
	$('.remove').live('click', function() {
		// get video id to remove
		var video_id = $(this).parents('li').attr('id');
		video_id = video_id.replace('video_', '');

		// update server
		$.post('playlist.php', {action: 'remove', video: video_id}, function() {
			video_remove( video_id );
		});

		return false;
	});
});
