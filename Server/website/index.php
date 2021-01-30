<?php

require_once("defines.php");
require_once("pomm_conf.php");
require_once("func.php");
require_once("map_english.php");

?>
<HTML><HEAD><title>Online Playermap</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body {
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    color: #EABA28;
    background-color: #000000;
}
#world {
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    background-image: url(<?php echo $img_base ?>azeroth.jpg);
    z-index: 10;
}
#outland {
    visibility: hidden;
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    background-image: url(<?php echo $img_base ?>outland.jpg);
    z-index: 9;
}
#northrend {
    visibility: hidden;
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    background-image: url(<?php echo $img_base ?>northrend.jpg);
    z-index: 8;
}
#pointsOldworld {
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    z-index: 100;
}
#pointsOutland {
    visibility: hidden;
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    z-index: 99;
}
#pointsNorthrend {
    visibility: hidden;
    position: absolute;
    height: 732px;
    width: 966px;
    left: 50%;
    margin-left: -483px;
    z-index: 98;
}
#wow {
    position: absolute;
    height: 98px;
    width: 200px;
    left: 50%;
    margin-left: -468px;
    z-index: 101;
    text-align: center;
    clear: none;
    float: none;
}
#info {
    position: absolute;
    height: 16px;
    width: 40px;
    left: 50%;
    margin-left: -20px;
    z-index: 102;
    text-align: center;
}
#info_bottom {
    position: absolute;
    height: 20px;
    width: 966px;
    left: 50%;
    margin-top: 711px;
    margin-left: -483px;
    z-index: 101;
    text-align: center;
}
#timer {
    font-family: arial;
    font-size: 12px;
    font-style: normal;
    text-align: center;
    font-weight: bold;
    color: #E7CF07;
    filter: Glow(Color=#000099, Strength=3);
}
#server_info {
    font-family: Georgia, "Times New Roman", Times, serif;
    font-size: 20px;
    font-style: italic;
    text-align: center;
    font-weight: bold;
    color: #FFFF99;
    filter: Glow(Color=0, Strength=3);
    padding-top: 30px;
}
#serverstatus {
    visibility: <?php echo $show_status ? 'visible' : 'hidden'?>;
    position: absolute;
    height: 36px;
    width: 156px;
    margin-left: -78px;
    left: 50%;
    top: 97px;
    text-align: center;
    z-index: 101;
}
#tip {
    border: 0px solid #aaaaaa;
    left: -1000px;
    padding: 0px;
    position: absolute;
    top: -1000px;
    z-index: 150;
}
.statustext {
    font-weight: normal;
    color: #EABA28;
    font-family: verdana, arial, sans-serif, helvetica;
    font-size: 12px;
    font-style: normal;
    text-align: center;
    padding: 0px;
    background-image: url(<?php echo $img_base ?>status.gif);
}
.tip_header {
    background: #bb0000;
    FONT-WEIGHT: bold;
    color: #FFFFFF;
    font-family: arial, helvetica, sans-serif;
    font-size: 12px;
    font-style: normal;
    text-align: center;
    padding: 0px;
}
.tip_head_text {
    background: rgb(50,50,50);
    FONT-WEIGHT: bold;
    color: #DDDD33;
    font-family: arial, helvetica, sans-serif;
    font-size: 12px;
    font-style: normal;
    text-align: left;
    padding: 0px;
}
.tip_text {
    background: #000000;
    FONT-WEIGHT: normal;
    color: #ffffff;
    font-family: arial, helvetica, sans-serif;
    font-size: 12px;
    font-style: normal;
    text-align: center;
    padding: 0px;
}
.tip_worldinfo {
    FONT-WEIGHT: normal;
    color: #FFFF99;
    font-family: Georgia, arial, helvetica, sans-serif;
    font-size: 12px;
    font-style: normal;
    text-align: left;
    padding: 0px;
}
-->
</style>
</HEAD>
<script TYPE="text/javascript" src="libs/js/JsHttpRequest/Js.js"></script>
<SCRIPT TYPE="text/javascript">

