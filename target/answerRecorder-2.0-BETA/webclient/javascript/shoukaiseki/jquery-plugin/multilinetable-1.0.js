(function($) {
		var datas=[];
	
		var getDefaults = function() {
		return {
			"datas": []
		};
	};
	
	/* JavaScript Widgets */
	$.fn.multilinetable = function(options) {
		var multilinetableobj=this;
		var defaults = getDefaults();
		var settings = $.extend({},defaults, options);//将一个空对象做为第一个参数
		datas=settings.datas
		var rowCount=12;
		return this.each(function(i) {
			
			var $d = $('<div>');
			$d.append("asus");
			multilinetableobj.append($d);
		});
	};

	$.fn.multilinetablereload=function(datas){
		Logger.log(datas);
	};
})(jQuery);