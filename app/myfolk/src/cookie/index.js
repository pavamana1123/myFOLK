function set(cname, cvalue, exdays) {
    if(typeof(cname)==="object"){
      for(var key in cname){
        set(key, cname[key])
      }
    }else{
      var d = new Date();
      exdays = exdays || 999
      d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
      var expires = ";expires="+d.toUTCString();
      document.cookie = cname + "=" + cvalue + expires;
    }
  }
  
  function get(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) === ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) === 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

  function clear(cname){
    if(!cname){
      document.cookie.split(";").forEach(function(c) { document.cookie = c.replace(/^ +/, "").replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/"); });
    }else{
      document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    }
  }



var cookie = {
    set,
    get,
    clear
}

export default cookie