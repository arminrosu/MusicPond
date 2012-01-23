<?php
	require_once 'config.php';
	require_once ROOT_PATH.'classes/database.php';
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Database
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if( !isset($db) ) :
		$db = new Database( DB_HOST, DB_NAME, DB_USER, DB_PASS);
	endif;
	
	// interval to get data from
	$interval = '2 SECOND';
	
	//
	$response = array();
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// NEW TRACKS
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = '
		SELECT video_id, title
		FROM ' . DB_TABLE . '
		WHERE time_added > DATE_SUB(NOW(), INTERVAL ' . $interval . ')
		AND time_removed IS NULL
	';
	$new_tracks = $db->get( $q );
	
	// do we have anything?
	if( count( $new_tracks ) > 0 ) :
		$response['new'] = $new_tracks;
	endif;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// REMOVED TRACKS
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = '
		SELECT video_id, title
		FROM ' . DB_TABLE . '
		WHERE time_removed > DATE_SUB(NOW(), INTERVAL ' . $interval . ')
		AND time_removed IS NOT NULL
	';
	$removed_tracks = $db->get( $q );
	
	// do we have anything?
	if( count( $removed_tracks ) > 0 ) :
		$response['removed'] = $removed_tracks;
	endif;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// NOW PLAYING
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = '
		SELECT video_id, title, UNIX_TIMESTAMP(time_played) as time
		FROM ' . DB_TABLE . '
		WHERE time_played IS NOT NULL
		AND time_played >  DATE_SUB(NOW(), INTERVAL duration SECOND)
		ORDER BY time_played DESC
		LIMIT 1
	';
	$playing_track = $db->get( $q );
	
	// do we have anything?
	if( count( $playing_track ) > 0 ) :
		$response['playing'] = $playing_track;
	endif;
	
	echo json_encode($response);
?>