var current_map = 0;
var time = <?php echo $time ?>;
var show_time=<?php echo $show_time ?>;
var show_status=<?php echo $show_status ?>;
var maps_count = <?php echo count($lang_defs['maps_names']); ?>;
var maps_array = new Array(<?php echo $maps_for_points ?>);
var maps_name_array = new Array(<?php echo "'".implode("','", $lang_defs['maps_names'])."'" ?>);

var race_name = {<?php echo "0:''"; foreach ($character_race as $id => $race) {
    echo(", ".$id.":'".$race."'");
} ?>}

var class_name = {<?php echo "0:''"; foreach ($character_class as $id => $class) {
    echo(", ".$id.":'".$class."'");
} ?>}

var instances_x = new Array();
var instances_y = new Array();

instances_x[0] = {
    2:0,13:0,17:0,30:762,33:712,34:732,35:732,36:712,37:0,43:245,44:0,47:238,48:172,70:833,90:738,
    109:849,129:254,150:0,169:0,189:773,209:269,229:782,230:778,249:290,269:315,289:816,309:782,329:834,
    349:123,369:745,389:308,409:783,429:164,449:741,450:305,451:0,469:778,489:244,509:160,529:820,531:144,532:798,534:317,560:320,568:897,572:750,580:868,585:883,595:322,618:313
}

instances_y[0] = {
    2:0,13:0,17:0,30:278,33:295,34:511,35:503,36:567,37:0,43:419,44:0,47:508,48:291,70:443,90:419,
    109:551,129:516,150:0,169:0,189:216,209:568,229:481,230:484,249:514,269:601,289:258,309:589,329:203,
    349:432,369:497,389:352,409:484,429:496,449:508,450:352,451:0,469:480,489:364,509:607,529:321,531:603,532:569,534:596,560:606,568:172,572:245,580:26,585:16,595:601,618:348
}

instances_x[1] = { 540:593,542:586,543:593,544:588,545:393,546:399,547:388,548:399,550:683,552:680,553:672,554:669,555:495,556:506,557:495,558:483,559:408,562:443,564:740,565:485 }
instances_y[1] = { 540:399,542:398,543:405,544:402,545:355,546:350,547:353,548:357,550:226,552:215,553:210,554:239,555:569,556:557,557:545,558:557,559:489,562:239,564:567,565:204 }
instances_x[2] = { 533:568,574:749,575:751,576:161,578:159,599:553,600:605,601:395,602:575,603:559,604:740,608:470,615:491,616:155,617:457,619:400,624:363 }
instances_y[2] = { 533:456,574:577,575:583,576:443,578:451,599:195,600:406,601:462,602:180,603:169,604:292,608:360,615:461,616:447,617:352,619:462,624:369 }

var fade_colors = Array('C6B711','BDAF10','B7A910','B1A40F','AB9E0F','A4980E','9E920E','988C0D','92870D','8B800C','857B0B','7F750B','79700A','746B0A','6E6609','686009','625B08','5C5508','564F07','504A07','4A4406','443F05','3E3905','383404','312D04','2A2703','232002','1C1A02','141201','000000');
var fade_cur_color = fade_colors.length-1;
var status_text = Array('OffLine','DB connect error','uptime','max online','GM online');
var status_data = Array(1,0,0,0);
var status_process = Array();
var status_cur_time = 0;
var status_next_process = 0;
var statusUpdateInterval = 50;
var pointx;
var pointy;

function _status_action(text,status_data,text_type,action,time)
{
  this.text_id = text;
  this.status_data = status_data;
  this.text_type = text_type;
  this.action = action;
  this.time = time;
}

function _coord()
{
  this.x = 0;
  this.y = 0;
}

function _points() {
  this.map_id = 0;
  this.x = 0;
  this.y = 0;
  this.name = "";
  this.zone = "";
  this.faction = 0;
  this.single_text = "";
  this.multi_text = "";
  this.player = 0;
  this.Extention = 0;
}

