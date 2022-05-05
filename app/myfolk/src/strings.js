String.prototype.standardizeName = function(){
    var str = this
    str = str.replaceAll('.', ' ')
    str = str.replace(/  +/g, ' ')
    str = str.trim()
    var parts = str.split(" ")
    if(parts.length!=str.replaceAll(" ","").length){
      while(parts[0].length==1){
        parts.push(parts.shift())
      }
    }
    str=parts.join(" ")
    return str.toTitleCase()
}

String.prototype.toCamelCase = function() {
    return this.toLowerCase()
      .replace( /['"]/g, '' )
      .replace( /\W+/g, ' ' )
      .replace( / (.)/g, function($1) { return $1.toUpperCase(); })
      .replace( / /g, '' );
  }
  
  String.prototype.toTitleCase = function() {
    return this.replace(
      /\w\S*/g,
      function(txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
      }
    );
  }