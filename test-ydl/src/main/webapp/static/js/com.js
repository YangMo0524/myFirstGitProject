function Client() {
	 this.uploadNotOpen = function(a) {
		$("button[name='" + a + "']").hide()
	}
}
function ADClass() {
	this.count = function() {}, this.parse = function(a) {
		var b, c, e, d = "",
			f = "",
			g = "",
			h = $("#ow_ad_" + a),
			i = {},
			j = {},
			k = {},
			l = {},
			m = {},
			n = h.attr("data"),
			o = h.attr("type"),
			p = h.attr("ad_height"),
			q = h.attr("ad_width"),
			r = OW.int(h.attr("full_screen")),
			s = OW.int(h.attr("switch_time")),
			w = -OW.int(q) / 2,
			x = "",
			y = "",
			z = "";
		if (1 > s && (s = 6), "" != n) switch (o) {
		case "image":
			if (e = OW.JSON.parse(n), 1 == e.length) x = OW.trim(e[0].link), y = 'target="_blank"', (OW.isNull(x) || "#" == x) && (z = "cursor-default", x = "javascript:;", y = ""), h.html('<div class="ow-ad-pic"><a class="' + z + '" href="' + x + '" ' + y + '><img src="' + e[0].url + '"></a></div>').show(), j = h.find(".ow-ad-pic").css({
				height: p,
				width: q
			}), k = h.find("a").css({
				height: p,
				width: q
			}), l = h.find("img").css({
				height: p,
				width: q
			}), r && (h.css({
				width: "100%"
			}), j.css({
				overflow: "hidden",
				position: "absolute",
				width: "100%"
			}), k.css({
				left: "50%",
				"margin-left": w,
				position: "absolute",
				width: q
			}));
			else if (e.length > 1) {
				for (b = '<div class="ow-pic-player">', c = 0; c < e.length; c++) OW.isNull(e[c].link) || "#" == e[c].link ? (z = "cursor-default", x = "javascript:;", y = "") : (z = "", x = OW.trim(e[c].link), y = 'target="_blank"'), d = d + '<li i="' + c + '"><a class="' + z + '" href="' + x + '" ' + y + '><img src="' + e[c].url + '"></a><div class="title"><a class="' + z + '" href="' + x + '" ' + y + ">" + unescape(e[c].name) + "</a></div></li>", f = f + '<a href="javascript:;" i="' + c + '">' + (c + 1) + "</a>";
				b = b + '<ul class="sliders" name="sliders">' + d + "</ul>", b = b + '<div class="pages" name="pages">' + f + "</div>", b += '<div class="turner" name="turner"><a class="prev" href="javascript:;"></a><a class="next" href="javascript:;"></a></div>', b += "</div>", h.html(b).show(), i = h.find(".ow-pic-player").css({
					height: p,
					width: q
				}), $sliders = h.find("ul[name='sliders']").css({
					height: p,
					width: q
				}), l = h.find("img").css({
					height: p,
					width: q
				}), m = h.find("div[name='pages']"), r && (h.css({
					width: "100%"
				}), i.css({
					width: "100%"
				}), $sliders.css({
					left: "50%",
					"margin-left": w
				}), m.css({
					left: "50%",
					"margin-left": -OW.int(m.width()) / 2
				})), OW.ad.picPlayer({
					obj: h,
					timer: 1e3 * s
				})
			}
			break;
		case "flash":
			e = OW.JSON.parse(n), g = e.url, b = '<embed src="' + g + '" quality="high" wmode="opaque" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash">', h.html(b).show(), h.find("embed").css({
				height: p,
				width: h.css("width")
			})
		}
	}, this.picPlayer = function(a) {
		var b, l, m, n, o, c = a.obj,
			d = a.timer,
			e = c.find("ul[name='sliders']"),
			f = c.find("div[name='pages']"),
			g = c.find("div[name='turner']").hide(),
			h = g.find("a.prev"),
			i = g.find("a.next"),
			j = f.find("a"),
			k = j.length;
		e.find("li").hide(), e.find("li:first").show(), f.find("a:first").addClass("current"), h.click(function() {
			o();
			var a, b = parseInt(f.find("a.current").attr("i"));
			a = 0 == b ? k - 1 : b - 1, m(b, a)
		}), i.click(function() {
			o();
			var a, b = parseInt(f.find("a.current").attr("i"));
			a = b == k - 1 ? 0 : b + 1, m(b, a), n()
		}), j.click(function() {
			var a, b;
			o(), a = parseInt(f.find("a.current").attr("i")), b = parseInt($(this).attr("i")), a != b && m(a, b), n()
		}), l = function() {
			var a, b = parseInt(f.find("a.current").attr("i"));
			a = b == k - 1 ? 0 : b + 1, m(b, a)
		}, m = function(a, b) {
			e.find("li:eq(" + a + ")").hide(), e.find("li:eq(" + b + ")").fadeIn("fast"), f.find("a:eq(" + a + ")").removeClass("current"), f.find("a:eq(" + b + ")").addClass("current")
		}, n = function() {
			d && (b = window.clearInterval(b), b = window.setInterval(function() {
				l()
			}, d))
		}, o = function() {
			d && (b = window.clearInterval(b))
		}, c.hover(function() {
			o(), g.show()
		}, function() {
			n(), g.hide()
		}).mouseout()
	}
}
OW.ad = new ADClass;