function _multi_text() {
  this.current = 0;
  this.next = 0;
  this.first_members = Array();
  this.text = Array();
}

function _pos() {
  this.x = 0;
  this.y = 0;
}

function getBodyScrollTop()
{
  return self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
}

function getBodyScrollLeft()
{
  return self.pageXOffset || (document.documentElement && document.documentElement.scrollLeft) || (document.body && document.body.scrollLeft);
}

function get_tipxy(tip_width, tip_height, x1, y1)
{
  tipxy = new _coord();
  tipxy.x = 5;
  tipxy.y = 5;
  if(document.layers)
  {
    wd = innerWidth;
    ht = innerHeight;
  }
  else
  {
    wd = document.body.clientWidth;
    ht = document.body.clientHeight;
  }
  if(x1+tip_width+15 < wd)
    tipxy.x = x1+15;
  else if(x1-tip_width-15 > 0)
    tipxy.x = x1-tip_width-15;
  else
    tipxy.x = wd/2-tip_width/2;
  if(y1+tip_height-5 < ht)
    tipxy.y = y1-5;
  else if(ht-tip_height-5 > 0)
    tipxy.y = ht-tip_height-5;
  else
    tipxy.y = 5;
  //tipxy.x += getBodyScrollLeft();
  //tipxy.y += getBodyScrollTop();
  return tipxy;
}

function getMultiText(multitext, onClick)
{
  if(onClick)
  {
    multitext.current = multitext.next;
  }
  if(document.layers)
  {
    ht = innerHeight;
  }
  else
  {
    ht = document.body.clientHeight;
  }
  var length = multitext.text.length - multitext.current;
  count = length;
  if((20+length*22) > ht*0.8)
  {
    count = Math.round((ht*0.8 - 20)/22);
    multitext.next = multitext.current + count;
    if(multitext.next == multitext.text.length)
      multitext.next = 0;
  }
  else
    multitext.next = 0;
  var data = '';
  var i = 0;
  while(i < count)
  {
    if(in_array(multitext.current + i, multitext.first_members))
      group_line = '<tr\><td colspan=\'7\' bgcolor=\'#11FF99\' height=\'1px\'\></td\></tr\>';
    else
      group_line = '';
    data += group_line + '<tr class=\'tip_text\'><td align=\'left\'\>&nbsp;'+eval(multitext.current + i + 1)+'&nbsp;</td\>'+multitext.text[multitext.current + i]+'</tr\>';
    i++;
  }
  if(multitext.next > multitext.current)
    data += '<tr class=\'tip_text\'><td align=\'right\' colspan=\'7\'\>>>>&nbsp;<?php echo $lang_defs['click_to_next'];?>&nbsp;>>>&nbsp;</td\></tr\>';
  else if(multitext.current > 0)
    data += '<tr class=\'tip_text\'><td align=\'left\' colspan=\'7\'\>&nbsp;<<<&nbsp;<?php echo $lang_defs['click_to_first'];?>&nbsp;<<<</td\></tr\>';
  return data;
}

