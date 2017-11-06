// Copyright 1999-2014. Parallels IP Holdings GmbH. All Rights Reserved.
/* JavaScript Widgets */
var Logger_shifouIE=false;
if(navigator.appName=="Microsoft Internet Explorer"){
	Logger_shifouIE=true;
}else{
	Logger_shifouIE=false;
}

Logger = {

    version: '1.0',
    isIE:function(){
    	return Logger_shifouIE;
    },
    log: function(msg) {
        if (!Logger_shifouIE) {
            console.log(msg);
        }

    }
};

