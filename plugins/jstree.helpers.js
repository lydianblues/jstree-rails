(function ($) {
    $.jstree.plugin("helpers", {
        _fn : { 
	    get_path: function(obj, id_mode) {
	        var p = [],
	        _this = this;
	        obj = this.get_node(obj);
	        if (obj === -1 || !obj || !obj.length) { return false; }
	        obj.parentsUntil(".jstree", "li").each(function () {
	            p.push( id_mode ? this.id : _this.get_text(this) );
	        });
	        p.reverse();
	        p.push( id_mode ? obj.attr("id") : this.get_text(obj) );
	        return p;
	    }
	}
    })
})(jQuery);
