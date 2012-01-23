<?php
	require_once 'config.php';
	require_once ROOT_PATH.'classes/database.php';
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Database
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if( !isset($db) ) :
		$db = new Database( DB_HOST, DB_NAME, DB_USER, DB_PASS);
	endif;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// GET PLAYLIST
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = 'SELECT video_id, title 
		FROM ' . DB_TABLE . '
		WHERE time_removed IS NULL
		ORDER BY time_added
	';
	$playlist = $db->get( $q );
	
	// list of videos
	$video_ids = array();
	foreach ($playlist as $track ) :
		$video_ids[] = $track['video_id'];
	endforeach;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// HELPERS
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// set next video id, responds with it
	function next_track( $current_track_id = null ) {
		global $db, $video_ids;
	
		if( SHUFFLE ) :
			// yes, get random
			// $next_track_index = rand(0, (count($video_ids) - 1) );
			
			// prefer least played, least skipped and earliest played files
			$q = 'SELECT video_id FROM ' . DB_TABLE . ' 
					WHERE time_removed IS NULL 
					ORDER BY plays, skips, time_played ASC LIMIT 1 ';
			
			$next_video_id = $db->get( $q );
			$next_video_id = $next_video_id['video_id'];
		else :
			// not shuffling
			// are we at last item?
			if( $current_track_id != null && $current_track_id == $video_ids[(count($video_ids) - 1)] ) :
				$next_track_index = 0;
			else:
				// get current index
				$current_index = array_search($current_track_id, $video_ids);
				
				//
				$next_track_index = $current_index + 1;
				$next_video_id = $video_ids[$next_track_index];
			endif;
		endif;
		
		// was a track skipped?
		// skipping counts as changing tracks when at least 50% of it are still left to play
		if ( $current_track_id != null ) :
			// get track details
			$q = 'SELECT video_id, UNIX_TIMESTAMP(time_played) as time_played, duration FROM ' . DB_TABLE . ' WHERE video_id = "' . $current_track_id . '"';
			$current_track = $db->get( $q );
			
			// more than 1/2 of the track still left to play?
			if( ($current_track['time_played'] + $current_track['duration'] / 2 ) > time() ) :
				// somebody didn't like this song at all
				$q = '
					UPDATE ' . DB_TABLE . '
					SET 
						skips = skips + 1
					WHERE video_id = "' . $current_track_id . '"
				';
				$db->query( $q );
			endif;
			
		endif;
		
		return $next_video_id;
	}
	
	function video_play( $video_id ) {
		global $db;
		
		$q = '
			UPDATE ' . DB_TABLE . '
			SET 
				plays = plays + 1,
				time_played = NOW()
			WHERE video_id = "' . $video_id . '"
		';
		$db->query( $q );
	}
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// RESPOND
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if( isset($_REQUEST['action']) ) :
		switch ( $_REQUEST['action'] ) :
			case 'add':
				// already in playlist?
				if( !in_array($_REQUEST['video'], $video_ids) ) :
					// get youtube details
					$url = 'http://gdata.youtube.com/feeds/api/videos/' . $_REQUEST['video'] . '?v=2&alt=jsonc';
					$youtube = file_get_contents($url);
					$youtube = json_decode($youtube);
					$youtube = $youtube->data;
				
					// Add to database
					$q = '
						INSERT INTO ' . DB_TABLE . '(video_id, title, duration, time_added) 
						VALUES("' . $_REQUEST['video'] . '", "' . $youtube->title . '", "' . $youtube->duration . '", NOW())
					';
					$db->query( $q );
					
					$response = array(
						'video_id' => $_REQUEST['video'],
						'title' => $youtube->title
					);
					echo json_encode($response);
				endif;
				break;
			case 'play':
				$track_id = '';
			
				// was something requested?
				if ( isset($_REQUEST['video']) && $_REQUEST['video'] != '' ) :
					// play specific track
					$track_id = $_REQUEST['video'];
					
					echo 'play specific';
				else :
					// get a track
					$track_id = next_track();
					
					echo 'play generic';				
				endif;
			
				// engage
				video_play( $track_id );
			
				break;			
			case 'remove':
				$q = '
					UPDATE ' . DB_TABLE . '
					SET 
						time_removed = NOW()
					WHERE video_id = "' . $_REQUEST['video'] . '"
				';
				$db->query( $q );				
				break;
		endswitch;
	else :
		echo json_encode($playlist);
	endif;
?>