function tip(object, type, onClick)
{
  var t, data;
  var tipxy;
  t=document.getElementById("tip");
  if(window.opera)
  {
    pointx = window.event.clientX;
    pointy = window.event.clientY;
  }
  else if(navigator.appName != "Netscape")
  {
    pointx = window.event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
    pointy = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
  }
  switch(type)
  {
    case 2:
      tipxy = new _coord();
      tipxy.x = pointx+15;
      tipxy.y = pointy-60;
      t.innerHTML='<table width="120" border="0" cellspacing="0" cellpadding="0" class=\'tip_worldinfo\'\>'+object+'</table\>';
      break;
    case 1:
      if(onClick || t.innerHTML == '')
      {
        data = getMultiText(object.multi_text, onClick);
        t.innerHTML='<table border=\'0\' cellspacing=\'0\' cellpadding=\'0\'\><tr class=\'tip_header\'\><td colspan=\'7\'\>'+object.zone+'</td\></tr\><tr class=\'tip_head_text\'\><td align=\'center\'\>#</td\><td\>&nbsp;<?php echo $lang_defs['name'];?></td\><td width=\'25\' align=\'center\'\><?php echo $lang_defs['level'];?></td\><td colspan=\'2\'\><?php echo $lang_defs['race'];?></td\><td colspan=\'2\'\>&nbsp;<?php echo $lang_defs['class'];?></td\></tr\>'+data+'<\/table\>';
      }
      tipxy = get_tipxy(t.offsetWidth, t.offsetHeight, pointx, pointy);
      break;
    case 0:
      if(object.faction) {color='#D2321E';}
      else {color='#0096BE';}
      t.innerHTML='<table width=\'100\' border=\'0\' cellspacing=\'0\' cellpadding=\'0\'\><tr class=\'tip_text\'\><td\>&nbsp;'+object.name+'&nbsp;</td\></tr\><tr bgcolor=\''+color+'\'\><td height=\'1px\'\></td\></tr\><tr\><td\><table width=100% border=\'0\' cellspacing=\'0\' cellpadding=\'3\'\><tr class=\'tip_text\'\><td\>'+object.single_text+'</td\></tr\><\/table\></td\></tr\><\/table\>';
      tipxy = get_tipxy(t.offsetWidth, t.offsetHeight, pointx, pointy);
      break;
  }
  t.style.left=tipxy.x + "px";
  t.style.top=tipxy.y + "px";
}

function h_tip() {
  var t;
  t=document.getElementById("tip");
  t.innerHTML="";
  t.style.left="-1000px";
  t.style.top="-1000px";
}

function get_player_position(x,y,m)
{
 pos = new _pos();
 where_530 = 0;
 x = Math.round(x);
 y = Math.round(y);
 if(m == 530) {
   if(y < -1000 && y > -10000 && x > 5000) { //BE
     x=x-10349; y=y+6357; where_530 = 1;
     }
   else if(y < -7000 && x < 0) {             //Dr
     x=x+3961; y=y+13931; where_530 = 2;
     }
   else {                                    //Outland
     x=x-3070; y=y-1265; where_530 = 3;
     }
   }
 else if(m == 609) {
   x=x-2355; y=y+5662;
   }
 if(where_530 == 3) { //Outland
   xpos = Math.round(x * 0.051446);
   ypos = Math.round(y * 0.051446);
   }
 else if(m == 571) { //Northrend
   xpos = Math.round(x * 0.050085);
   ypos = Math.round(y * 0.050085);
   }
 else {              //Azeroth
   xpos = Math.round(x * 0.025140);
   ypos = Math.round(y * 0.025140);
   }
 switch (m) {
   case '530':
    if(where_530 == 1) {
      pos.x = 858 - ypos; pos.y = 84 - xpos;
      }
    else if(where_530 == 2) {
      pos.x = 103 - ypos; pos.y = 261 - xpos;
      }
    else if(where_530 == 3) {
      pos.x = 684 - ypos; pos.y = 229 - xpos;
      }
    break;
   case '571':
    pos.x = 505 - ypos;
    pos.y = 642 - xpos;
    break;
   case '609':
    pos.x = 896 - ypos;
    pos.y = 232 - xpos;
    break;
   case '1':
    pos.x = 194 - ypos;
    pos.y = 398 - xpos;
    break;
   case '0':
    pos.x = 752 - ypos;
    pos.y = 291 - xpos;
    break;
   default:
    pos.x = 194 - ypos;
    pos.y = 398 - xpos;
 }
 return pos;
}

function in_array(value, arr)
{
  var i = 0;
  while (i < arr.length)
  {
    if(value == arr[i])
      return true;
    i++;
  }
  return false;
}

function getMapLayerByID(id)
{
  switch(id)
  {
    case 0:
      return document.getElementById("world"); break;
    case 1:
      return document.getElementById("outland"); break;
    case 2:
      return document.getElementById("northrend"); break;
    default:
      return null;
  }
}

