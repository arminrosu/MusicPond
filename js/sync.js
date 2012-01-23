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
		if( data.new != null ) {
			var new_tracks = new Array();
		
			console.log('new tracks:');
			console.log(data.new);
			
			// single track or multiple?
			if ( data.new.video_id != null ) {
				new_tracks.push(data.new);
			} else {
				new_tracks = data.new;
			}
			
			$.each(new_tracks, function(index, value) {
				video_queue(value.video_id, value.title);
			});
		}
		
		// removed tracks
		if( data.removed != null ) {
			$.each(data.removed, function(index, value) {
				video_remove(value.video_id);
			});
		}
		
		// now playing
		if( data.playing && data.playing.video_id != videos[videos_index] ) {		
			// calc offset
			var seconds_into = Math.ceil( (now - data.playing.time * 1000) / 1000 );
			
			// set offset globally
			now_playing.startSeconds = seconds_into;
			
			vp_load(data.playing.video_id);
			vp_play();
		}
		
		// compute time 'til next sync
		var unix_sec = Math.floor( now / 1000 ) * 1000;
		var offset = sync_period - (now - unix_sec); // accurate up to ~50 ms
		
		// call myself again in offset set
		sync_timeout = window.setTimeout(sync, offset);
	}, 'json');
}