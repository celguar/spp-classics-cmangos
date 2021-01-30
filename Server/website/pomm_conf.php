<?php
require_once("func.php");

require_once("config/playermap_config.php");
require_once 'libs/data_lib.php';


//$realm_idd = intval($_GET['realm']);
//$realm_setting = file_get_contents("expansion.spp");
if (file_exists("vanilla.spp")) {
		$realm_id = 1;
	}

if (file_exists("tbc.spp")) {
		$realm_id = 2;
	}

if (file_exists("wotlk.spp")) {
		$realm_id = 3;
	}
//$realm_id = realm_setting; // Set the realm_id
//print_r($realm_setting);
//print_r($realm_id);
$server_arr = $server;

if (isset($_COOKIE["lang"])) {
    $lang = "en";
    if (!file_exists("map_".$lang.".php") && !file_exists("zone_names_".$lang.".php")) {
        $lang = $language;
    }
} else {
    $lang = $language;
}


$database_encoding = $site_encoding;

$server = $server_arr[$realm_id]["addr"];
//print_r($server);
$port = $server_arr[$realm_id]["game_port"];

$host = $characters_db[$realm_id]["addr"];
$user = $characters_db[$realm_id]["user"];
$password = $characters_db[$realm_id]["pass"];
$db = $characters_db[$realm_id]["name"];

$hostr = $realm_db["addr"];
$userr = $realm_db["user"];
$passwordr = $realm_db["pass"];
$dbr = $realm_db["name"];

$sql = new DBLayer($hostr, $userr, $passwordr, $dbr);
$query = $sql->query("SELECT name FROM realmlist WHERE id = ".$realm_id);
$realm_name = $sql->fetch_assoc($query);
$realm_name = htmlentities($realm_name["name"]);

$gm_show_online = $gm_online;
$gm_show_online_only_gmoff = $map_gm_show_online_only_gmoff;
$gm_show_online_only_gmvisible = $map_gm_show_online_only_gmvisible;
$gm_add_suffix = $map_gm_add_suffix;
$gm_include_online = $gm_online_count;
$show_status = $map_show_status;
$time_to_show_uptime = $map_time_to_show_uptime;
$time_to_show_maxonline = $map_time_to_show_maxonline;
$time_to_show_gmonline = $map_time_to_show_gmonline;
$status_gm_include_all = $map_status_gm_include_all;
$time = $map_time;
$show_time = $map_show_time;

// points located on these maps(do not modify it)
$maps_for_points = "0,1,530,571,609";

if($realm_id == 1){
	$img_base = "img/map_vanilla/";
}
if($realm_id == 2){
	$img_base = "img/map_tbc/";
}
if($realm_id == 3){
	$img_base = "img/map_wotlk/";
}
//$img_base = "img/map/";
$img_base2 = "img/c_icons/";

$PLAYER_FLAGS       = CHAR_DATA_OFFSET_FLAGS;
