function stringifyJSON(obj){
    keys = [];
    if(obj){
        for(var key in obj){
            keys.push(key);
        }
    }
    keys.sort();
    var tObj = {};
    var key;
    for(var index in keys){
        key = keys[index];
        tObj[ key ] = obj[ key ];
    }
    return JSON.stringify(tObj, undefined, 2);
}

function syntaxHighlight(json) {
    if (typeof json != 'string') {
      //console.log("converting object to json string");
      json = stringifyJSON(json)
    }
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}
