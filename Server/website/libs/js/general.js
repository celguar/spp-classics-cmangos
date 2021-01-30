function do_submit (form_name,backup)
{
  if (form_name == 'form1')
  {
    if (backup == '1')
      document.form1.backup_op.value = "1";
    else if(document.form1.backup_op)
      document.form1.backup_op.value = "0";
    document.form1.submit();
  }
  else
    if (form_name == 'form2')
      document.form2.submit();
  else
    document.form.submit();
}


function expand(thistag, tag, name)
{
  styleObj = document.getElementById(thistag).style;

  if(name == undefined)
    name = '';

  if (styleObj.display == "table")
  {
    styleObj.display="none";
    tag.innerHTML = '[+] ' + name;
  }
  else
  {
    styleObj.display="table";
    tag.innerHTML = '[-] ' + name;
  }
}


function showHide(id,force)
{
  var o, st;
  if( document.getElementById ) // Standart way
    o = document.getElementById(id);
  else
    if(document.all) // for old MSIE
      o = document.all[id];
  else
    if(document.layers) // for NN4
      o = document.layers[id];
  st = o.style;

  if(force != undefined)
  {
    st.display = (force) ? 'table' : 'none';
    return
  }
  // if the style.display value is blank we try to figure it out here
  if(st.display == '' && o.offsetWidth != undefined && o.offsetHeight != undefined)
    st.display = (o.offsetWidth != 0 && o.offsetHeight != 0) ? 'table' : 'none';
  st.display = (st.display == '' || st.display == 'table') ? 'none' : 'table';
}


/*
 +-------------------------------------------------------------------+
 |                   J S - T O O L T I P   (v2.1)                    |
 |                                                                   |
 | Copyright Gerd Tentler                www.gerd-tentler.de/tools   |
 | Created: Feb. 15, 2005                Last modified: Apr. 9, 2007 |
 +-------------------------------------------------------------------+
*/
var OP = (navigator.userAgent.indexOf('Opera') != -1);
var IE = (navigator.userAgent.indexOf('MSIE') != -1 && !OP);
var GK = (navigator.userAgent.indexOf('Gecko') != -1);
var SA = (navigator.userAgent.indexOf('Safari') != -1);
var DOM = document.getElementById;
var tooltip = null;

function TOOLTIP()
{
  this.text = '';
  this.height = 0;
  this.obj = null;
  this.active = false;

  this.create = function(tip_class)
  {
    if(!this.obj)
      this.init();

    var t = '<table class ="'+ tip_class +'"><tr><td>'+ this.text +'</td></tr></table>';

    if(DOM || IE)
      this.obj.innerHTML = t;
    if(DOM)
    {
      this.width = this.obj.offsetWidth;
      this.height = this.obj.offsetHeight;
    }
    else if(IE)
    {
      this.width = this.obj.style.pixelWidth;
      this.height = this.obj.style.pixelHeight;
    }


    this.move();
    this.show();
  }

  this.init = function()
  {
    if(DOM)
      this.obj = document.getElementById('ToolTip');
    else if(IE)
      this.obj = document.all.ToolTip;
  }

  this.move = function()
  {
    var winX = getWinX() - (((GK && !SA) || OP) ? 17 : 0);
    var winY = getWinY() - (((GK && !SA) || OP) ? 17 : 0);
    var x = mouseX;
    var y = mouseY;

    if(x + this.width + 10 > winX + getScrX())
      x -= this.width + 10;
    else
      x += 10;

    if(y + this.height + 10 > winY + getScrY())
      y -= this.height;
    else
      y += 10;

    this.obj.style.left = x + 'px';
    this.obj.style.top = y + 'px';
  }

  this.show = function()
  {
    this.obj.style.zIndex = 69;
    this.active = true;
    this.obj.style.visibility = 'visible';
  }

  this.hide = function()
  {
    this.obj.style.zIndex = -1;
    this.active = false;
    this.obj.style.visibility = 'hidden';
  }

}


function getScrX()
{
  var offset = 0;
  if(window.pageXOffset)
    offset = window.pageXOffset;
  else if(document.documentElement && document.documentElement.scrollLeft)
    offset = document.documentElement.scrollLeft;
  else if(document.body && document.body.scrollLeft)
    offset = document.body.scrollLeft;
  return offset;
}


