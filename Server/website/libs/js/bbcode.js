function addbbcode(textarea_id, bbcode, param, contain)
{
  var target = (document.getElementById) ? document.getElementById(textarea_id) : document.all[textarea_id];
  var scroll = target.scrollTop;

  param = (param && param != '') ? '=' + param : '';
  if (!contain)
    contain = '';

  if (document.selection)
  {
    target.focus();
    var text_sel = document.selection.createRange();
    text_sel.text = '[' + bbcode + param + ']' + text_sel.text + contain + '[/' + bbcode + ']';
  }
  else if (target.selectionStart >= 0 && target.selectionEnd >= 0)
  {
    var text_ini = target.value.substring(0, target.selectionStart);
    var text_sel = target.value.substring(target.selectionStart, target.selectionEnd);
    var text_end = target.value.substring(target.selectionEnd);

    target.value = text_ini + '[' + bbcode + param + ']' + text_sel + contain + '[/' + bbcode + ']' + text_end;
    target.focus();
    target.setSelectionRange(text_ini.length + bbcode.length + param.length + 2, target.value.length - text_end.length - bbcode.length - 3);
  }
  else
  {
    target.value += '[' + bbcode + param + ']' + '[/' + bbcode + ']';
    target.focus();
  }

  target.scrollTop = scroll;
}


function addText(textarea_id, text)
{
  var target = (document.getElementById) ? document.getElementById(textarea_id) : document.all[textarea_id];
  if (document.selection)
  {
    target.focus();
    var text_sel = document.selection.createRange();
    text_sel.text = text;
  }
  else if (target.selectionStart >= 0 && target.selectionEnd >= 0)
  {
    var text_ini = target.value.substring(0, target.selectionStart);
    var text_end = target.value.substring(target.selectionStart);
    target.value = text_ini + text + text_end;
    target.focus();
  }
  else
  {
    target.value += text;
    target.focus();
  }

  return false;
}


function add_url(textarea_id)
{
  var target = (document.getElementById) ? document.getElementById(textarea_id) : document.all[textarea_id];
  var url = prompt('URL:', 'http://');
  var text = '';

  if (document.selection)
  {
    target.focus();
    var text_sel = document.selection.createRange();
    text = text_sel.text
    if (!text) prompt('Text:');
    if(text != '')
      addText(textarea_id, '[url='+ url + ']' + text + '[/url]');
    else
      addText(textarea_id, '[url]' + url + '[/url]');
  }
  else if ((target.selectionStart == target.selectionEnd) || (!target.selectionStart && !target.selectionEnd))
  {
    text = prompt('Text:');
    if(text != '')
      addbbcode(textarea_id, 'url', url, text);
    else
      addbbcode(textarea_id, 'url', '', url);
  }
}


function add_mail(textarea_id)
{
  var target = (document.getElementById) ? document.getElementById(textarea_id) : document.all[textarea_id];
  var email;

  if (document.selection)
  {
    target.focus();
    var text_sel = document.selection.createRange();
    var text = text_sel.text
    if(text.match('@'))
    {
      email = text;
      text = prompt('Name:');
    }
    else
    {
      email = prompt('E-Mail:','name@domain.com');
    }

    if(text)
      addText(textarea_id, '[mail='+ email + ']' + text + '[/mail]');
    else
      addText(textarea_id, '[mail]' + email + '[/mail]');

    return true;
  }
  else if (target.selectionStart >= 0 && target.selectionEnd >= 0)
  {
    var text_sel = target.value.substring(target.selectionStart, target.selectionEnd);
    if(text_sel.indexof('@'))
    {
      email = text_sel;
      var text = prompt('Name:');
    }
    else
    {
      var text = text_sel;
      email = prompt('E-Mail:','name@domain.com');
    }
  }
  else
  {
    email = prompt('E-Mail:','name@domain.com');
    var text = prompt('Name:');
  }

  if(text)
    addbbcode(textarea_id, 'mail', email, text);
  else
    addbbcode(textarea_id, 'mail', '', email);
}


function add_img(textarea_id)
{
  var target = (document.getElementById) ? document.getElementById(textarea_id) : document.all[textarea_id];

  if (document.selection)
  {
    target.focus();
    var text_sel = document.selection.createRange();
    text_sel = text_sel.text;
    var url = prompt('URL image:', ((text_sel) ? text_sel : 'http://'));
    if (url) addText(textarea_id, '[img]' + url + '[/img]');
  }
  else if (target.selectionStart >= 0 && target.selectionEnd >= 0)
  {
    var text_sel = target.value.substring(target.selectionStart, target.selectionEnd);
    var url = prompt('URL image:', ((text_sel) ? text_sel : 'http://'));
    if (url) addbbcode(textarea_id, 'img', '', url);
  }
}


function add_quote(textarea_id)
{
  var text = prompt('Quote Name:', '');
  if (text)
    addbbcode(textarea_id, 'quote', text);
  else
    addbbcode(textarea_id, 'quote');
}
