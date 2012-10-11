/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Sync
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
var sync_timeout;
var sync_period = 2000; // millisecond interval to poll server at

function sync() {
	// release sync timeout
	window.clearTimeout(sync_timeout);

	// get time offset
	var now = new Date().getTime();

	// periodic functions
	$.get('sync.php', function(data){
		// new tracks
		if( typeof data.added === 'string' || typeof data.added === 'object' ) {		
			var new_tracks = [];

			// single track or multiple?
			if ( data.added.video_id !== null ) {
				new_tracks.push(data.added);
			} else {
				new_tracks = data.added;
			}

			$.each(new_tracks, function(index, value) {
				video_queue(value.video_id, value.title);
			});
		}

		// removed tracks
		if( typeof data.removed === 'object' ) {		
			$.each(data.removed, function(index, value) {
				video_remove(value.video_id);
			});
		}

		// now playing
		// tie syncing should happen here
		if( data.playing && data.playing.video_id !== videos[videos_index] && $video.tubeplayer('data').videoID !== data.playing.video_id ) {
			// calc offset
			var seconds_into = Math.ceil( (now - data.playing.time * 1000) / 1000 );

			// set offset globally
			now_playing.startSeconds = seconds_into;

			$video.tubeplayer('play', {
				'id': data.playing.video_id,
				'time': seconds_into
			});
		}

		// compute time 'til next sync
		var unix_sec = Math.floor( now / 1000 ) * 1000;
		var offset = sync_period - (now - unix_sec); // accurate up to ~50 ms

		// call myself again in offset set
		sync_timeout = window.setTimeout(sync, offset);
	}, 'json');
}

// start syncing once player is done
$.tubeplayer.defaults.afterReady = function($video){
	// console.log('ready');

	// start sync
	sync();
	
	// 
	update_progress_bar();
}