function getPointsLayerByID(id)
{
  switch(id)
  {
    case 0:
      return document.getElementById("pointsOldworld"); break;
    case 1:
      return document.getElementById("pointsOutland"); break;
    case 2:
      return document.getElementById("pointsNorthrend"); break;
    default:
      return null;
  }
}

function switchworld(n)
{
  for(var i = 0; i < maps_count; i++)
  {
    obj_map_layer = getMapLayerByID(i);
    obj_points_layer = getPointsLayerByID(i);

    if(i == n)
    {
      obj_map_layer.style.visibility = "visible";
      obj_points_layer.style.visibility = "visible";
    }
    else
    {
      obj_map_layer.style.visibility = "hidden";
      obj_points_layer.style.visibility = "hidden";
    }
  }
}


function show(data)
{
  if(!data)
  {
    var object;
    for(var i = 0; i < maps_count; i++)
    {
      object = getPointsLayerByID(i);
      object.innerHTML = '';
    }
    document.getElementById("server_info").innerHTML = '';
    return;
  }

  mpoints = new Array();
  instances = new Array();
  groups = new Array();
  single = new Array();
  points_layer = new Array();
  alliance_count = new Array();
  horde_count = new Array();

  for(var i = 0; i < maps_count; i++)
  {
    instances[i] = '';
    groups[i] = '';
    single[i] = '';
    alliance_count[i] = eval(data[i][0]);
    horde_count[i] = eval(data[i][1]);
  }

  point_count=0;
  var ht;
  if(document.layers)
  {
    ht = innerHeight;
  }
  else
  {
    ht = document.body.clientHeight;
  }
  group_line = '';
  i = maps_count;

  while (i < data.length)
  {
    if (data[i].race==2 || data[i].race==5 || data[i].race==6 || data[i].race==8 || data[i].race==10)
    {
      faction = 1;
      text_col='#D2321E';
    }
    else
    {
      faction = 0;
      text_col='#0096BE';
    }
    if(data[i].dead == 1)
      char = '<img src=\'<?php echo $img_base ?>dead.gif\' style=\'float:center\' border=0 width=18 height=18\>';
    else
      char = '<img src=\'<?php echo $img_base2 ?>'+data[i].race+'-'+data[i].gender+'.gif\' style=\'float:center\' border=0 width=18 height=18\>';
    n=0;
    if(in_array(data[i].map, maps_array))
    {
      pos = get_player_position(data[i].x,data[i].y,data[i].map);
      while(n != point_count)
      {
        if(data[i].map == mpoints[n].map_id && Math.sqrt(Math.pow(pos.x-mpoints[n].x,2)+Math.pow(pos.y-mpoints[n].y,2)) < 3)
          break;
        n++;
      }
    }
    else
    {
      while(n != point_count)
      {
        if(mpoints[n].map_id == data[i].map)
          break;
        n++;
      }
    }
    if(n == point_count)
    {
      mpoints[n] = new _points();
      mpoints[point_count].map_id = data[i].map;
      mpoints[point_count].name = data[i].name;
      mpoints[point_count].zone = data[i].zone;
      mpoints[point_count].player = 1;
      mpoints[point_count].Extention = eval(data[i].Extention);
      if(in_array(data[i].map, maps_array))
      {
        mpoints[n].faction = faction;
        mpoints[point_count].single_text = data[i].zone+'<br\>'+data[i].level+' lvl<br\>'+char+'&nbsp;<img src=\'<?php echo $img_base2 ?>'+data[i].cl+'.gif\' style=\'float:center\' border=0 width=18 height=18\><br\>'+race_name[data[i].race]+'<br/>'+class_name[data[i].cl]+'<br/>';
        mpoints[point_count].x = pos.x;
        mpoints[point_count].y = pos.y;
      }
      else
      {
        mpoints[point_count].single_text='';
        mpoints[point_count].x = 0;
        mpoints[point_count].y = 0;
      }
      mpoints[point_count].current_leaderGuid = data[i].leaderGuid;
      mpoints[point_count].multi_text = new _multi_text();
      n = point_count;
      point_count++;
    }
    else
    {
      mpoints[n].player += 1;
      mpoints[n].single_text = '';
    }
    if(!in_array(mpoints[n].map_id, maps_array) && (mpoints[n].current_leaderGuid != data[i].leaderGuid || (data[i].leaderGuid == 0 && mpoints[n].player > 1)))
    {
      mpoints[n].multi_text.first_members.push(mpoints[n].player-1);
      mpoints[n].current_leaderGuid = data[i].leaderGuid;
    }
    mpoints[n].multi_text.text[mpoints[n].player-1] = '<td align=\'left\' valign=\'middle\'\>&nbsp;'+data[i].name+'</td\><td\>'+data[i].level+'</td\><td align=\'left\'\>'+char+'</td\><td align=\'left\'\ style=\'color: '+text_col+';\'>&nbsp;'+race_name[data[i].race]+'</td\><td align=\'left\'\>&nbsp;<img src=\'<?php echo $img_base2 ?>'+data[i].cl+'.gif\' style=\'float:center\' border=0 width=18 height=18\></td\><td align=\'left\'\>&nbsp;'+class_name[data[i].cl]+'&nbsp;</td\>';
    i++;
  }

  n=0;
  while(n!=point_count)
  {
    if(!in_array(mpoints[n].map_id, maps_array))
      instances[mpoints[n].Extention] += '<img src="<?php echo $img_base ?>inst-icon.gif" style="position: absolute; border: 0px; left: '+instances_x[mpoints[n].Extention][mpoints[n].map_id]+'px; top: '+instances_y[mpoints[n].Extention][mpoints[n].map_id]+'px;" onMouseMove="tip(mpoints['+n+'],1,false);" onMouseDown="tip(mpoints['+n+'],1,true);" onMouseOut="h_tip();mpoints['+n+'].multi_text.current=0;"\>';
    else if(mpoints[n].player > 1)
      groups[mpoints[n].Extention] += '<img src="<?php echo $img_base ?>group-icon.gif" style="position: absolute; border: 0px; left: '+mpoints[n].x+'px; top: '+mpoints[n].y+'px;" onMouseMove="tip(mpoints['+n+'],1,false);" onMouseDown="tip(mpoints['+n+'],1,true);" onMouseOut="h_tip();mpoints['+n+'].multi_text.current=0;"\>';
    else
    {
      if(mpoints[n].faction)
        point = "<?php echo $img_base ?>horde.gif";
      else
        point = "<?php echo $img_base ?>allia.gif";
      single[mpoints[n].Extention] += '<img src="'+point+'" style="position: absolute; border: 0px; left: '+mpoints[n].x+'px; top: '+mpoints[n].y+'px;" onMouseMove="tip(mpoints['+n+'],0,false);" onMouseOut="h_tip();"\>';
    }
    n++;
  }

  players_count = Array(0);
  total_players_count = new Array(0,0);

  for(i = 0; i < maps_count; i++)
  {
    obj = getPointsLayerByID(i);
    obj.innerHTML = instances[i] + single[i] + groups[i];
    players_count[i] = alliance_count[i] + horde_count[i];
    total_players_count[0] += alliance_count[i];
    total_players_count[1] += horde_count[i];
  }

  document.getElementById("server_info").innerHTML='online: <b style="color: rgb(100,100,100);" onMouseMove="tip(\'<tr\><td\><img src=\\\'<?php echo $img_base ?>hordeicon.gif\\\'\></td\><td\><b style=\\\'color: rgb(210,50,30);\\\'\><?php echo $lang_defs['faction'][1]; ?>:</b\> <b\>'+total_players_count[1]+'</b\></td\></tr\><tr\><td\><img src=\\\'<?php echo $img_base ?>allianceicon.gif\\\'\></td\><td\><b style=\\\'color: rgb(0,150,190);\\\'\><?php echo $lang_defs['faction'][0]; ?>:</b\> <b\>'+total_players_count[0]+'</b\></td\></tr\>\',2,false);" onMouseOut="h_tip();"><?php echo $lang_defs['total']; ?></b> '+eval(total_players_count[0]+total_players_count[1])+'';
  for(i = 0; i < maps_count; i++)
  {
    document.getElementById("server_info").innerHTML += '&nbsp;<b style="color: rgb(160,160,20); cursor:pointer;" onClick="switchworld('+i+');" onMouseMove="tip(\'<tr\><td\><img src=\\\'<?php echo $img_base ?>hordeicon.gif\\\'\></td\><td\><b style=\\\'color: rgb(210,50,30);\\\'\><?php echo $lang_defs['faction'][1]; ?>:</b\> <b\>'+horde_count[i]+'</b\></td\></tr\><tr\><td\><img src=\\\'<?php echo $img_base ?>allianceicon.gif\\\'\></td\><td\><b style=\\\'color: rgb(0,150,190);\\\'\><?php echo $lang_defs['faction'][0]; ?>:</b\> <b\>'+alliance_count[i]+'</b\></td\></tr\>\',2,false);" onMouseOut="h_tip();">'+maps_name_array[i]+'</b\> '+players_count[i]+'';
  }
}