function getScrY()
{
  var offset = 0;
  if(window.pageYOffset)
    offset = window.pageYOffset;
  else if(document.documentElement && document.documentElement.scrollTop)
    offset = document.documentElement.scrollTop;
  else if(document.body && document.body.scrollTop)
    offset = document.body.scrollTop;
  return offset;
}


function getWinX()
{
  var size = 0;
  if(window.innerWidth)
    size = window.innerWidth;
  else if(document.documentElement && document.documentElement.clientWidth)
    size = document.documentElement.clientWidth;
  else if(document.body && document.body.clientWidth)
    size = document.body.clientWidth;
  else
    size = screen.width;
  return size;
}


function getWinY()
{
  var size = 0;
  if(window.innerHeight)
    size = window.innerHeight;
  else if(document.documentElement && document.documentElement.clientHeight)
    size = document.documentElement.clientHeight;
  else if(document.body && document.body.clientHeight)
    size = document.body.clientHeight;
  else
    size = screen.height;
  return size;
}


function getMouseXY(e)
{
  if(e && e.pageX != null)
  {
    mouseX = e.pageX;
    mouseY = e.pageY;
  }
  else if(event && event.clientX != null)
  {
    mouseX = event.clientX + getScrX();
    mouseY = event.clientY + getScrY();
  }
  if(mouseX < 0)
    mouseX = 0;
  if(mouseY < 0)
    mouseY = 0;
  if(tooltip && tooltip.active)
    tooltip.move();
}


function toolTip(text,tip_class)
{
  if(text)
  {
    tooltip = new TOOLTIP();
    tooltip.text = text;
    tooltip.create(tip_class);
  }
  else if(tooltip)
    tooltip.hide();
}

document.write('<div id="ToolTip" style="position:absolute; visibility:hidden"></div>');

var mouseX = mouseY = 0;
document.onmousemove = getMouseXY;

function ANSWERBOX()
{
  this.text = '';
  this.btn_ok = 'OK';
  this.btn_cancel = 'Cancel';
  this.classname = 'answerbox';
  this.btn_icon = 'img/warn_red.gif';
  this.height = 0;
  this.obj = null;
  this.active = false;

  this.create = function(action)
  {
    if(!this.obj)
      this.init();

    var t = ''
      +'<table class="' + this.classname + '">'
        +'<tr>'
          +'<th colspan=2>'
            +((this.btn_icon)?'<img src="'+ this.btn_icon +'" width="48" height="48" alt="" align="absmiddle" />':'')+ this.text +''
          +'</th>'
        +'</tr>'
        +'<tr align="center">'
        +'  <td>'
        +'    <a class="button" style="width:120px;" href="' + action + '" type="wrn">' + this.btn_ok + '</a>'
        +'  </td>'
        +'  <td>'
        +'    <a class="button" style="width:120px;" href="#" onclick="answerbox.hide()" type="def">' + this.btn_cancel + '</a>'
        +'  </td>'
        +'</tr>'
      +'</table>';

    if(DOM || IE)
      this.obj.innerHTML = t;
    if(DOM)
    {
      this.width = this.obj.offsetWidth;
      this.height = this.obj.offsetHeight;
    }
    else if(IE)
    {
      this.width = this.obj.style.pixelWidth;
      this.height = this.obj.style.pixelHeight;
    }

    this.move();
    this.show();
  }

  this.init = function()
  {
    if(DOM)
      this.obj = document.getElementById('AnswerBox');
    else if(IE)
      this.obj = document.all.AnswerBox;
  }

  this.move = function()
  {
    var winX = getWinX() - (((GK && !SA) || OP) ? 17 : 0);
    var winY = getWinY() - (((GK && !SA) || OP) ? 17 : 0);

    this.obj.style.left = (winX/2 + getScrX() - this.width/2 - 5) + 'px';
    this.obj.style.top = (winY/2 + getScrY() - this.height/2 - 5) + 'px';
  }

  this.show = function()
  {
    this.obj.style.zIndex = 60;
    this.active = true;
    this.obj.style.visibility = 'visible';
  }

  this.hide = function()
  {
    this.obj.style.zIndex = -1;
    this.active = false;
    this.obj.style.visibility = 'hidden';
  }

}

function answerBox(text, action)
{
  if(text)
  {
    answerbox.text = text;
    answerbox.create(action);
  }
}


document.write('<div id="AnswerBox" style="position:absolute; visibility:hidden"></div>');
answerbox = new ANSWERBOX();
answerbox.init();
