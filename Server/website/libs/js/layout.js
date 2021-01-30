// getBrowserWidth is taken from The Man in Blue Resolution Dependent Layout Script
function getBrowserWidth()
{
  if (window.innerWidth)
  {
    return window.innerWidth;
  }
  else if (document.documentElement && document.documentElement.clientWidth != 0)
  {
    return document.documentElement.clientWidth;
  }
  else if (document.body)
  {
    return document.body.clientWidth;
  }
  return 0;
}

// changeLayout is based on setActiveStyleSheet function by Paul Sowdon 
// http://www.alistapart.com/articles/alternate/
function dynamicLayout()
{
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++)
  {
    if (a.getAttribute("title") == 1280)
    {
      ( getBrowserWidth() > 1024) ? a.disabled = false : a.disabled = true;
    }
  }
}

function addEvent( obj, type, fn )
{
  if (obj.addEventListener)
  {
    obj.addEventListener( type, fn, false );
  }
  else if (obj.attachEvent)
  {
    obj["e"+type+fn] = fn;
    obj[type+fn] = function()
    {
      obj["e"+type+fn]( window.event );
    }
    obj.attachEvent( "on"+type, obj[type+fn] );
  }
}

addEvent(window, 'load', dynamicLayout);
addEvent(window, 'resize', dynamicLayout);