function statusController(status_process_id,diff)
{
  var action = status_process[status_process_id].action;
  if(action)
  {
    var obj = document.getElementById("status");
    var text_type = status_process[status_process_id].text_type;
    if(text_type == 0)
    {
      var status_process_now = new Date();
      var status_process_diff = status_process_now.getTime() - status_process_started.getTime();
      var objDate = new Date(status_data[status_process[status_process_id].status_data]*1000 + status_process_diff);
      var days = parseInt(status_data[status_process[status_process_id].status_data]/86400);
      var hours = objDate.getUTCHours();
      var min = objDate.getUTCMinutes();
      var sec = objDate.getUTCSeconds();
      if(hours < 10) hours = '0'+hours;
      if(min < 10) min = '0'+min;
      if(sec < 10) sec = '0'+sec;
      if(days) days = days+' '; else days = '';
      obj.innerHTML = status_text[status_process[status_process_id].text_id]+' - '+days+''+hours+':'+min+':'+sec;
    }
    else if(text_type == 1)
    {
      obj.innerHTML = status_text[status_process[status_process_id].text_id]+' - '+status_data[status_process[status_process_id].status_data];
    }
    else
      obj.innerHTML = status_text[status_process[status_process_id].text_id];
    switch(action)
    {
      case 1:
        if(fade_cur_color > 0)
        {
          fade_cur_color--;
          obj.style.color = '#'+fade_colors[fade_cur_color];
        }
        break;
      case 2:
        if(fade_cur_color < (fade_colors.length-1))
        {
          fade_cur_color++;
          obj.style.color = '#'+fade_colors[fade_cur_color];
        }
        break;
    }
  }
  status_cur_time += diff;
  if(status_next_process || status_cur_time >= status_process[status_process_id].time)
  {
    if(status_next_process)
      status_cur_time = statusUpdateInterval*fade_colors.length;
    else
      status_cur_time = 0;
    do
    {
      status_process_id++;

      if(status_process_id >= (status_process.length))
        status_process_id = 0;
    } while(status_next_process && status_process[status_process_id].action == 2);
    status_next_process = 0;
  }
  setTimeout('statusController('+status_process_id+','+statusUpdateInterval+')', statusUpdateInterval);
}

