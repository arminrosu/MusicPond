// HELPERS
function video_id_from_string( string ) {
	return string.match(/v=(.{11})/)[1];
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* PAGE READY
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
$(document).ready(function(){
	$('#progressBar').click( function(e) {
	    var progress_bar = $('#progressBar');
	    var ratio = (e.pageX - progress_bar.offset().left )/ progress_bar.outerWidth();        
	    $('#progressBar .elapsed').width( Math.round( ratio * progress_bar.outerWidth() ) + 'px');
	    vp_seek( Math.round( vp_get_duration() * ratio ), true);
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
		// skip OR play
		if ( $(this).hasClass('playing') ) {
			// skip
			$.post('playlist.php', {'action': 'play'});
		} else {
			// play
			$.post('playlist.php', {'action': 'play'});
		}		
	});
	
	// toggle playlist
	$('.controls .playlist').click(function() {
		$('#playlist').toggleClass('open closed');
		$(this).toggleClass('inactive');
	});
	
	$('.controls .mute').click( function(){
		vp_mute_toggle();
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
