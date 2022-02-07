$(document).ready(function () {
  window.tmidLogin = function () { return false; };
  if ($.cookie('tmid_no_check') == undefined) {
    var expire = new Date();
    var tmidCheckUrl = window.g_tmid_fullurl + 'checklogin/';

    expire.setMinutes(expire.getMinutes() + 10);
    $.cookie('tmid_no_check', 1, {
      expires: expire,
      path: '/',
      secure: true,
    });
    $.getScript(tmidCheckUrl, function () {
      if (window.tmidLogin()) {
        var href = $('#login').attr('href') + '?checklogin=true';
        if (href !== undefined) { window.location.href = href; }
      }
    });
  }
});
