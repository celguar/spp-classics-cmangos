function CheckAll(obj)
{
  for (var i=0;i<obj.elements.length;i++)
  {
    var e = obj.elements[i];
    if ((e.name != 'allbox') && (e.type=='checkbox') && (!e.disabled))
    {
      e.checked = obj.allbox.checked;
    }
  }
}

function CheckCheckAll(obj)
{
  var TotalBoxes = 0;
  var TotalOn = 0;
  for (var i=0;i<obj.elements.length;i++)
  {
    var e = obj.elements[i];
    if ((e.name != 'allbox') && (e.type=='checkbox'))
    {
      TotalBoxes++;
      if (e.checked)
      {
        TotalOn++;
      }
    }
  }

  if (TotalBoxes==TotalOn)
  {
    obj.allbox.checked=true;
  }
  else
  {
    obj.allbox.checked=false;
  }
}