function showNextStatusText()
{
  if(status_process.length > 2)
    status_next_process = 1;
}

function statusInit()
{
  var blinkTime = statusUpdateInterval*fade_colors.length;
  var time_to_show_uptime = <?php echo $time_to_show_uptime ?>;
  var time_to_show_maxonline = <?php echo $time_to_show_maxonline ?>;
  var time_to_show_gmonline = <?php echo $time_to_show_gmonline ?>;

  // for first time
  if(status_process.length == 0)
    setTimeout('statusController(0,'+statusUpdateInterval+')', statusUpdateInterval);

  status_process = new Array();
  if(status_data[0] == 1) // online
  {
    if(time_to_show_uptime)
    {
      status_process.push(new _status_action(2,1,0,1,time_to_show_uptime));
      status_process.push(new _status_action(2,1,0,2,blinkTime));
    }
    if(time_to_show_maxonline)
    {
      status_process.push(new _status_action(3,2,1,1,time_to_show_maxonline));
      status_process.push(new _status_action(3,2,1,2,blinkTime));
    }
    /*
    if(time_to_show_gmonline)
    {
      status_process.push(new _status_action(4,3,1,1,time_to_show_gmonline));
      status_process.push(new _status_action(4,3,1,2,blinkTime));
    } */
  }
  else if(status_data[0] == 0) // offline
  {
    status_process.push(new _status_action(0,0,2,1,blinkTime));
    status_process.push(new _status_action(0,0,2,2,blinkTime));
  }
  else //DB connect error
  {
    status_process.push(new _status_action(1,0,2,1,blinkTime));
    status_process.push(new _status_action(1,0,2,2,blinkTime));
  }
}

