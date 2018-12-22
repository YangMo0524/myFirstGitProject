function OW_Class() {
	var THIS = this;
	this.client = "", this.link = "", this.ad = "", this.gallery = "", this.member = "", this.search = "", this.shop = "", this.cookie = new Cookie_Class, this.JSON = new JSON_Class, this.encrypt = new Encrypt_Class, this.ajaxData = "", this.ajax = function(a) {
	}, this.int = function(a) {
		return "" == a || null == a ? 0 : (a += "", "px" == OW.right(a, 2) ? (a = a.replace(/[^0-9.-]*/g, ""), "" == a && (a = "0"), a = parseInt(a)) : (a = a.replace(/[^0-9.-]*/g, ""), "" == a && (a = 0), a = parseInt(a)), a)
	}, this.isNull = function(a) {
		var b = $.trim(a);
		return null == b ? !0 : "undefined" == b ? !0 : "" == b ? b === !1 || b === !0 ? !1 : !0 : !1
	}, this.right = function(a, b) {
		if (OW.isNull(a)) return "";
		a += "";
		var c = a.length;
		return c > b && (a = a.substring(c - b, c)), a
	}
}
function Cookie_Class() {}
function JSON_Class() {
	this.parse = function(a) {
		return $.parseJSON(a)
	}
}
function Encrypt_Class() {}
var OWDialog, OWValidForm, OW = new OW_Class;