function load_data()
{
  var req = new Subsys_JsHttpRequest_Js();
  req.onreadystatechange = function()
  {
    if (req.readyState == 4)
    {
      if(show_status)
      {
        if(req.responseJS.status)
        {
          if(status_data[0] != req.responseJS.status.online)
          {
            status_data[0] = req.responseJS.status.online;
            var obj = document.getElementById("statusIMG");
            if(status_data[0] != 1)
            {
              obj.src = "<?php echo $img_base ?>realm_off.gif"
            }
            else
              obj.src = "<?php echo $img_base ?>realm_on.gif"
          }
          if(req.responseJS.status.uptime < status_data[1] || status_data[1] == 0)
          {
            status_process_started = new Date();
            status_data[1] = req.responseJS.status.uptime;
          }
          status_data[2] = req.responseJS.status.maxplayers;
          status_data[3] = req.responseJS.status.gmonline;
          statusInit();
        }
      }
      show(req.responseJS.online);
    }
  }
  req.open('GET', 'pomm_play.php', true);
  req.send({ });
}

function reset()
{
  var ms = 0;
  then = new Date();
  then.setTime(then.getTime()-ms);
  load_data();
}

function display()
{
  now = new Date();
  ms = now.getTime() - then.getTime();
  ms = time*1000-ms;
  if ((show_time==1) && (time!=0))
  {
    document.getElementById("timer").innerHTML=(Math.round(ms/1000));
  }
  if (ms<=0)
  {
    reset();
  }
  if (time!=0)
  {
    setTimeout("display();", 500);
  }
}

function start()
{
  reset();
  //display();

  if(navigator.appName=="Netscape")
  {
    document.onmousemove=function(e)
    {
      pointx = e.pageX;
      pointy = e.pageY;
      return true;
    }
  }
}
</SCRIPT>
<BODY onload=start()>

<div onMouseDown="showNextStatusText();" id="serverstatus">
    <table align="center" border="0" cellspacing="0" cellpadding="0" width="156px" height="36px">
        <tr><td id="status" class="statustext"></td></tr>
    </table>
</div>
<div id="tip"></div>
<div ID="pointsOldworld"></div>
<div ID="pointsOutland"></div>
<div ID="pointsNorthrend"></div>
<div ID="world"></div>
<div ID="outland"></div>
<div ID="northrend"></div>
<div ID="wow"><img src="<?php echo $img_base ?>realm_on.gif" id="statusIMG" style="position: absolute; border: 0px; left: 365; top: 0;" onClick="window.location='<?php echo $_SERVER['PHP_SELF'] ?>'"></a>
</div>
<div ID="info">
    <center>
    <table valign="top" border="0" cellspacing="0" cellpadding="0" height="16">
        <tr><td id="timer"></td></tr>
    </table>
    </center>
</div>
<div ID="info_bottom">
    <center>
    <table border="0" cellspacing="0" cellpadding="0" height="20" width="100%">
        <tr><td align="center" valign="top" id="server_info"></td></tr>
    </table>
    </center>
</div>
</BODY></HTML>
