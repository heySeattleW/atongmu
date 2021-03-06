<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" import="com.atongmu.bean.Tbl_order"
	import="java.text.SimpleDateFormat" import="com.atongmu.bean.Tbl_user"
	import="com.atongmu.bean.Tbl_order_detail"
	import="com.atongmu.bean.Tbl_commodity"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no">
<title>发货单</title>
<style>
@CHARSET "UTF-8";
.body{
	margin-left:10px;
}

/*-----------------------------global.less(start)-----------------------------*/
.events-none {
  pointer-events: none;
}
.events-auto {
  pointer-events: auto;
}
/*绂佹鎴栨樉绀虹郴缁熼粯璁よ彍鍗�*/
.noselect {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
* {
  margin: 0;
  padding: 0;
}
body {
  font-size: 15px;
  font-family: Arial, "Microsoft Yahei";
}
i,
span {
  display: inline-block;
}
button,
input,
select,
option,
textarea,
pre {
  font-size: inherit;
  font-family: inherit;
}
textarea {
  resize: none;
}
ul,
li,
dl,
dt,
dd {
  list-style: none;
}
a {
  text-decoration: none;
  outline: none;
  cursor: pointer;
  display: inline-block;
}
a,
label,
:focus {
  outline: 0 none;
}
label {
  vertical-align: middle;
}
img {
  border: 0;
  vertical-align: middle;
}
abbr[title] {
  border-bottom: 1px dotted;
}
dfn {
  font-style: italic;
}

pre {
  white-space: pre-wrap;
  white-space: -moz-pre-wrap;
  white-space: -pre-wrap;
  white-space: -o-pre-wrap;
  word-wrap: break-word;
}
.code {
  display: block;
  font-size: 13px;
  line-height: 1.42857143;
  word-break: break-all;
  word-wrap: break-word;
}
/*瀹瑰櫒鏍峰紡*/
.highlight {
  padding: 9px 14px;
  margin: 14px;
  border-radius: 4px;
  border-width: 1px;
  border-style: solid;
  border-color: #ddd;
  background-color: #f7f7f7;
}
.highlight pre {
  word-break: normal;
}
.doctype {
  color: #099;
}
.comment {
  color: #094;
}
.tag {
  color: #2f6f9f;
}
.property {
  color: #4f9fcf;
}
.val {
  color: #d44950;
}
.relative {
  position: relative;
}
.absolute {
  position: absolute;
}
.overflow-hide {
  overflow: hidden;
}
.overflow-auto {
  overflow: hidden;
}
.overflow-scroll {
  overflow: scroll;
}
.overflow-x {
  overflow-y: hidden;
  overflow-x: auto;
  white-space: nowrap;
}
.overflow-y {
  overflow-y: auto;
  overflow-x: hidden;
}
.break-all {
  word-break: break-all;
}
.nowrap {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
/*娓呴櫎娴姩*/
.clearfix:before,
.clearfix:after {
  display: table;
  content: " ";
}
.clearfix:after {
  clear: both;
}
.clearfix {
  zoom: 1;
}
.clear {
  clear: both;
}
/*css3 鐗规晥*/
.shadow {
  box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.2);
  /*鍒嗗埆鎸囨姇褰辩殑锛氬亸鍙炽�佸亸涓嬨�佹ā绯婂害銆佹墿灞曘�侀鑹�*/
}
/*鍊掑奖*/
.reflect-below {
  -webkit-box-reflect: below 5px -webkit-linear-gradient(transparent, transparent 60%, rgba(0, 0, 0, 0.2));
}
.bg-gradient {
  background-image: -webkit-gradient(linear, left top, left bottom, from(#dddddd), to(#eeeeee));
  border-top: 1px solid #fff;
  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.1) inset;
}
.noopacity {
  opacity: 1;
  filter: alpha(opacity=100);
}
.opacity7 {
  opacity: 0.7;
  filter: alpha(opacity=70);
}
.opacity6 {
  opacity: 0.6;
  filter: alpha(opacity=60);
}
.opacity3 {
  opacity: 0.3;
  filter: alpha(opacity=30);
}
.opacity0 {
  opacity: 0;
  filter: alpha(opacity=0);
}
/*鑳屾櫙*/
.bg-cover {
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}
/*杈规涓庣嚎鏉�*/
.borderbox {
  box-sizing: border-box;
}
.contentbox {
  box-sizing: content-box;
}
.noborder {
  border: none !important;
}
hr {
  border: none;
  clear: both;
  border-width: 1px 0 0 0;
  border-style: solid;
}
hr.dotted {
  border-style: dotted;
}
br {
  clear: both;
}
/*鏂囧瓧*/
small {
  font-size: 80%;
  color: #aaa;
}
.bold {
  font-weight: bold;
}
.uppercase {
  text-transform: uppercase;
  /*澶у啓*/
}
.lowercase {
  text-transform: lowercase;
  /*灏忓啓*/
}
.capitalize {
  text-transform: capitalize;
  /*棣栧瓧姣嶅ぇ鍐�*/
}
/*-----------------------------global.less(end)-----------------------------*/
.before-sepia,
.before-grayscale,
.before-blur,
.before-invert,
.before-saturate,
.before-contrast,
.before-brightness,
.before-hue-rotate,
.before-drop-shadow {
  position: relative;
  z-index: 0;
}
.before-sepia:before,
.before-grayscale:before,
.before-blur:before,
.before-invert:before,
.before-saturate:before,
.before-contrast:before,
.before-brightness:before,
.before-hue-rotate:before,
.before-drop-shadow:before {
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  overflow: hidden;
}
.sepia,
.before-sepia:before {
  /**  鏍煎紡锛宖iler: sepia(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥翠负0-1鎴�0-100%锛�0琛ㄧず鏃犳晥鏋滐紝1鎴�100%琛ㄧず鏈�澶ф晥鏋�
     */
  -webkit-filter: sepia(100%);
  -moz-filter: sepia(100%);
  -o-filter: sepia(100%);
  -ms-filter: sepia(100%);
  filter: sepia(100%);
}
.grayscale,
.before-grayscale:before {
  /**  鏍煎紡锛宖iler: grayscale(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥翠负0-1鎴�0-100%锛�0琛ㄧず鏃犳晥鏋滐紝1鎴�100%琛ㄧず鏈�澶ф晥鏋�
     */
  -webkit-filter: grayscale(100%);
  -o-filter: grayscale(100%);
  -moz-filter: grayscale(100%);
  -ms-filter: grayscale(100%);
  filter: grayscale(100%);
}
.blur,
.before-blur:before {
  /**  鏍煎紡锛宖iler: blur(妯＄硦鍗婂緞)
     *  妯＄硦鍗婂緞锛屽彇鍊艰寖鍥�0~Npx锛�0涓烘棤鏁堟灉
     */
  -moz-filter: blur(2px);
  -o-filter: blur(2px);
  -ms-filter: blur(2px);
  filter: blur(2px);
  opacity: 0.9;
  -webkit-filter: blur(2px);
}
.invert,
.before-invert:before {
  /**  鏍煎紡锛宖iler: invert(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥�0~1鎴�0~100%锛�0涓烘棤鏁堟灉锛�1鎴�100%琛ㄧず鏈�澶ф晥鏋�
     */
  -webkit-filter: invert(1);
  -moz-filter: invert(1);
  -o-filter: invert(1);
  -ms-filter: invert(1);
  filter: invert(1);
}
.saturate,
.before-saturate:before {
  /**  鏍煎紡锛宖iler: saturate(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥�>=0鐨勬暟瀛楁垨鐧惧垎鏁帮紝1涓烘棤鏁堟灉锛�0涓虹伆搴﹀浘
     */
  -webkit-filter: saturate(2);
  -moz-filter: saturate(2);
  -o-filter: saturate(2);
  -ms-filter: saturate(2);
  filter: saturate(2);
}
.contrast,
.before-contrast:before {
  /**  鏍煎紡锛宖iler: contrast(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥�>=0鐨勬暟瀛楁垨鐧惧垎鏁帮紝1涓烘棤鏁堟灉
     */
  -webkit-filter: contrast(2);
  -moz-filter: contrast(2);
  -o-filter: contrast(2);
  -ms-filter: contrast(2);
  filter: contrast(2);
}
.brightness,
.before-brightness:before {
  /**  鏍煎紡锛宖iler: brightness(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖鍥�>=0鐨勬暟瀛楁垨鐧惧垎鏁帮紝1涓烘棤鏁堟灉
     */
  -webkit-filter: brightness(2);
  -moz-filter: brightness(2);
  -o-filter: brightness(2);
  -ms-filter: brightness(2);
  filter: brightness(2);
}
.hue-rotate,
.before-hue-rotate:before {
  /**  鏍煎紡锛宖iler: hue-rotate(鏁堟灉鑼冨洿)
     *  鏁堟灉鑼冨洿锛屽彇鍊艰寖0deg~365deg锛�0锛堥粯璁ゅ�硷級涓烘棤鏁堟灉
     */
  -webkit-filter: hue-rotate(200deg);
  -moz-filter: hue-rotate(200deg);
  -o-filter: hue-rotate(200deg);
  -ms-filter: hue-rotate(200deg);
  filter: hue-rotate(200deg);
}
.drop-shadow,
.before-drop-shadow:before {
  /**  鏍煎紡锛宖iler: drop-shadow(x-offset y-offset 闃村奖妯＄硦鍗婂緞 闃村奖棰滆壊)
     *  x-offset鍜寉-offset涓洪槾褰辩殑鐩稿浜庡厓绱犲乏涓婅鐨勪綅绉昏窛绂伙紱
     * 娉ㄦ剰锛�
     *     1. 闃村奖鐨勫瑙傚彈border-radius鏍峰紡鐨勫奖鍝嶏紱
     *     2. :after鍜�:before绛変吉鍏冪礌浼氱户鎵块槾褰辩殑鏁堟灉銆�
     */
  -webkit-filter: drop-shadow(1px 1px 0px #333333);
  -moz-filter: drop-shadow(1px 1px 0px #333333);
  -o-filter: drop-shadow(1px 1px 0px #333333);
  -ms-filter: drop-shadow(1px 1px 0px #333333);
  filter: drop-shadow(1px 1px 0px #333333);
  /*鍦嗚*/
}
/*----------------mbox.less(start)--------------*/
html,
body {
  height: 100%;
}
body {
  /* position:fixed;
	top:0;
	right:0;
	bottom:0;
	left:0;
	overflow:hidden; */
  /*ios鐐瑰嚮涓�涓摼鎺ユ椂浜х敓鐨勫崐閫忔槑鐏拌壊鑳屾櫙锛岃缃畠涓洪�忔槑鑹�*/
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  /*绂佹鏂囧瓧鑷�傚簲澶у皬*/
  -webkit-text-size-adjust: none;
  -moz-text-size-adjust: none;
  -ms-text-size-adjust: none;
  -o-text-size-adjust: none;
  text-size-adjust: none;
}
/*涓讳綋*/
#section_container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 3;
  overflow: hidden;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -ms-transition: all 0.5s;
  transition: all 0.5s;
}
/*涓讳綋閬僵*/
.section_container_mask {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 999;
  overflow: hidden;
  display: none;
}
section {
  display: none;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  overflow: hidden;
}
section.active {
  display: block;
}
article {
  position: absolute;
  z-index: 0;
  top: 44px;
  bottom: 0;
  left: 0;
  width: 100%;
  overflow: auto;
  /*骞虫粦婊氬姩*/
  -webkit-overflow-scrolling: touch;
  -moz-overflow-scrolling: touch;
  -ms-overflow-scrolling: touch;
  -o-overflow-scrolling: touch;
  overflow-scrolling: touch;
}
.scroller {
  position: relative;
  width: 100%;
}
/*header,footer*/
header,
footer {
  position: absolute;
  width: 100%;
  z-index: 1;
}
header {
  top: 0;
}
footer {
  bottom: 0;
}
/*----------------mbox.less(end)--------------*/
@font-face {
  font-family: 'iconfont';
  src: url('fonts/iconfont.eot?m6ldtb');
  src: url('fonts/iconfont.eot?m6ldtb#iefix') format('embedded-opentype'), url('fonts/iconfont.ttf?m6ldtb') format('truetype'), url('fonts/iconfont.woff?m6ldtb') format('woff'), url('fonts/iconfont.svg?m6ldtb#iconfont') format('svg');
  font-weight: normal;
  font-style: normal;
}
[class^="icon-"],
[class*=" icon-"] {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: 'iconfont' !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.icon-android:before {
  content: "\e900";
}
.icon-app:before {
  content: "\e901";
}
.icon-appbag:before {
  content: "\e902";
}
.icon-appbag-fill:before {
  content: "\e903";
}
.icon-app-fill:before {
  content: "\e904";
}
.icon-apple:before {
  content: "\e905";
}
.icon-appscatter:before {
  content: "\e906";
}
.icon-appscatter-fill:before {
  content: "\e907";
}
.icon-appshop:before {
  content: "\e908";
}
.icon-appshop-fill:before {
  content: "\e909";
}
.icon-arrowbittoleft:before {
  content: "\e90a";
}
.icon-arrowbittoleft-fill:before {
  content: "\e90b";
}
.icon-arrowbittoright:before {
  content: "\e90c";
}
.icon-arrowbittoright-fill:before {
  content: "\e90d";
}
.icon-arrowdown:before {
  content: "\e90e";
}
.icon-arrowdown-fill:before {
  content: "\e90f";
}
.icon-arrowleft:before {
  content: "\e910";
}
.icon-arrowleft-fill:before {
  content: "\e911";
}
.icon-arrowrefresh2:before {
  content: "\e912";
}
.icon-arrowrefresh2-fill:before {
  content: "\e913";
}
.icon-arrowreply:before {
  content: "\e914";
}
.icon-arrowreply-fill:before {
  content: "\e915";
}
.icon-arrowright:before {
  content: "\e916";
}
.icon-arrowright-fill:before {
  content: "\e917";
}
.icon-arrowsent:before {
  content: "\e918";
}
.icon-arrowsent-fill:before {
  content: "\e919";
}
.icon-arrowup:before {
  content: "\e91a";
}
.icon-arrowup-fill:before {
  content: "\e91b";
}
.icon-attach:before {
  content: "\e91c";
}
.icon-attach-fill:before {
  content: "\e91d";
}
.icon-attachv:before {
  content: "\e91e";
}
.icon-attachv-fill:before {
  content: "\e91f";
}
.icon-bad:before {
  content: "\ea84";
}
.icon-bad-fill:before {
  content: "\e921";
}
.icon-baidu:before {
  content: "\e922";
}
.icon-bell:before {
  content: "\e923";
}
.icon-bell-fill:before {
  content: "\e924";
}
.icon-build:before {
  content: "\e925";
}
.icon-build-fill:before {
  content: "\e926";
}
.icon-calendar:before {
  content: "\e927";
}
.icon-calendar-fill:before {
  content: "\e928";
}
.icon-camera:before {
  content: "\e929";
}
.icon-camera-fill:before {
  content: "\e92a";
}
.icon-car:before {
  content: "\e92b";
}
.icon-car-fill:before {
  content: "\e92c";
}
.icon-cbo:before {
  content: "\e92d";
}
.icon-cbo-fill:before {
  content: "\e92e";
}
.icon-cbook:before {
  content: "\e92f";
}
.icon-cbook-fill:before {
  content: "\e930";
}
.icon-chartbar:before {
  content: "\e931";
}
.icon-chartbar-fill:before {
  content: "\e932";
}
.icon-chartline:before {
  content: "\e933";
}
.icon-chartline-fill:before {
  content: "\e934";
}
.icon-chartpie:before {
  content: "\e935";
}
.icon-chartpie-fill:before {
  content: "\e936";
}
.icon-chat:before {
  content: "\e937";
}
.icon-chatdot:before {
  content: "\e938";
}
.icon-chatdot-fill:before {
  content: "\e939";
}
.icon-chat-fill:before {
  content: "\e93a";
}
.icon-chatline:before {
  content: "\e93b";
}
.icon-chatline-fill:before {
  content: "\e93c";
}
.icon-chats:before {
  content: "\e93d";
}
.icon-chats-fill:before {
  content: "\e93e";
}
.icon-chatsquare:before {
  content: "\e93f";
}
.icon-chatsquare-fill:before {
  content: "\e940";
}
.icon-chattip:before {
  content: "\e941";
}
.icon-chattip-fill:before {
  content: "\e942";
}
.icon-clear:before {
  content: "\e943";
}
.icon-clear-fill:before {
  content: "\e944";
}
.icon-close:before {
  content: "\e945";
}
.icon-close-fill:before {
  content: "\e946";
}
.icon-computer:before {
  content: "\e947";
}
.icon-computer-fill:before {
  content: "\e948";
}
.icon-contact:before {
  content: "\e949";
}
.icon-contact-fill:before {
  content: "\e94a";
}
.icon-dog:before {
  content: "\e94b";
}
.icon-dog-fill:before {
  content: "\e94c";
}
.icon-download:before {
  content: "\e94d";
}
.icon-download2:before {
  content: "\e94e";
}
.icon-download2-fill:before {
  content: "\e94f";
}
.icon-download-fill:before {
  content: "\e950";
}
.icon-earth:before {
  content: "\e951";
}
.icon-earth-fill:before {
  content: "\e952";
}
.icon-eye:before {
  content: "\e953";
}
.icon-eye-fill:before {
  content: "\e954";
}
.icon-face:before {
  content: "\e955";
}
.icon-face-fill:before {
  content: "\e956";
}
.icon-fav:before {
  content: "\e957";
}
.icon-fav-fill:before {
  content: "\e958";
}
.icon-femalesign:before {
  content: "\e959";
}
.icon-femalesign-fill:before {
  content: "\e95a";
}
.icon-file:before {
  content: "\e95b";
}
.icon-fileadd:before {
  content: "\e95c";
}
.icon-fileadd-fill:before {
  content: "\e95d";
}
.icon-filefav:before {
  content: "\e95e";
}
.icon-filefav-fill:before {
  content: "\e95f";
}
.icon-file-fill:before {
  content: "\e960";
}
.icon-fileperson:before {
  content: "\e961";
}
.icon-fileperson-fill:before {
  content: "\e962";
}
.icon-filesearch:before {
  content: "\e963";
}
.icon-filesearch-fill:before {
  content: "\e964";
}
.icon-flag:before {
  content: "\e965";
}
.icon-flag-fill:before {
  content: "\e966";
}
.icon-folder:before {
  content: "\e967";
}
.icon-folder-fill:before {
  content: "\e968";
}
.icon-fweixin:before {
  content: "\e969";
}
.icon-gear:before {
  content: "\e96a";
}
.icon-gear-fill:before {
  content: "\e96b";
}
.icon-guide:before {
  content: "\e96c";
}
.icon-guide-fill:before {
  content: "\e96d";
}
.icon-handbag:before {
  content: "\e96e";
}
.icon-handbag-fill:before {
  content: "\e96f";
}
.icon-heart:before {
  content: "\e970";
}
.icon-heart-fill:before {
  content: "\e971";
}
.icon-home:before {
  content: "\e972";
}
.icon-home-fill:before {
  content: "\e973";
}
.icon-hook:before {
  content: "\e974";
}
.icon-hook-fill:before {
  content: "\e975";
}
.icon-layer:before {
  content: "\e976";
}
.icon-layer-fill:before {
  content: "\e977";
}
.icon-load:before {
  content: "\e978";
}
.icon-load-fill:before {
  content: "\e979";
}
.icon-lock:before {
  content: "\e97a";
}
.icon-lock2:before {
  content: "\e97b";
}
.icon-lock2-fill:before {
  content: "\e97c";
}
.icon-lock-fill:before {
  content: "\e97d";
}
.icon-lockopen:before {
  content: "\e97e";
}
.icon-lockopen2:before {
  content: "\e97f";
}
.icon-lockopen2-fill:before {
  content: "\e980";
}
.icon-lockopen-fill:before {
  content: "\e981";
}
.icon-lorry:before {
  content: "\e982";
}
.icon-lorry-fill:before {
  content: "\e983";
}
.icon-mail:before {
  content: "\e984";
}
.icon-mail-fill:before {
  content: "\e985";
}
.icon-malesign:before {
  content: "\e986";
}
.icon-malesign-fill:before {
  content: "\e987";
}
.icon-medal:before {
  content: "\e988";
}
.icon-medal-fill:before {
  content: "\e989";
}
.icon-menu:before {
  content: "\e98a";
}
.icon-menudot:before {
  content: "\e98b";
}
.icon-menudot-fill:before {
  content: "\e98c";
}
.icon-menudown:before {
  content: "\e98d";
}
.icon-menudown-fill:before {
  content: "\e98e";
}
.icon-menu-fill:before {
  content: "\e98f";
}
.icon-menuup:before {
  content: "\e990";
}
.icon-menuup-fill:before {
  content: "\e991";
}
.icon-moreh:before {
  content: "\e992";
}
.icon-moreh-fill:before {
  content: "\e993";
}
.icon-morev:before {
  content: "\e994";
}
.icon-morev-fill:before {
  content: "\e995";
}
.icon-notepad:before {
  content: "\e996";
}
.icon-notepad-fill:before {
  content: "\e997";
}
.icon-pad:before {
  content: "\e998";
}
.icon-pad-fill:before {
  content: "\e999";
}
.icon-paperplane:before {
  content: "\e99a";
}
.icon-paperplane-fill:before {
  content: "\e99b";
}
.icon-pattern:before {
  content: "\e99c";
}
.icon-pattern-fill:before {
  content: "\e99d";
}
.icon-person:before {
  content: "\e99e";
}
.icon-person-fill:before {
  content: "\e99f";
}
.icon-persons:before {
  content: "\e9a0";
}
.icon-persons-fill:before {
  content: "\e9a1";
}
.icon-phone:before {
  content: "\e9a2";
}
.icon-phone-fill:before {
  content: "\e9a3";
}
.icon-phonemotion:before {
  content: "\e9a4";
}
.icon-phonemotion-fill:before {
  content: "\e9a5";
}
.icon-phoneorientation:before {
  content: "\e9a6";
}
.icon-phoneorientation-fill:before {
  content: "\e9a7";
}
.icon-phonetransfer:before {
  content: "\e9a8";
}
.icon-phonetransfer-fill:before {
  content: "\e9a9";
}
.icon-pic:before {
  content: "\e9aa";
}
.icon-pic-fill:before {
  content: "\e9ab";
}
.icon-position:before {
  content: "\e9ac";
}
.icon-position-fill:before {
  content: "\e9ad";
}
.icon-qq:before {
  content: "\e9ae";
}
.icon-qq-line:before {
  content: "\e9af";
}
.icon-qqzone:before {
  content: "\e9b0";
}
.icon-qrcode:before {
  content: "\e9b1";
}
.icon-qrcode-fill:before {
  content: "\e9b2";
}
.icon-qrcodeline:before {
  content: "\e9b3";
}
.icon-qrcodeline-fill:before {
  content: "\e9b4";
}
.icon-rdo:before {
  content: "\e9b5";
}
.icon-rdoadd:before {
  content: "\e9b6";
}
.icon-rdoadd-fill:before {
  content: "\e9b7";
}
.icon-rdocancel:before {
  content: "\e9b8";
}
.icon-rdocancel-fill:before {
  content: "\e9b9";
}
.icon-rdochecked:before {
  content: "\e9ba";
}
.icon-rdochecked-fill:before {
  content: "\e9bb";
}
.icon-rdoclose:before {
  content: "\e9bc";
}
.icon-rdoclose-fill:before {
  content: "\e9bd";
}
.icon-rdocompass:before {
  content: "\e9be";
}
.icon-rdocompass-fill:before {
  content: "\e9bf";
}
.icon-rdodisk:before {
  content: "\e9c0";
}
.icon-rdodisk-fill:before {
  content: "\e9c1";
}
.icon-rdodollar:before {
  content: "\e9c2";
}
.icon-rdodollar-fill:before {
  content: "\e9c3";
}
.icon-rdodown:before {
  content: "\e9c4";
}
.icon-rdodown-fill:before {
  content: "\e9c5";
}
.icon-rdoeuro:before {
  content: "\e9c6";
}
.icon-rdoeuro-fill:before {
  content: "\e9c7";
}
.icon-rdofemale:before {
  content: "\e9c8";
}
.icon-rdofemale-fill:before {
  content: "\e9c9";
}
.icon-rdo-fill:before {
  content: "\e9ca";
}
.icon-rdohistory:before {
  content: "\e9cb";
}
.icon-rdohistory-fill:before {
  content: "\e9cc";
}
.icon-rdohook:before {
  content: "\e9cd";
}
.icon-rdohook-fill:before {
  content: "\e9ce";
}
.icon-rdoinfo:before {
  content: "\e9cf";
}
.icon-rdoinfo-fill:before {
  content: "\e9d0";
}
.icon-rdomale:before {
  content: "\e9d1";
}
.icon-rdomale-fill:before {
  content: "\e9d2";
}
.icon-rdomark:before {
  content: "\e9d3";
}
.icon-rdomark-fill:before {
  content: "\e9d4";
}
.icon-rdomenu:before {
  content: "\e9d5";
}
.icon-rdomenudown:before {
  content: "\e9d6";
}
.icon-rdomenudown-fill:before {
  content: "\e9d7";
}
.icon-rdomenu-fill:before {
  content: "\e9d8";
}
.icon-rdominus:before {
  content: "\e9d9";
}
.icon-rdominus-fill:before {
  content: "\e9da";
}
.icon-rdomore:before {
  content: "\e9db";
}
.icon-rdomore-fill:before {
  content: "\e9dc";
}
.icon-rdook:before {
  content: "\e9dd";
}
.icon-rdook-fill:before {
  content: "\e9de";
}
.icon-rdopause:before {
  content: "\e9df";
}
.icon-rdopause-fill:before {
  content: "\e9e0";
}
.icon-rdoperson:before {
  content: "\e9e1";
}
.icon-rdoperson-fill:before {
  content: "\e9e2";
}
.icon-rdopersons:before {
  content: "\e9e3";
}
.icon-rdopersons-fill:before {
  content: "\e9e4";
}
.icon-rdoplay:before {
  content: "\e9e5";
}
.icon-rdoplay-fill:before {
  content: "\e9e6";
}
.icon-rdoquestion:before {
  content: "\e9e7";
}
.icon-rdoquestion-fill:before {
  content: "\e9e8";
}
.icon-rdorem:before {
  content: "\e9e9";
}
.icon-rdorem-fill:before {
  content: "\e9ea";
}
.icon-rdoright:before {
  content: "\e9eb";
}
.icon-rdoright-fill:before {
  content: "\e9ec";
}
.icon-rdospanner:before {
  content: "\e9ed";
}
.icon-rdospanner-fill:before {
  content: "\e9ee";
}
.icon-rdostop:before {
  content: "\e9ef";
}
.icon-rdostop-fill:before {
  content: "\e9f0";
}
.icon-rdotobottom:before {
  content: "\e9f1";
}
.icon-rdotobottom-fill:before {
  content: "\e9f2";
}
.icon-rdototop:before {
  content: "\e9f3";
}
.icon-rdototop-fill:before {
  content: "\e9f4";
}
.icon-rdoup:before {
  content: "\e9f5";
}
.icon-rdoup-fill:before {
  content: "\e9f6";
}
.icon-rdouser:before {
  content: "\e9f7";
}
.icon-rdouser-fill:before {
  content: "\e9f8";
}
.icon-rdowarn:before {
  content: "\e9f9";
}
.icon-rdowarn-fill:before {
  content: "\e9fa";
}
.icon-record:before {
  content: "\e9fb";
}
.icon-record-fill:before {
  content: "\e9fc";
}
.icon-refresh:before {
  content: "\e9fd";
}
.icon-refresh-fill:before {
  content: "\e9fe";
}
.icon-search:before {
  content: "\e9ff";
}
.icon-search2:before {
  content: "\ea00";
}
.icon-search2-fill:before {
  content: "\ea01";
}
.icon-search-fill:before {
  content: "\ea02";
}
.icon-share:before {
  content: "\ea03";
}
.icon-share-fill:before {
  content: "\ea04";
}
.icon-shop:before {
  content: "\ea05";
}
.icon-shopbag:before {
  content: "\ea06";
}
.icon-shopbag-fill:before {
  content: "\ea07";
}
.icon-shopcart:before {
  content: "\ea08";
}
.icon-shopcart-fill:before {
  content: "\ea09";
}
.icon-shop-fill:before {
  content: "\ea0a";
}
.icon-sound:before {
  content: "\ea0b";
}
.icon-sound-fill:before {
  content: "\ea0c";
}
.icon-soundmax:before {
  content: "\ea0d";
}
.icon-soundmax-fill:before {
  content: "\ea0e";
}
.icon-soundmute:before {
  content: "\ea0f";
}
.icon-soundmute-fill:before {
  content: "\ea10";
}
.icon-spanner:before {
  content: "\ea11";
}
.icon-spanner-fill:before {
  content: "\ea12";
}
.icon-tel:before {
  content: "\ea13";
}
.icon-tel-fill:before {
  content: "\ea14";
}
.icon-map:before {
  content: "\ea15";
}
.icon-map-fill:before {
  content: "\ea16";
}
.icon-thumb:before {
  content: "\ea17";
}
.icon-thumb-fill:before {
  content: "\ea18";
}
.icon-time:before {
  content: "\ea19";
}
.icon-time-fill:before {
  content: "\ea1a";
}
.icon-tqq:before {
  content: "\ea1b";
}
.icon-trash:before {
  content: "\ea1c";
}
.icon-trash-fill:before {
  content: "\ea1d";
}
.icon-tsina:before {
  content: "\ea1e";
}
.icon-typeaudio:before {
  content: "\ea1f";
}
.icon-typeaudio-fill:before {
  content: "\ea20";
}
.icon-typeexcel:before {
  content: "\ea21";
}
.icon-typeexcel-fill:before {
  content: "\ea22";
}
.icon-typepack:before {
  content: "\ea23";
}
.icon-typepack-fill:before {
  content: "\ea24";
}
.icon-typepdf:before {
  content: "\ea25";
}
.icon-typepdf-fill:before {
  content: "\ea26";
}
.icon-typepic:before {
  content: "\ea27";
}
.icon-typepic-fill:before {
  content: "\ea28";
}
.icon-typeppt:before {
  content: "\ea29";
}
.icon-typeppt-fill:before {
  content: "\ea2a";
}
.icon-typetext:before {
  content: "\ea2b";
}
.icon-typetext-fill:before {
  content: "\ea2c";
}
.icon-typevideo:before {
  content: "\ea2d";
}
.icon-typevideo-fill:before {
  content: "\ea2e";
}
.icon-typeword:before {
  content: "\ea2f";
}
.icon-typeword-fill:before {
  content: "\ea30";
}
.icon-unrecord:before {
  content: "\ea31";
}
.icon-unrecord-fill:before {
  content: "\ea32";
}
.icon-upload:before {
  content: "\ea33";
}
.icon-upload2:before {
  content: "\ea34";
}
.icon-upload2-fill:before {
  content: "\ea35";
}
.icon-upload-fill:before {
  content: "\ea36";
}
.icon-user:before {
  content: "\ea37";
}
.icon-user-fill:before {
  content: "\ea38";
}
.icon-usermenu:before {
  content: "\ea39";
}
.icon-usermenu-fill:before {
  content: "\ea3a";
}
.icon-video:before {
  content: "\ea3b";
}
.icon-video-fill:before {
  content: "\ea3c";
}
.icon-wallet:before {
  content: "\ea3d";
}
.icon-wallet-fill:before {
  content: "\ea3e";
}
.icon-weabaoxue:before {
  content: "\ea3f";
}
.icon-weabaoxue-fill:before {
  content: "\ea40";
}
.icon-weabaoyu:before {
  content: "\ea41";
}
.icon-weabaoyu-fill:before {
  content: "\ea42";
}
.icon-weadabaoyu:before {
  content: "\ea43";
}
.icon-weadabaoyu-fill:before {
  content: "\ea44";
}
.icon-weadaxue:before {
  content: "\ea45";
}
.icon-weadaxue-fill:before {
  content: "\ea46";
}
.icon-weadayu:before {
  content: "\ea47";
}
.icon-weadayu-fill:before {
  content: "\ea48";
}
.icon-weadongyu:before {
  content: "\ea49";
}
.icon-weadongyu-fill:before {
  content: "\ea4a";
}
.icon-weaduoyun:before {
  content: "\ea4b";
}
.icon-weaduoyun-fill:before {
  content: "\ea4c";
}
.icon-weafuchen:before {
  content: "\ea4d";
}
.icon-weafuchen-fill:before {
  content: "\ea4e";
}
.icon-wealeizhenyu:before {
  content: "\ea4f";
}
.icon-wealeizhenyubanyoubingbao:before {
  content: "\ea50";
}
.icon-wealeizhenyubanyoubingbao-fill:before {
  content: "\ea51";
}
.icon-wealeizhenyu-fill:before {
  content: "\ea52";
}
.icon-weamai:before {
  content: "\ea53";
}
.icon-weamai-fill:before {
  content: "\ea54";
}
.icon-weaqiangshachenbao:before {
  content: "\ea55";
}
.icon-weaqiangshachenbao-fill:before {
  content: "\ea56";
}
.icon-weaqing:before {
  content: "\ea57";
}
.icon-weaqing-fill:before {
  content: "\ea58";
}
.icon-weashachenbao:before {
  content: "\ea59";
}
.icon-weashachenbao-fill:before {
  content: "\ea5a";
}
.icon-weatedabaoyu:before {
  content: "\ea5b";
}
.icon-weatedabaoyu-fill:before {
  content: "\ea5c";
}
.icon-weawu:before {
  content: "\ea5d";
}
.icon-weawu-fill:before {
  content: "\ea5e";
}
.icon-weaxiaoxue:before {
  content: "\ea5f";
}
.icon-weaxiaoxue-fill:before {
  content: "\ea60";
}
.icon-weaxiaoyu:before {
  content: "\ea61";
}
.icon-weaxiaoyu-fill:before {
  content: "\ea62";
}
.icon-weayangsha:before {
  content: "\ea63";
}
.icon-weayangsha-fill:before {
  content: "\ea64";
}
.icon-weayin:before {
  content: "\ea65";
}
.icon-weayin-fill:before {
  content: "\ea66";
}
.icon-weayujiabing:before {
  content: "\ea67";
}
.icon-weayujiabing-fill:before {
  content: "\ea68";
}
.icon-weayujiaxue:before {
  content: "\ea69";
}
.icon-weayujiaxue-fill:before {
  content: "\ea6a";
}
.icon-weazhenxue:before {
  content: "\ea6b";
}
.icon-weazhenxue-fill:before {
  content: "\ea6c";
}
.icon-weazhenyu:before {
  content: "\ea6d";
}
.icon-weazhenyu-fill:before {
  content: "\ea6e";
}
.icon-weazhongxue:before {
  content: "\ea6f";
}
.icon-weazhongxue-fill:before {
  content: "\ea70";
}
.icon-weazhongyu:before {
  content: "\ea71";
}
.icon-weazhongyu-fill:before {
  content: "\ea72";
}
.icon-weixin:before {
  content: "\ea73";
}
.icon-wifi:before {
  content: "\ea74";
}
.icon-wifi-fill:before {
  content: "\ea75";
}
.icon-windows:before {
  content: "\ea76";
}
.icon-write:before {
  content: "\ea77";
}
.icon-write-fill:before {
  content: "\ea78";
}
.icon-add:before {
  content: "\e920";
}
.icon-add-fill:before {
  content: "\ea79";
}
.icon-chartbarl:before {
  content: "\ea7a";
}
.icon-chartbarl-fill:before {
  content: "\ea7b";
}
.icon-chartlinel:before {
  content: "\ea7c";
}
.icon-chartlinel-fill:before {
  content: "\ea7d";
}
.icon-minus:before {
  content: "\ea7e";
}
.icon-minus-fill:before {
  content: "\ea7f";
}
.icon-smile:before {
  content: "\ea80";
}
.icon-smile-fill:before {
  content: "\ea81";
}
.icon-stethoscope:before {
  content: "\ea82";
}
.icon-stethoscope-fill:before {
  content: "\ea83";
}
.icon-news:before {
  content: "\ea85";
}
.icon-news-fill:before {
  content: "\ea86";
}
/*----------------photo.less(start)----------------*/
.photo,
.default,
.timeline-dot {
  position: relative;
  box-sizing: border-box;
  display: box;
  display: -webkit-box;
  box-pack: center;
  -webkit-box-pack: center;
  box-align: center;
  -webkit-box-align: center;
  display: flex;
  display: -webkit-flex;
  justify-content: center;
  -webkit-justify-content: center;
  align-items: center;
  -webkit-align-items: center;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  margin: 0 auto;
}
.photo {
  width: 50px;
  height: 50px;
  border-radius: 100%;
}
/*杈规*/
.photo.border {
  border-width: 1px;
  border-style: solid;
  border-color: inherit;
}
/*----------------photo.less(end)----------------*/
/*---------------list.less(start)---------------*/
.list li,
.timeline li {
  position: relative;
  display: flex;
  display: -webkit-flex;
  display: box;
  display: -webkit-box;
  box-sizing: border-box;
  border-style: solid;
  border-width: 0;
}
.list li,
.timeline li {
  border-color: inherit;
}
.list li {
  border-width: 0 0 1px 0;
}
ul.dotted li,
ul li.dotted {
  border-style: dotted;
}
.list button {
  width: 60px;
  height: 32px;
  line-height: 32px;
}
.justify {
  position: relative;
  min-width: 0px;
  max-width: 90px;
  display: block;
}
.justify,
.justify-content {
  padding: 10px 8px;
}
.justify + .justify-content {
  padding-left: 0;
}
.justify-content + .justify {
  padding-left: 0;
}
.justify img {
  max-width: 100%;
}
.justify-content {
  overflow: hidden;
  position: relative;
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
}
.justify-content > p,
.justify-content > a {
  line-height: 1.5em;
}
.justify-content small {
  display: block;
  line-height: 1.5em;
}
/*鏃犺嚜閫傚簲*/
.list li.nojustify {
  display: block;
}
.list li.nojustify .justify {
  display: block;
  max-width: 100%;
  padding-left: 8px;
  padding-right: 8px;
}
.list li.nojustify .justify-content ~ .justify {
  padding-top: 0;
}
/*鍒楄〃鏍囪*/
.list [class^=mark-] {
  margin-right: 4px;
}
/*涓婁笅涓ょ瀵归綈*/
.list.between .justify-content small:nth-last-of-type(1),
.list li.between .justify-content small:nth-last-of-type(1) {
  margin-top: 8px;
}
/*浣嶇疆*/
.list .top,
.list .bottom,
.list .left,
.list .right {
  position: absolute;
}
.list .top {
  top: 12px;
}
.list .bottom {
  bottom: 8px;
}
.list .left {
  left: 4px;
}
.list .right {
  right: 4px;
}
/*鍐呭绾�*/
.list.noborder li,
.list li.noborder {
  border-width: 0;
}
.list.border-content li {
  border-width: 0;
}
.list.border-content .justify-content,
.list.border-content .justify-content + .justify {
  border-style: inherit;
  border-color: inherit;
  border-width: 0 0 1px 0;
}
/*---------------list.less(end)---------------*/
/*---------------timeline.less(start)---------------*/
/*requie photo.less & list.less*/
.timeline {
  margin-left: 24px;
  padding: 0 18px;
  border-style: solid;
  border-width: 0 0 0 1px;
}
.timeline li {
  position: relative;
}
.timeline.border li,
.timeline.dotted li,
.timeline li.border,
.timeline li.dotted {
  border-width: 0 0 1px 0;
}
.timeline .clock,
.timeline-dot {
  position: absolute;
  width: 24px;
  height: 24px;
  top: 12px;
  left: -32px;
}
.timeline .clock {
  background-color: #fff;
}
/*---------------timeline.less(end)---------------*/
/*----------------row.less(start)--------------*/
/*require inputbox.less*/
.row {
  border-width: 0 0 1px 0;
  border-style: solid;
}
.row-left {
  display: block;
  width: 30%;
  padding: 0 0 0 8px;
  color: #666;
}
.row-right {
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
}
/*----------------row.less(end)--------------*/
/*----------------group.less(end)--------------*/
.group {
  margin: 20px 0;
  border-width: 1px 0;
  border-style: solid;
  background-color: white;
}
.group:after {
  display: block;
  clear: both;
  content: "";
}
.group .input-box {
  border-width: 0;
  margin: 0;
}
.group .row:last-of-type {
  border-width: 0;
}
/*----------------group.less(end)--------------*/
/*----------------card.less(start)--------------*/
.card,
.card-preview {
  display: block;
  position: relative;
}
.card {
  margin: 8px;
  box-sizing: border-box;
  border-width: 1px;
  border-style: solid;
  background-color: #fff;
}
.row label,
.input-box label,
.card label {
  line-height: 30px;
}
/*棰勮鍥�*/
.card-preview {
  height: 145px;
  background-size: cover;
  background-position: center;
}
/*鍏抽棴鎸夐挳*/
.card .close,
.card-preview .close {
  position: absolute;
  top: -4px;
  right: -4px;
}
/*鎸夐挳鎿嶄綔鍖�*/
.card-handler {
  width: 100%;
}
.card-handler:after {
  display: table;
  content: '';
  clear: both;
  zoom: 1;
}
.card-handler > a {
  width: 33%;
  text-align: center;
  height: 32px;
  line-height: 32px;
  float: left;
  box-sizing: border-box;
  border-style: solid;
  border-width: 0;
}
.card-handler.border > a:not(:last-child) {
  border-width: 0 1px 0 0;
}
.card-handler[data-col="2"] > a {
  width: 50%;
}
.card-handler[data-col="3"] > a {
  width: 34%;
}
.card-handler[data-col="3"] > a:nth-child(2) {
  width: 32%;
}
.card-handler[data-col="4"] > a {
  width: 25%;
}
/*淇℃伅鎸夐挳鍖�*/
.card-info {
  height: 40px;
  line-height: 40px;
}
.card-info > label:not(:first-child):not(:last-child),
.card-info > a:not(:first-child):not(:last-child) {
  margin-left: 18px;
}
.card-info .right {
  float: right;
}
/*----------------card.less(end)--------------*/
/*----------------aside.less(start)--------------*/
/*渚ц竟鏍�*/
aside {
  position: absolute;
  width: 264px;
  top: 0;
  bottom: 0;
  z-index: 4;
}
/*鍙充晶杈规爮*/
aside[data-position="right"] {
  right: -264px;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -ms-transition: all 0.5s;
  transition: all 0.5s;
}
aside[data-position="right"].active {
  right: 0;
}
/*push锛氬畾涔変晶杈规爮瀹藉害*/
aside[data-position="right"][data-transition="push"].active ~ #section_container {
  left: -264px;
}
/*overlay*/
/*reveal*/
aside[data-position="right"][data-transition="reveal"] {
  right: 0;
  z-index: 3;
  opacity: 0;
  -webkit-transition: opacity 0s linear 0.5s;
  /*灏嗛�忔槑搴﹀彉0鏃跺欢杩�500姣*/
  -moz-transition: opacity 0s linear 0.5s;
  -ms-transition: opacity 0s linear 0.5s;
  transition: opacity 0s linear 0.5s;
}
aside[data-position="right"][data-transition="reveal"] ~ #section_container {
  /*background-color:white;*/
}
aside[data-position="right"][data-transition="reveal"].active {
  opacity: 1;
  -webkit-transition: opacity 0s linear 0s;
  /*灏嗛�忔槑搴﹀彉1鏃朵笉寤惰繜*/
  -moz-transition: opacity 0s linear 0s;
  -ms-transition: opacity 0s linear 0s;
  transition: opacity 0s linear 0s;
}
aside[data-position="right"][data-transition="reveal"].active ~ #section_container {
  left: -264px;
}
/*宸︿晶杈规爮*/
aside[data-position="left"] {
  left: 0;
  left: -264px;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -ms-transition: all 0.5s;
  transition: all 0.5s;
}
aside[data-position="left"].active {
  left: 0;
}
/*push锛氬畾涔変晶杈规爮瀹藉害*/
aside[data-position="left"][data-transition="push"].active ~ #section_container {
  left: 264px;
}
/*overlay*/
/*reveal*/
aside[data-position="left"][data-transition="reveal"] {
  left: 0;
  z-index: 3;
  opacity: 0;
  -webkit-transition: opacity 0s linear 0.5s;
  /*灏嗛�忔槑搴﹀彉0鏃跺欢杩�500姣*/
  -moz-transition: opacity 0s linear 0.5s;
  -ms-transition: opacity 0s linear 0.5s;
  transition: opacity 0s linear 0.5s;
}
aside[data-position="left"][data-transition="reveal"] ~ #section_container {
  /*background-color:white;*/
}
aside[data-position="left"][data-transition="reveal"].active {
  opacity: 1;
  -webkit-transition: opacity 0s linear 0s;
  /*灏嗛�忔槑搴﹀彉1鏃朵笉寤惰繜*/
  -moz-transition: opacity 0s linear 0s;
  -ms-transition: opacity 0s linear 0s;
  transition: opacity 0s linear 0s;
}
aside[data-position="left"][data-transition="reveal"].active ~ #section_container {
  left: 264px;
}
/*鏄剧ず涓讳綋閬僵*/
aside.active ~ #section_container .section_container_mask {
  display: block;
}
/*----------------aside.less(end)--------------*/
/*----------------------------title.less(start)----------------------------*/
.sliver,
.title {
  position: relative;
}
.sliver {
  padding: 8px;
  border-width: 0 0 1px 0;
  border-style: solid;
}
.title {
  font-size: 17px;
  padding: 8px 0;
  display: block;
}
.title.border {
  border-width: 0 0 1px 0;
  border-style: solid;
}
.title + small,
.title + p,
.title + a {
  display: block;
  margin: 0 0 8px 0;
}
/*----------------------------title.less(start)----------------------------*/
/*----------------------------bar.less(start)----------------------------*/
.statusbar .mark-grayscale {
  padding: 8px;
  margin: 5px 0 5px 8px;
  background: #fff;
  display: inline-block;
}
.statusbar .mark-grayscale:last-child {
  margin-right: 8px;
}
.statusbar .mark-grayscale [class*="icon-"] {
  color: #aaa;
  margin-left: 5px;
}
/*----------------------------bar.less(end)----------------------------*/
/*----------------titlebar.less(start)--------------*/
/*require inputbox.less*/
.titlebar {
  min-height: 44px;
  border-bottom: 1px solid;
  box-sizing: border-box;
}
.titlebar,
.titlebar a,
.titlebar h1 {
  position: relative;
}
.titlebar h1 {
  font-size: 17px;
  font-weight: normal;
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
}
.titlebar h1:first-child {
  margin-left: 8px;
}
.titlebar h1:only-child {
  margin-right: 8px;
}
.titlebar a,
.titlebar button {
  margin: 0 8px;
}
.titlebar a + a,
.titlebar a + button,
.titlebar button + button {
  margin-left: 0px;
}
/*宸﹀彸瀵归綈*/
.titlebar .left,
.titlebar .right {
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  z-index: 1;
}
.titlebar .left {
  left: 0;
}
.titlebar .right {
  right: 0;
}
/*searchbar*/
.titlebar > .searchbar {
  width: 100%;
}
/*----------------titlebar.less(end)----------------*/
/*----------------tabbar.less(start)--------------*/
.rectbar,
.slidebar,
.arrowbar,
.menubar,
.tabbar {
  position: relative;
  display: table;
  margin: 0 auto;
}
.tab {
  position: relative;
  display: table-cell;
  width: 1%;
  text-align: center;
  box-sizing: border-box;
}
.tab-label {
  display: inline-block;
  font-size: 13px;
  height: 13px;
  line-height: 13px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  pointer-events: none;
}
.tab:active .icon,
.tab.active .icon {
  background-position: center bottom;
}
/*rectbar | slidebar | tabbar*/
.rectbar .tab,
.slidebar .tab,
.tabbar .tab {
  border-color: inherit;
  border-style: solid;
  background-color: white;
}
.rectbar .tab-label,
.slidebar .tab-label,
.tabbar .tab-label {
  height: 24px;
  line-height: 24px;
  vertical-align: middle;
}
/*arrowbar鍜宮enubar*/
.arrowbar .tab-label,
.menubar .tab-label {
  display: block;
  height: 24px;
  line-height: 24px;
}
.arrowbar .tab .icon,
.menubar .tab .icon {
  margin-top: 5px;
}
/*rectbar*/
.rectbar {
  max-width: 96%;
}
.rectbar .tab {
  height: 34px;
  line-height: 30px;
  border-width: 1px 1px 1px 0;
}
.rectbar .tab:first-child {
  border-top-left-radius: 16px;
  border-bottom-left-radius: 16px;
  border-left-width: 1px;
}
.rectbar .tab:last-child {
  border-top-right-radius: 16px;
  border-bottom-right-radius: 16px;
}
/*slidebar*/
.slidebar .tab,
.tabbar .tab {
  height: 40px;
  line-height: 40px;
  border-width: 0px 0px 1px 0;
}
.slidebar .tab:active,
.slidebar .tab.active {
  border-width: 0px 0px 2px 0;
}
/*arrowbar*/
.arrowbar .tab-label:only-child {
  height: 40px;
  line-height: 40px;
}
.arrowbar .tab.active:after {
  content: '';
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 0;
  border-width: 5px;
  border-style: solid;
  border-color: transparent;
}
/*menubar*/
.menubar .tab {
  border-width: 1px 0 0 0;
  border-style: solid;
  border-color: inherit;
}
/*animated tabbar*/
.tabbar.animate-slide {
  overflow: hidden;
  display: block;
  line-height: 0;
  font-size: 0;
}
.tabbar.animate-slide .tab {
  display: inline-block;
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}
.tabbar.animate-slide hr {
  position: absolute;
  top: 38px;
  left: 0;
  width: 25%;
  border-width: 2px 0 0 0;
  border-style: solid;
  pointer-events: none;
  -webkit-transition: -webkit-transform 0.3s;
  transition: transform 0.3s;
  -webkit-transition-timing-function: cubic-bezier(1, 0.01, 0, 1);
  -webkit-transition-timing-function: cubic-bezier(1, 0.01, 0, 1.22);
  transition-timing-function: cubic-bezier(1, 0.01, 0, 1.22);
}
.tabbar.animate-slide .tab:nth-child(1).active ~ hr {
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.tabbar.animate-slide .tab:nth-child(2).active ~ hr {
  -webkit-transform: translate3d(100%, 0, 0);
  transform: translate3d(100%, 0, 0);
}
.tabbar.animate-slide .tab:nth-child(3).active ~ hr {
  -webkit-transform: translate3d(200%, 0, 0);
  transform: translate3d(200%, 0, 0);
}
.tabbar.animate-slide .tab:nth-child(4).active ~ hr {
  -webkit-transform: translate3d(300%, 0, 0);
  transform: translate3d(300%, 0, 0);
}
.tabbar.animate-slide .tab:nth-child(5).active ~ hr {
  -webkit-transform: translate3d(400%, 0, 0);
  transform: translate3d(400%, 0, 0);
}
.tabbar.animate-slide .tab:nth-child(6).active ~ hr {
  -webkit-transform: translate3d(500%, 0, 0);
  transform: translate3d(500%, 0, 0);
}
.tabbar.animate-twoline .tab {
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}
.tabbar.animate-twoline .tab::before,
.tabbar.animate-twoline .tab::after {
  content: '';
  position: absolute;
  left: 0;
  width: 100%;
  height: 2px;
  -webkit-transform: scale3d(0, 1, 1);
  transform: scale3d(0, 1, 1);
  -webkit-transition: -webkit-transform 0.2s;
  transition: transform 0.2s;
}
.tabbar.animate-twoline .tab::before {
  top: 0;
  -webkit-transform-origin: 0 50%;
  transform-origin: 0 50%;
}
.tabbar.animate-twoline .tab::after {
  bottom: 0;
  -webkit-transform-origin: 100% 50%;
  transform-origin: 100% 50%;
}
.tabbar.animate-twoline .tab.active::before,
.tabbar.animate-twoline .tab.active::after {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  -webkit-transition-timing-function: cubic-bezier(0.22, 0.61, 0.36, 1);
  transition-timing-function: cubic-bezier(0.22, 0.61, 0.36, 1);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
}
.tabbar.animate-oneline .tab {
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}
.tabbar.animate-oneline .tab::before {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  -webkit-transform: scale3d(0, 1, 1);
  transform: scale3d(0, 1, 1);
  -webkit-transition: -webkit-transform 0.1s;
  transition: transform 0.1s;
}
.tabbar.animate-oneline .tab.active::before {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
}
.tabbar.animate-box .tab {
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}
.tabbar.animate-box .tab::before,
.tabbar.animate-box .tab::after,
.tabbar.animate-box .tab-label::before,
.tabbar.animate-box .tab-label::after {
  content: '';
  position: absolute;
  background: #d94f5c;
  -webkit-transition: -webkit-transform 0.2s;
  transition: transform 0.2s;
}
.tabbar.animate-box .tab::before,
.tabbar.animate-box .tab::after {
  top: 0;
  width: 2px;
  height: 100%;
  -webkit-transform: scale3d(1, 0, 1);
  transform: scale3d(1, 0, 1);
}
.tabbar.animate-box .tab::before {
  left: 0;
  -webkit-transform-origin: 50% 100%;
  transform-origin: 50% 100%;
}
.tabbar.animate-box .tab::after {
  right: 0;
  -webkit-transform-origin: 50% 0%;
  transform-origin: 50% 0%;
}
.tabbar.animate-box .tab-label::before,
.tabbar.animate-box .tab-label::after {
  left: 0;
  width: 100%;
  height: 2px;
  -webkit-transform: scale3d(0, 1, 1);
  transform: scale3d(0, 1, 1);
}
.tabbar.animate-box .tab-label::before {
  top: 0;
  -webkit-transform-origin: 0 50%;
  transform-origin: 0 50%;
}
.tabbar.animate-box .tab-label::after {
  bottom: 0;
  -webkit-transform-origin: 100% 50%;
  transform-origin: 100% 50%;
}
.tabbar.animate-box .tab.active::before,
.tabbar.animate-box .tab.active::after,
.tabbar.animate-box .tab.active .tab-label::before,
.tabbar.animate-box .tab.active .tab-label::after {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
}
.tabbar.animate-bracket {
  /* right flip */
  /* bottom line */
}
.tabbar.animate-bracket .tab-label {
  width: 100%;
}
.tabbar.animate-bracket .tab::before,
.tabbar.animate-bracket .tab-label::before,
.tabbar.animate-bracket .tab-label::after {
  content: '';
  position: absolute;
  bottom: 0;
  width: 10px;
  height: 2px;
  opacity: 0;
}
.tabbar.animate-bracket .tab-label::before,
.tabbar.animate-bracket .tab-label::after {
  -webkit-transform: translate3d(0, 10px, 0);
  transform: translate3d(0, 10px, 0);
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
}
.tabbar.animate-bracket .tab.active .tab-label::before,
.tabbar.animate-bracket .tab.active .tab-label::after {
  opacity: 1;
}
.tabbar.animate-bracket .tab-label::before {
  left: 0;
  -webkit-transform-origin: 0% 0%;
  transform-origin: 0% 0%;
}
.tabbar.animate-bracket .tab.active .tab-label::before {
  -webkit-transform: rotate3d(0, 0, 1, -90deg);
  transform: rotate3d(0, 0, 1, -90deg);
}
.tabbar.animate-bracket .tab-label::after {
  right: 0;
  -webkit-transform-origin: 100% 0%;
  transform-origin: 100% 0%;
}
.tabbar.animate-bracket .tab.active .tab-label::after {
  -webkit-transform: rotate3d(0, 0, 1, 90deg);
  transform: rotate3d(0, 0, 1, 90deg);
}
.tabbar.animate-bracket .tab::before {
  left: 0;
  width: 100%;
  -webkit-transform: translate3d(0, 10px, 0);
  transform: translate3d(0, 10px, 0);
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
}
.tabbar.animate-bracket .tab.active::before {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  -webkit-transition: -webkit-transform 0.3s, opacity 0.1s;
  transition: transform 0.3s, opacity 0.1s;
}
[data-col] .tab {
  float: left;
}
[data-col="2"] .tab,
.animate-slide[data-col="2"] hr {
  width: 50%;
}
[data-col="3"] .tab,
.animate-slide[data-col="3"] hr {
  width: 33%;
}
[data-col="3"] .tab:nth-child(2),
.animate-slide[data-col="3"] .tab:nth-child(2).active ~ hr {
  width: 34%;
}
[data-col="4"] .tab,
.animate-slide[data-col="4"] hr {
  width: 25%;
}
[data-col="5"] .tab,
.animate-slide[data-col="5"] hr {
  width: 20%;
}
[data-col="6"] .tab,
.animate-slide[data-col="6"] hr {
  width: 17%;
}
[data-col="6"] .tab:nth-last-child(2),
[data-col="6"] .tab:nth-last-child(3) {
  width: 16%;
}
/* [data-col="6"] .tab:nth-child(1),[data-col="6"] .tab:nth-child(2),[data-col="6"] .tab:nth-child(3),[data-col="6"] .tab:nth-child(5),[data-col="6"] .tab:nth-child(6){
	width:17%;
	background-color: red;
} */
/*----------------tabbar.less(end)--------------*/
/*----------------------------searchbar.less(start)----------------------------*/
.searchbar {
  display: -webkit-box;
  display: box;
  display: -webkit-flex;
  display: flex;
  -webkit-box-align: center;
  box-align: center;
  -webkit-align-items: center;
  align-items: center;
}
.searchbar .input-box {
  margin-top: 5px;
  margin-bottom: 5px;
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
  -webkit-flex: 1;
  flex: 1;
}
.searchbar a {
  display: block;
  padding: 8px;
}
.searchbar .input-box + a {
  padding-left: 0;
}
/*----------------------------searchbar.less(end)----------------------------*/
/*------------------------------button.less(start)------------------------------*/
/*鎸夐挳-鏅�氭寜閽�*/
button,
input[type="button"],
input[type="submit"],
.button {
  display: inline-block;
  padding: 0 8px;
  border: 0;
  height: 40px;
  overflow: hidden;
  text-align: center;
  vertical-align: middle;
  /*绂佹閫変腑*/
  background-image: none;
  /*娓呴櫎鏂囨湰閫夋嫨涓庡妗�*/
  outline: none;
  -moz-user-select: none;
  /*鐏嫄*/
  -webkit-user-select: none;
  /*webkit娴忚鍣�*/
  -ms-user-select: none;
  /*IE10*/
  -khtml-user-select: none;
  /*鏃╂湡娴忚鍣�*/
  user-select: none;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  border-style: solid;
}
.button {
  line-height: 40px;
}
.outline {
  border-width: 1px;
}
/*鎸夐挳-澶ф寜閽�*/
button.block,
input[type="button"].block,
input[type="submit"].block,
.button.block {
  display: block;
}
button.block,
input[type="button"].block,
input[type="submit"].block {
  width: 100%;
}
/*鍦嗗舰鎸夐挳*/
.button.round,
button.round,
input[type="button"].round,
.button.rect,
button.rect,
input[type="button"].rect {
  width: auto;
  height: auto;
  line-height: 0;
  font-size: 0;
  padding: 5px;
}
.button.round,
button.round,
input[type="button"].round {
  border-radius: 100%;
}
/*澶氬僵鏍囩鎸夐挳*/
.mark-info,
.mark-success,
.mark-cancel,
.mark-warn,
.mark-disable,
.mark-primary,
.mark-grayscale {
  font-size: 0.95em;
  padding: 2px 5px;
  border-radius: 3px;
}
/*------------------------------button.less(end)------------------------------*/
/*------------------------------buttongroup.less(start)------------------------------*/
.button-group {
  position: relative;
  display: inline-block;
  vertical-align: middle;
}
.button-group > span {
  display: inline-block;
  position: relative;
  float: left;
  padding: 6px 12px;
  height: 20px;
  line-height: 20px;
  margin-bottom: 0;
  font-size: 14px;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  border: 1px solid;
  border-radius: 4px;
}
.button-group > span + span {
  margin-left: -1px;
}
.button-group > span input[type="text"] {
  height: 100%;
  line-height: 100%;
  background-color: transparent;
  padding: 0;
}
/*绗竴涓寜閽�*/
.button-group > span:first-child {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
/*涓棿鎸夐挳*/
.button-group > span:not(:first-child):not(:last-child) {
  border-radius: 0;
}
/*鏈�鍚庝竴涓寜閽�*/
.button-group > span:last-child {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: -1px;
}
/*妯悜鑷�傚簲*/
.button-group.justify {
  display: table;
  table-layout: fixed;
  border-collapse: collapse;
}
.button-group.justify span {
  display: table-cell;
  float: none;
  width: 1%;
}
/*绾靛悜鎺掑垪*/
.button-group.vertical > span {
  display: block;
  float: none;
  width: 100%;
  max-width: 100%;
}
.button-group.vertical > span + span {
  margin-top: -1px;
  margin-left: 0;
}
/*鏈�涓婇潰鐨勬寜閽�*/
.button-group.vertical > span:first-child {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
/*鏈�涓嬮潰鐨勬寜閽�*/
.button-group.vertical > span:last-child {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  border-bottom-left-radius: 4px;
}
/*鍙湁涓�涓寜閽�*/
.button-group > span:only-child {
  border-radius: 4px;
}
/*------------------------------buttongroup.less(end)------------------------------*/
/*----------------form.less(start)--------------*/
input[type="text"],
input[type="password"],
input[type="search"],
input[type="file"],
input[type="number"],
input[type="tel"],
input[type="email"],
input[type="url"],
input[type="date"],
input[type="month"],
input[type="week"],
input[type="datetime-local"],
input[type="datetime"],
input[type="time"],
keygen,
input[list],
textarea,
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-left: 8px;
  padding-right: 8px;
  display: inline-block;
  border-width: 1px;
  border-style: solid;
  text-align: left;
}
input[type="text"],
input[type="password"],
input[type="search"],
input[type="file"],
input[type="number"],
input[type="tel"],
input[type="email"],
input[type="url"],
input[type="date"],
input[type="month"],
input[type="week"],
input[type="datetime-local"],
input[type="datetime"],
input[type="time"],
keygen,
input[list] {
  height: 20px;
  line-height: 20px;
}
input[type="search"] {
  box-sizing: content-box;
}
textarea {
  height: 100px;
  display: block;
}
select {
  height: 40px;
}
.input-text {
  min-height: 20px;
  padding-left: 8px;
  padding-right: 8px;
  padding-top: 10px;
  padding-bottom: 10px;
  border-width: 1px;
  border-style: solid;
}
/*----------------form.less(end)--------------*/
/*----------------inputbox.less(start)--------------*/
.input-box,
.row,
.titlebar {
  position: relative;
  display: flex;
  display: -webkit-flex;
  display: box;
  display: -webkit-box;
  box-align: center;
  -webkit-box-align: center;
  -webkit-align-items: center;
  align-items: center;
}

/*box鍐呯殑琛ㄥ崟妗�*/
.input-box input:not([type="button"]):not([type="radio"]):not([type="checkbox"]),
.input-box select,
.input-box keygen,
.input-box textarea,
.input-box .input-text {
  display: block;
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
  -webkit-flex: 1;
  flex: 1;
  border: 0;
  background-color: transparent;
}
/*box鍐呭浘鏍�*/
.input-box .icon {
  margin-left: 8px;
  margin-right: 8px;
}
.input-box .icon:active {
  background-position: center bottom;
}
/*闇�瑕侀《澶╃珛鍦扮殑鎺т欢*/
.input-box select + .icon,
.input-box input[type="date"] + .icon,
.input-box input[type="month"] + .icon,
.input-box input[type="week"] + .icon,
.input-box input[type="datetime-local"] + .icon,
.input-box input[type="datetime"] + .icon,
.input-box input[type="time"] + .icon {
  position: absolute;
  top: 50%;
  right: 0;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  pointer-events: none;
}
/*鍥炬爣涓庢闂磋窛*/
.input-box .icon + input,
.input-box .icon + .input-text,
.input-box .icon + select,
.input-box .icon + textarea {
  padding-left: 0;
}
.input-box input + .icon,
.input-box .input-text + .icon,
.input-box select + .icon,
.input-box textarea + .icon {
  margin-left: 0;
}
.input-box .icon + .icon,
.row .icon + .icon,
.titlebar .icon + .icon {
  margin-left: 0px;
}
/*鎼滅储妗�*/
input[type=search].search,
input[type=text].search {
  padding-top: 6px;
  padding-bottom: 6px;
}
/*甯︽竻绌烘寜閽�*/
div[data-input=clear] input[type] + .icon {
  font-size: 20px;
  width: 20px;
  height: 20px;
  margin-right: 10px;
}
/*----------------inputbox.less(end)--------------*/
/*-----------------------------checkbox.less(start)-----------------------------*/
input[type="checkbox"],
.checkbox,
{
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  background-position: 0 0;
  background-repeat: no-repeat;
  height: 22px;
  width: 22px;
  line-height: 22px;
  background-size: auto 100%;
  vertical-align: middle;
  outline: none;
  border-radius: 0;
  border: none;
  background-color: transparent;
  font-family: "iconfont";
  font-size: 22px;
}
label input[type="checkbox"] + span,
.checkbox + span,
 {
  margin: 0 4px;
}
/*checkbox*/
input[type="checkbox"]:before,
.checkbox:before {
  content: "\e9dd";
}
input[type="checkbox"]:checked:before,
.checkbox.active:before {
  content: "\e9de";
}

/*-----------------------------checkbox.less(end)-----------------------------*/
/*----------------inputcolor.less(start)--------------*/
input[type="color"] {
  width: 44px;
  height: 24px;
  border: 0;
  padding: 0;
  background-color: #eee;
}
::-webkit-color-swatch-wrapper {
  border-radius: 4px;
  border-width: 1px;
  border-style: solid;
  background-color: white;
}
::-webkit-color-swatch {
  position: relative;
  height: 18px;
  left: 0;
  top: -2px;
  border: none;
}
/*----------------inputcolor.less(end)--------------*/
/*---------------tooltip.less(start)---------------*/
.tooltip {
  display: none;
  position: absolute;
  top: -50px;
  z-index: 1;
  width: 48px;
  height: 48px;
  font-size: 20px;
  line-height: 48px;
  text-align: center;
  text-shadow: 0 1px 0 #f3f3f3;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 6px;
  opacity: .8;
}
/*---------------tooltip.less(end)---------------*/
/*----------------progress.less(start)--------------*/
progress {
  height: 10px;
  border-width: 1px;
  border-style: solid;
  border-radius: 5px;
  overflow: hidden;
}
.progress-bar {
  height: 20px;
  /* Can be anything */
  position: relative;
}
.progress-bar.striped .progress:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 1;
  background-image: linear-gradient(-45deg, rgba(255, 255, 255, 0.2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.2) 75%, transparent 75%, transparent);
  background-size: 50px 50px;
  overflow: hidden;
}
.progress-bar.striped .progress.animated:after {
  animation: movestripes 2s linear infinite;
  -webkit-animation: movestripes 2s linear infinite;
}
.progress-bar.threed {
  box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
}
.progress-bar.threed .progress {
  box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3), inset 0 -2px 6px rgba(0, 0, 0, 0.4);
}
.text.left,
.text.right,
.text.center {
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
}
.text.left {
  left: 12px;
}
.text.right {
  right: 12px;
}
.text.center {
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
}
.progress-bar.radius4,
.progress-bar.radius4 .progress {
  border-radius: 4px;
}
.progress-bar.radius8,
.progress-bar.radius8 .progress {
  border-radius: 8px;
}
.progress-bar.radiusround,
.progress-bar.radiusround .progress {
  border-radius: 20px;
}
.progress {
  display: block;
  height: 100%;
  overflow: hidden;
  position: relative;
  -webkit-animation: progressexpand 1s linear;
  animation: progressexpand 1s linear;
}
@keyframes movestripes {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 50px 50px;
  }
}
@-webkit-keyframes movestripes {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 50px 50px;
  }
}
@keyframes progressexpand {
  0% {
    width: 0;
  }
}
@-webkit-keyframes progressexpand {
  0% {
    width: 0;
  }
}
/*----------------progress.less(end)--------------*/
/*----------------range.less(start)--------------*/
input[type=range] {
  -webkit-appearance: none!important;
  position: relative;
  width: 100%;
  height: 2px;
  padding: 0;
  margin: 17px 0;
  cursor: pointer;
  border: 0;
  border-radius: 3px;
  outline: 0;
}
input[type=range]::-webkit-slider-thumb {
  -webkit-appearance: none!important;
  width: 28px;
  height: 28px;
  border: 0;
  background-clip: padding-box;
  border-radius: 50%;
}
/*----------------range.less(end)--------------*/
/*----------------switch.less(start)--------------*/
/*鍏抽棴鐘舵��*/
.switch {
  position: relative;
  display: inline-block;
  height: 30px;
  width: 60px;
  background-color: transparent;
  border-radius: 30px;
  -webkit-transition-duration: .2s;
  -moz-transition-duration: .2s;
  -ms-transition-duration: .2s;
  -o-transition-duration: .2s;
  transition-duration: .2s;
  -webkit-transition-property: background-color, border;
  -moz-transition-property: background-color, border;
  -ms-transition-property: background-color, border;
  -o-transition-property: background-color, border;
  transition-property: background-color, border;
  border-width: 1px;
  border-style: solid;
  border-color: #ddd;
}
/*鍏抽棴鐘舵�佸渾鐐�*/
.switch .switch-handle {
  position: absolute;
  left: 0;
  top: 50%;
  -webkit-transform: translate(4px, -50%);
  -moz-transform: translate(4px, -50%);
  -ms-transform: translate(4px, -50%);
  -o-transform: translate(4px, -50%);
  transform: translate(4px, -50%);
  width: 20px;
  height: 20px;
  border-radius: 100px;
  -webkit-transition-duration: .2s;
  -moz-transition-duration: .2s;
  -ms-transition-duration: .2s;
  -o-transition-duration: .2s;
  transition-duration: .2s;
  -webkit-transition-property: -webkit-transform, border, width;
  -moz-transition-property: -moz-transform, border, width;
  -ms-transition-property: -moz-transform, border, width;
  -o-transition-property: -moz-transform, border, width;
  transition-property: transform, border, width;
  z-index: 2;
  background-color: #ddd;
}
/*鍏抽棴鐘舵�佹枃瀛梠ff*/
.switch:after {
  position: absolute;
  right: 11px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  content: attr(data-off);
  color: #aaa;
}
/*鎵撳紑鐘舵��*/
.switch.active {
  background-color: transparent;
}
/*鎵撳紑鐘舵�佸皬鍦嗙偣*/
.switch.active .switch-handle {
  left: 0;
  top: 50%;
  -webkit-transform: translate(34px, -50%);
  -moz-transform: translate(34px, -50%);
  -ms-transform: translate(34px, -50%);
  -o-transform: translate(34px, -50%);
  transform: translate(34px, -50%);
}
/*鎵撳紑鐘舵�佹枃瀛梠n*/
.switch.active:after {
  right: auto;
  left: 11px;
  content: attr(data-on);
}
/*寮�鍏虫帶浠秚oggle-鏃犳枃瀛�*/
.notext.switch {
  width: 50px;
}
.notext.switch:after {
  content: none;
}
.notext.switch.active .switch-handle {
  -webkit-transform: translate(24px, -50%);
  -moz-transform: translate(24px, -50%);
  -ms-transform: translate(24px, -50%);
  -o-transform: translate(24px, -50%);
  transform: translate(24px, -50%);
}
/*寮�鍏虫帶浠秚oggle-鍙嶈浆*/
.switch.reverse {
  border: none;
}
.switch.reverse .switch-handle {
  width: 26px;
  height: 26px;
  -webkit-transform: translate(2px, -50%);
  -moz-transform: translate(2px, -50%);
  -ms-transform: translate(2px, -50%);
  -o-transform: translate(2px, -50%);
  transform: translate(2px, -50%);
  background-color: #fff;
}
.switch.reverse.active .switch-handle {
  -webkit-transform: translate(32px, -50%);
  -moz-transform: translate(32px, -50%);
  -ms-transform: translate(32px, -50%);
  -o-transform: translate(32px, -50%);
  transform: translate(32px, -50%);
  background-color: #fff;
}
.switch.reverse.active:after {
  color: #fff;
}
/*鏃犳枃瀛楃姸鎬�*/
.notext.switch.reverse.active .switch-handle {
  -webkit-transform: translate(22px, -50%);
  -moz-transform: translate(22px, -50%);
  -ms-transform: translate(22px, -50%);
  -o-transform: translate(22px, -50%);
  transform: translate(22px, -50%);
}
/*----------------switch.less(end)--------------*/
/*----------------dragrefresh.less(start)--------------*/
.dragrefresh {
  position: absolute;
  top: -58px;
  left: 50%;
  margin-left: -20px;
  background-size: 32px 32px;
  background-position: center center;
  background-repeat: no-repeat;
  background-color: white;
  z-index: 5;
  width: 48px;
  height: 48px;
  border-radius: 100%;
  box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.2);
}
.dragrefresh i,
.dragrefresh img,
.dragrefresh svg {
  width: 32px;
  height: 32px;
  font-size: 32px;
  transform-origin: 50% 50%;
  -ms-transform-origin: 50% 50%;
  -webkit-transform-origin: 50% 50%;
  -moz-transform-origin: 50% 50%;
  -o-transform-origin: 50% 50%;
}
/*----------------dragrefresh.less(end)--------------*/
/*----------------error.less(start)--------------*/
.error-404,
.error-500,
.nowifi {
  margin: 0px auto;
  background-size: contain;
}
.nowifi {
  width: 200px;
  height: 200px;
}
.error-404,
.error-500 {
  width: 250px;
  height: 250px;
}
.nowifi {
  background-image: url(img/nowifi.svg);
}
.error-404 {
  background-image: url(img/404.svg);
}
.error-500 {
  background-image: url(img/500.svg);
}
.error {
  color: #888;
  text-align: center;
  margin-top: 20px;
  margin-bottom: 30px;
}
/*----------------error.less(end)--------------*/
/*---------------gauge.less(start)---------------*/
.gauge-box {
  position: relative;
  height: 400px;
  overflow: hidden;
  background-color: #1693ce;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  animation-duration: 0.5s;
  -webkit-animation-duration: 0.5s;
  animation-timing-function: linear;
  -webkit-animation-timing-function: linear;
  animation-fill-mode: forwards;
  -webkit-animation-fill-mode: forwards;
}
.gauge-box.bg1 {
  animation-name: gauge-box-bg1;
  -webkit-animation-name: gauge-box-bg1;
}
@keyframes gauge-box-bg1 {
  0% {
    background-color: #1693ce;
  }
  100% {
    background-color: #19a4e5;
  }
}
@-webkit-keyframes gauge-box-bg1 {
  0% {
    background-color: #1693ce;
  }
  100% {
    background-color: #19a4e5;
  }
}
.gauge-box.bg2 {
  animation-name: gauge-box-bg2;
  -webkit-animation-name: gauge-box-bg2;
}
@keyframes gauge-box-bg2 {
  0% {
    background-color: #1693ce;
  }
  50% {
    background-color: #19a4e5;
  }
  100% {
    background-color: #14ba91;
  }
}
@-webkit-keyframes gauge-box-bg2 {
  0% {
    background-color: #1693ce;
  }
  50% {
    background-color: #19a4e5;
  }
  100% {
    background-color: #14ba91;
  }
}
.gauge-box.bg3 {
  animation-name: gauge-box-bg3;
  -webkit-animation-name: gauge-box-bg3;
}
@keyframes gauge-box-bg3 {
  0% {
    background-color: #1693ce;
  }
  33% {
    background-color: #19a4e5;
  }
  67% {
    background-color: #14ba91;
  }
  100% {
    background-color: #16c447;
  }
}
@-webkit-keyframes gauge-box-bg3 {
  0% {
    background-color: #1693ce;
  }
  33% {
    background-color: #19a4e5;
  }
  67% {
    background-color: #14ba91;
  }
  100% {
    background-color: #16c447;
  }
}
.gauge-box.bg4 {
  animation-name: gauge-box-bg4;
  -webkit-animation-name: gauge-box-bg4;
}
@keyframes gauge-box-bg4 {
  0% {
    background-color: #1693ce;
  }
  25% {
    background-color: #19a4e5;
  }
  50% {
    background-color: #14ba91;
  }
  75% {
    background-color: #16c447;
  }
  100% {
    background-color: #2fcf1f;
  }
}
@-webkit-keyframes gauge-box-bg4 {
  0% {
    background-color: #1693ce;
  }
  25% {
    background-color: #19a4e5;
  }
  50% {
    background-color: #14ba91;
  }
  75% {
    background-color: #16c447;
  }
  100% {
    background-color: #2fcf1f;
  }
}
.gauge-box.bg5 {
  animation-name: gauge-box-bg5;
  -webkit-animation-name: gauge-box-bg5;
}
@keyframes gauge-box-bg5 {
  0% {
    background-color: #1693ce;
  }
  20% {
    background-color: #19a4e5;
  }
  40% {
    background-color: #14ba91;
  }
  60% {
    background-color: #16c447;
  }
  80% {
    background-color: #2fcf1f;
  }
  100% {
    background-color: #7cce16;
  }
}
@-webkit-keyframes gauge-box-bg5 {
  0% {
    background-color: #1693ce;
  }
  20% {
    background-color: #19a4e5;
  }
  40% {
    background-color: #14ba91;
  }
  60% {
    background-color: #16c447;
  }
  80% {
    background-color: #2fcf1f;
  }
  100% {
    background-color: #7cce16;
  }
}
.gauge-box.bg6 {
  animation-name: gauge-box-bg6;
  -webkit-animation-name: gauge-box-bg6;
}
@keyframes gauge-box-bg6 {
  0% {
    background-color: #1693ce;
  }
  16% {
    background-color: #19a4e5;
  }
  33% {
    background-color: #14ba91;
  }
  50% {
    background-color: #16c447;
  }
  66% {
    background-color: #2fcf1f;
  }
  87% {
    background-color: #7cce16;
  }
  100% {
    background-color: #c0ac05;
  }
}
@-webkit-keyframes gauge-box-bg6 {
  0% {
    background-color: #1693ce;
  }
  16% {
    background-color: #19a4e5;
  }
  33% {
    background-color: #14ba91;
  }
  50% {
    background-color: #16c447;
  }
  66% {
    background-color: #2fcf1f;
  }
  87% {
    background-color: #7cce16;
  }
  100% {
    background-color: #c0ac05;
  }
}
.gauge-box.bg7 {
  animation-name: gauge-box-bg7;
  -webkit-animation-name: gauge-box-bg7;
}
@keyframes gauge-box-bg7 {
  0% {
    background-color: #1693ce;
  }
  14% {
    background-color: #19a4e5;
  }
  28% {
    background-color: #14ba91;
  }
  43% {
    background-color: #16c447;
  }
  57% {
    background-color: #2fcf1f;
  }
  71% {
    background-color: #7cce16;
  }
  86% {
    background-color: #c0ac05;
  }
  100% {
    background-color: #c26900;
  }
}
@-webkit-keyframes gauge-box-bg7 {
  0% {
    background-color: #1693ce;
  }
  14% {
    background-color: #19a4e5;
  }
  28% {
    background-color: #14ba91;
  }
  43% {
    background-color: #16c447;
  }
  57% {
    background-color: #2fcf1f;
  }
  71% {
    background-color: #7cce16;
  }
  86% {
    background-color: #c0ac05;
  }
  100% {
    background-color: #c26900;
  }
}
.gauge-box.bg8 {
  animation-name: gauge-box-bg8;
  -webkit-animation-name: gauge-box-bg8;
}
@keyframes gauge-box-bg8 {
  0% {
    background-color: #1693ce;
  }
  12% {
    background-color: #19a4e5;
  }
  25% {
    background-color: #14ba91;
  }
  37% {
    background-color: #16c447;
  }
  50% {
    background-color: #2fcf1f;
  }
  62% {
    background-color: #7cce16;
  }
  75% {
    background-color: #c0ac05;
  }
  87% {
    background-color: #c26900;
  }
  100% {
    background-color: #c02e00;
  }
}
@-webkit-keyframes gauge-box-bg8 {
  0% {
    background-color: #1693ce;
  }
  12% {
    background-color: #19a4e5;
  }
  25% {
    background-color: #14ba91;
  }
  37% {
    background-color: #16c447;
  }
  50% {
    background-color: #2fcf1f;
  }
  62% {
    background-color: #7cce16;
  }
  75% {
    background-color: #c0ac05;
  }
  87% {
    background-color: #c26900;
  }
  100% {
    background-color: #c02e00;
  }
}
.gauge-box.bg9 {
  animation-name: gauge-box-bg9;
  -webkit-animation-name: gauge-box-bg9;
}
@keyframes gauge-box-bg9 {
  0% {
    background-color: #1693ce;
  }
  11% {
    background-color: #19a4e5;
  }
  22% {
    background-color: #14ba91;
  }
  33% {
    background-color: #16c447;
  }
  44% {
    background-color: #2fcf1f;
  }
  55% {
    background-color: #7cce16;
  }
  67% {
    background-color: #c0ac05;
  }
  78% {
    background-color: #c26900;
  }
  89% {
    background-color: #c02e00;
  }
  100% {
    background-color: #bf1200;
  }
}
@-webkit-keyframes gauge-box-bg9 {
  0% {
    background-color: #1693ce;
  }
  11% {
    background-color: #19a4e5;
  }
  22% {
    background-color: #14ba91;
  }
  33% {
    background-color: #16c447;
  }
  44% {
    background-color: #2fcf1f;
  }
  55% {
    background-color: #7cce16;
  }
  67% {
    background-color: #c0ac05;
  }
  78% {
    background-color: #c26900;
  }
  89% {
    background-color: #c02e00;
  }
  100% {
    background-color: #bf1200;
  }
}
.gauge-box.bg10 {
  animation-name: gauge-box-bg10;
  -webkit-animation-name: gauge-box-bg10;
}
@keyframes gauge-box-bg10 {
  0% {
    background-color: #1693ce;
  }
  10% {
    background-color: #19a4e5;
  }
  20% {
    background-color: #14ba91;
  }
  30% {
    background-color: #16c447;
  }
  40% {
    background-color: #2fcf1f;
  }
  50% {
    background-color: #7cce16;
  }
  60% {
    background-color: #c0ac05;
  }
  70% {
    background-color: #c26900;
  }
  80% {
    background-color: #c02e00;
  }
  90% {
    background-color: #bf1200;
  }
  100% {
    background-color: #760403;
  }
}
@-webkit-keyframes gauge-box-bg10 {
  0% {
    background-color: #1693ce;
  }
  10% {
    background-color: #19a4e5;
  }
  20% {
    background-color: #14ba91;
  }
  30% {
    background-color: #16c447;
  }
  40% {
    background-color: #2fcf1f;
  }
  50% {
    background-color: #7cce16;
  }
  60% {
    background-color: #c0ac05;
  }
  70% {
    background-color: #c26900;
  }
  80% {
    background-color: #c02e00;
  }
  90% {
    background-color: #bf1200;
  }
  100% {
    background-color: #760403;
  }
}
.gauge {
  position: relative;
  width: 200px;
  height: 200px;
  margin: 0 auto;
  background-image: url(img/gauge/gauge.png);
  background-size: 100% 100%;
}
.gauge-pointer {
  position: absolute;
  bottom: 45px;
  left: 52px;
  height: 60px;
  width: 60px;
  background-image: url(img/gauge/gauge-pointer.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  -webkit-transform-origin: 48px 13.5px;
  -webkit-transition: all 0.5s;
}
.gauge-text {
  position: absolute;
  bottom: 25px;
  width: 100%;
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  color: #59bdfc;
}
.gauge-wave {
  position: absolute;
  top: 80%;
  left: 0;
  width: 100%;
  height: 1136px;
  background-image: url(img/gauge/wave.png);
  background-repeat: repeat-x;
  background-position-x: 0;
  background-position-y: top;
  background-size: 960px auto;
  opacity: 0.2;
  -webkit-animation: lrWave 10s linear infinite;
  animation: lrWave 10s linear infinite;
}
@-webkit-keyframes lrWave {
  0% {
    background-position-x: 0;
  }
  100% {
    background-position-x: 960px;
  }
}
@keyframes lrWave {
  0% {
    background-position-x: 0;
  }
  100% {
    background-position-x: 960px;
  }
}
/*---------------gauge.less(end)---------------*/
.clock {
  position: relative;
  width: 200px;
  height: 200px;
  border-radius: 100%;
  border-style: solid;
  border-width: 2px;
  -webkit-transition-duration: 500ms;
  -webkit-transition-delay: 0;
}
.clock .origin {
  position: absolute;
  width: 4px;
  height: 4px;
  top: 50%;
  left: 50%;
  margin-left: -2px;
  margin-top: -2px;
  border-radius: 100%;
}
.clock .hour,
.clock .minute {
  position: absolute;
  bottom: 50%;
  left: 50%;
  width: 2px;
  margin-left: -1px;
  border-radius: 1px;
  -webkit-transform-origin: center bottom;
  -webkit-transition-property: all;
  -webkit-transition-timing-function: ease;
  -webkit-transition-duration: inherit;
  -webkit-transition-delay: inherit;
}
.clock .hour {
  height: 35%;
}
.clock .minute {
  height: 43%;
}
/*----------------------------chat.less(start)----------------------------*/
.chat {
  padding: 8px;
  box-sizing: border-box;
}
.chat li:after {
  display: table;
  content: " ";
  clear: both;
}
.chat .author {
  width: 40px;
  display: inline-block;
  text-align: center;
  float: left;
}
.chat .author img {
  width: 100%;
  border-radius: 100%;
}
.chat .author i {
  font-size: 12px;
  font-style: normal;
}
.chat .content-box {
  display: inline-block;
  font-size: 12px;
  float: left;
  margin-left: 12px;
  width: 70%;
}
.chat .content {
  display: inline-block;
  position: relative;
  padding: 10px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
}
.chat .content i {
  display: block;
  position: relative;
  font-style: normal;
  font-weight: 700;
  font-size: 12px;
}
.chat .content p {
  line-height: 24px;
  margin: 0;
  padding-top: 3px;
  text-align: left;
}
.chat .content p [data-emoji] {
  width: 26px;
  height: 24px;
}
.chat .content:after {
  position: absolute;
  right: 100%;
  top: 20%;
  height: 0;
  width: 0;
  content: " ";
  border-width: 5px;
  margin-top: -5px;
  border-style: solid;
  border-color: transparent;
}
/*even*/
.chat li {
  margin-bottom: 24px;
}
.chat .even .author {
  float: right;
}
.chat .even .content-box {
  width: 70%;
  margin-right: 12px;
  text-align: right;
  float: right;
}
.chat .even .content:after {
  left: 100%;
  top: 20%;
  border-color: transparent;
}
/*----------------------------chat.less(end)----------------------------*/
/*----------------grid.less(start)--------------*/
.grid:after {
  display: table;
  content: '';
  clear: both;
  zoom: 1;
}
.grid li {
  width: 33%;
  float: left;
  text-align: center;
  padding: 2px;
  box-sizing: border-box;
}
.grid li > a {
  position: relative;
  box-sizing: border-box;
  margin: 0px auto;
  background-size: cover;
  background-position: center;
}
.grid li > label {
  display: block;
  padding: 0 4px;
  margin-top: 8px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  box-sizing: border-box;
  font-size: 12px;
}
.grid li > a > img {
  max-width: 100%;
}
/*杈规*/
.grid.border {
  border-width: 0 0 1px 0;
  border-style: solid;
}
.grid.border li {
  border-style: solid;
  border-width: 1px 1px 0 0;
  border-color: inherit;
}
/*闂磋窛鎺у埗*/
.grid[data-rowspace="0"] li {
  padding-top: 0px;
}
.grid.border[data-rowspace="0"] li {
  padding-top: 0px;
  padding-bottom: 0px;
}
.grid[data-rowspace="6"] li {
  padding-top: 6px;
}
.grid[data-rowspace="6"] li:last-child {
  padding-bottom: 6px;
}
.grid.border[data-rowspace="6"] li {
  padding-top: 6px;
  padding-bottom: 6px;
}
.grid[data-rowspace="8"] li {
  padding-top: 8px;
}
.grid[data-rowspace="8"] li:last-child {
  padding-bottom: 8px;
}
.grid.border[data-rowspace="8"] li {
  padding-top: 8px;
  padding-bottom: 8px;
}
.grid[data-rowspace="10"] li {
  padding-top: 10px;
}
.grid[data-rowspace="10"] li:last-child {
  padding-bottom: 10px;
}
.grid.border[data-rowspace="10"] li {
  padding-top: 10px;
  padding-bottom: 10px;
}
.grid[data-rowspace="12"] li {
  padding-top: 12px;
}
.grid[data-rowspace="12"] li:last-child {
  padding-bottom: 12px;
}
.grid.border[data-rowspace="12"] li {
  padding-top: 12px;
  padding-bottom: 12px;
}
.grid[data-rowspace="30"] li {
  padding-top: 30px;
}
.grid[data-rowspace="30"] li:last-child {
  padding-bottom: 30px;
}
.grid.border[data-rowspace="30"] li {
  padding-top: 30px;
  padding-bottom: 30px;
}
.grid[data-col="2"] li {
  width: 50%;
}
.grid[data-col="3"] li {
  width: 33.33%;
}
.grid[data-col="4"] li {
  width: 25%;
}
.grid[data-col="5"] li {
  width: 20%;
}
/*灏忔苯娉�*/
.grid li .tip,
.grid li .badge,
.grid li .close {
  position: absolute;
  top: -4px;
  right: -4px;
}
/*Metro椋庢牸*/
.metro-tip {
  position: absolute;
  right: 10px;
  bottom: 4px;
  height: 32px;
  line-height: 32px;
  width: 32px;
  font-size: 18px;
  text-align: right;
  background-color: transparent;
}
.metro-tip + label {
  padding-right: 32px;
}
.grid.metro li > a {
  display: block;
  padding: 12px 8px;
}
.grid.metro li > a label {
  display: block;
  text-align: left;
  margin-top: 10px;
}
/*鐩稿唽灞曠幇*/
.grid.album li > a {
  width: 100%;
  min-height: 110px;
}
/*----------------grid.less(end)----------------*/
/*-----------------------------loading.less(start)-----------------------------*/
.loading-box {
  position: fixed;
  top: 50%;
  left: 50%;
  right: 0;
  bottom: 0;
  width: 100px;
  height: 100px;
  border-radius: 12px;
  z-index: 10;
  -webkit-transform: translate(-50%, -50%);
  background-color: white;
}
/*鍔犺浇鍔ㄧ敾*/
.loading {
  display: inline-block;
  vertical-align: middle;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  position: relative;
}
.loading:before,
.loading:after {
  position: absolute;
  content: '';
  width: 22px;
  height: 42px;
  background: white;
}
.loading:before {
  top: -1px;
  left: -1px;
  -webkit-transform-origin: 100% 50%;
  -webkit-animation: loading 1.2s ease 0.9s infinite;
}
.loading:after {
  top: -1px;
  left: 50%;
  -webkit-transform-origin: 0 50%;
  -webkit-animation: loading 1.2s infinite ease;
}
@-webkit-keyframes loading {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
/*鍔犺浇鏇村*/
.loading-more {
  padding: 12px 0;
  text-align: center;
}
.loading-more .loading {
  width: 30px;
  height: 30px;
}
.loading-more label {
  margin-left: 10px;
}
.loading-more .loading:before,
.loading-more .loading:after {
  width: 17px;
  height: 32px;
}
/*-----------------------------loading.less(end)----------------------------*/
/*----------------popup.less(start)--------------*/
/*pop-box*/
.popup {
  position: fixed;
  z-index: 10;
  width: 100%;
  min-height: 50px;
  border-style: solid;
  border-width: 0;
}
.alert,
.confirm,
.popup[data-pos=middle] {
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -moz-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  -o-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.popup[data-pos=top],
.popup[data-pos=bottom] {
  left: 50%;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  -o-transform: translateX(-50%);
  transform: translateX(-50%);
}
.popup[data-pos=left],
.popup[data-pos=right] {
  height: 100%;
  max-width: 270px;
  background-color: white;
}
/*绯荤粺寮瑰嚭妗�*/
.alert,
.confirm,
.toast,
.actionsheet {
  display: none;
}
/*alert&confirm*/
.alert,
.confirm {
  width: 270px;
  border-radius: 6px;
  margin: 0 auto;
  background-color: white;
}
.alert h1,
.confirm h1 {
  padding: 15px 0 5px 0;
  font-weight: 500;
  font-size: 18px;
  text-align: center;
}
.alert label,
.confirm label {
  display: block;
  padding: 10px 12px 15px 12px;
  line-height: 1.2em;
  word-wrap: break-word;
}
.popup-handler {
  display: block;
  text-align: center;
  white-space: nowrap;
  font-size: 0;
  border-color: inherit;
  border-style: inherit;
  border-width: 1px 0 0 0;
}
.popup-handler a,
.actionsheet a {
  display: inline-block;
  padding: 12px;
  font-size: 17px;
  box-sizing: border-box;
}
.popup-handler a {
  width: 50%;
  border-width: 0;
}
.popup-handler a:nth-of-type(2) {
  border-style: solid;
  border-width: 0 0 0 1px;
  border-color: inherit;
}
.popup-handler a:only-child {
  width: 100%;
}
/*actionsheet*/
.actionsheet {
  padding: 0 6px;
  box-sizing: border-box;
  width: 100%;
  bottom: -100%;
}
.actionsheet a {
  width: 100%;
  text-align: center;
}
.actionsheet-group {
  border-radius: 4px;
  overflow: hidden;
  border-style: solid;
  border-width: 0;
  border-color: #ddd;
  background-color: rgba(255, 255, 255, 0.9);
  background-color: white\0;
}
.actionsheet-group a {
  border-style: solid;
  border-width: 0 0 1px 0;
  border-color: inherit;
}
.actionsheet-group a:last-child {
  border-width: 0;
}
.actionsheet-cancel {
  width: 100%;
  border-radius: 4px;
  margin: 6px 0;
  background-color: rgba(255, 255, 255, 0.9);
  background-color: white\0;
}
.popup-handler a:active,
.actionsheet a:active {
  background-color: #ddd;
  border-color: #ddd;
}
/*pop-閬僵*/
.popup-mask {
  display: none;
  opacity: 0;
  filter: alpha(opacity=0);
  position: fixed;
  z-index: 10;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}
/*toast妗�*/
.toast-box {
  position: fixed;
  z-index: 999;
  bottom: -100%;
  width: 100%;
  text-align: center;
}
.toast {
  display: inline-block;
  padding: 10px;
  border-radius: 6px;
  font-size: 12px;
  max-width: 90%;
  max-height: 35px;
  line-height: 20px;
  overflow: hidden;
  text-align: left;
  color: white;
  background-color: rgba(0, 0, 0, 0.6);
  background-color: black\0;
}
/*custome*/
.custom {
  display: none;
  position: relative;
  -webkit-transform: translate(0, 0);
  left: auto;
  top: auto;
}
/*--------------------popup.less(end)----------------------*/
[data-emoji] {
  display: inline-block;
  width: 14%;
  height: 32px;
  margin: 8px 0;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center center;
  vertical-align: middle;
}
[data-emoji="[aoman]"] {
  background-image: url(img/emoji/aoman.png);
}
[data-emoji="[baibai]"] {
  background-image: url(img/emoji/baibai.png);
}
[data-emoji="[baiyan]"] {
  background-image: url(img/emoji/baiyan.png);
}
[data-emoji="[baobao]"] {
  background-image: url(img/emoji/baobao.png);
}
[data-emoji="[baoquan]"] {
  background-image: url(img/emoji/baoquan.png);
}
[data-emoji="[bishi]"] {
  background-image: url(img/emoji/bishi.png);
}
[data-emoji="[bizui]"] {
  background-image: url(img/emoji/bizui.png);
}
[data-emoji="[cahan]"] {
  background-image: url(img/emoji/cahan.png);
}
[data-emoji="[caidao]"] {
  background-image: url(img/emoji/caidao.png);
}
[data-emoji="[chajin]"] {
  background-image: url(img/emoji/chajin.png);
}
[data-emoji="[chouyan]"] {
  background-image: url(img/emoji/chouyan.png);
}
[data-emoji="[cool]"] {
  background-image: url(img/emoji/cool.png);
}
[data-emoji="[dabian]"] {
  background-image: url(img/emoji/dabian.png);
}
[data-emoji="[dahaqian]"] {
  background-image: url(img/emoji/dahaqian.png);
}
[data-emoji="[dangao]"] {
  background-image: url(img/emoji/dangao.png);
}
[data-emoji="[daxiao]"] {
  background-image: url(img/emoji/daxiao.png);
}
[data-emoji="[deyi]"] {
  background-image: url(img/emoji/deyi.png);
}
[data-emoji="[ku]"] {
  background-image: url(img/emoji/ku.png);
}
[data-emoji="[fadai]"] {
  background-image: url(img/emoji/fadai.png);
}
[data-emoji="[fendou]"] {
  background-image: url(img/emoji/fendou.png);
}
[data-emoji="[ganga]"] {
  background-image: url(img/emoji/ganga.png);
}
[data-emoji="[gongxi]"] {
  background-image: url(img/emoji/gongxi.png);
}
[data-emoji="[haixiu]"] {
  background-image: url(img/emoji/haixiu.png);
}
[data-emoji="[hanruyuxia]"] {
  background-image: url(img/emoji/hanruyuxia.png);
}
[data-emoji="[hongchun]"] {
  background-image: url(img/emoji/hongchun.png);
}
[data-emoji="[huaixiao]"] {
  background-image: url(img/emoji/huaixiao.png);
}
[data-emoji="[huaxiele]"] {
  background-image: url(img/emoji/huaxiele.png);
}
[data-emoji="[iloveyou]"] {
  background-image: url(img/emoji/iloveyou.png);
}
[data-emoji="[jianxiao]"] {
  background-image: url(img/emoji/jianxiao.png);
}
[data-emoji="[jiayou]"] {
  background-image: url(img/emoji/jiayou.png);
}
[data-emoji="[jingxia]"] {
  background-image: url(img/emoji/jingxia.png);
}
[data-emoji="[kafei]"] {
  background-image: url(img/emoji/kafei.png);
}
[data-emoji="[kaixin]"] {
  background-image: url(img/emoji/kaixin.png);
}
[data-emoji="[kelian]"] {
  background-image: url(img/emoji/kelian.png);
}
[data-emoji="[daku]"] {
  background-image: url(img/emoji/daku.png);
}
[data-emoji="[kulou]"] {
  background-image: url(img/emoji/kulou.png);
}
[data-emoji="[kun]"] {
  background-image: url(img/emoji/kun.png);
}
[data-emoji="[lai]"] {
  background-image: url(img/emoji/lai.png);
}
[data-emoji="[lanqiu]"] {
  background-image: url(img/emoji/lanqiu.png);
}
[data-emoji="[liuhan]"] {
  background-image: url(img/emoji/liuhan.png);
}
[data-emoji="[liwu]"] {
  background-image: url(img/emoji/liwu.png);
}
[data-emoji="[maren]"] {
  background-image: url(img/emoji/maren.png);
}
[data-emoji="[meigui]"] {
  background-image: url(img/emoji/meigui.png);
}
[data-emoji="[mifan]"] {
  background-image: url(img/emoji/mifan.png);
}
[data-emoji="[nanguo]"] {
  background-image: url(img/emoji/nanguo.png);
}
[data-emoji="[no]"] {
  background-image: url(img/emoji/no.png);
}
[data-emoji="[ok]"] {
  background-image: url(img/emoji/ok.png);
}
[data-emoji="[outu]"] {
  background-image: url(img/emoji/outu.png);
}
[data-emoji="[piaochong]"] {
  background-image: url(img/emoji/piaochong.png);
}
[data-emoji="[pijiu]"] {
  background-image: url(img/emoji/pijiu.png);
}
[data-emoji="[qiang]"] {
  background-image: url(img/emoji/qiang.png);
}
[data-emoji="[qiaotou]"] {
  background-image: url(img/emoji/qiaotou.png);
}
[data-emoji="[qingqing]"] {
  background-image: url(img/emoji/qingqing.png);
}
[data-emoji="[qiu]"] {
  background-image: url(img/emoji/qiu.png);
}
[data-emoji="[ruo]"] {
  background-image: url(img/emoji/ruo.png);
}
[data-emoji="[se]"] {
  background-image: url(img/emoji/se.png);
}
[data-emoji="[shandian]"] {
  background-image: url(img/emoji/shandian.png);
}
[data-emoji="[shangxin]"] {
  background-image: url(img/emoji/shangxin.png);
}
[data-emoji="[shouweiqu]"] {
  background-image: url(img/emoji/shouweiqu.png);
}
[data-emoji="[shuai]"] {
  background-image: url(img/emoji/shuai.png);
}
[data-emoji="[shuijiao]"] {
  background-image: url(img/emoji/shuijiao.png);
}
[data-emoji="[taiyang]"] {
  background-image: url(img/emoji/taiyang.png);
}
[data-emoji="[touxiao]"] {
  background-image: url(img/emoji/touxiao.png);
}
[data-emoji="[jingya]"] {
  background-image: url(img/emoji/jingya.png);
}
[data-emoji="[wabikong]"] {
  background-image: url(img/emoji/wabikong.png);
}
[data-emoji="[weiqu]"] {
  background-image: url(img/emoji/weiqu.png);
}
[data-emoji="[weixiao]"] {
  background-image: url(img/emoji/weixiao.png);
}
[data-emoji="[wen]"] {
  background-image: url(img/emoji/wen.png);
}
[data-emoji="[woshou]"] {
  background-image: url(img/emoji/woshou.png);
}
[data-emoji="[xia]"] {
  background-image: url(img/emoji/xia.png);
}
[data-emoji="[xigua]"] {
  background-image: url(img/emoji/xigua.png);
}
[data-emoji="[xin]"] {
  background-image: url(img/emoji/xin.png);
}
[data-emoji="[xinsui]"] {
  background-image: url(img/emoji/xinsui.png);
}
[data-emoji="[xu]"] {
  background-image: url(img/emoji/xu.png);
}
[data-emoji="[yeah]"] {
  background-image: url(img/emoji/yeah.png);
}
[data-emoji="[yewan]"] {
  background-image: url(img/emoji/yewan.png);
}
[data-emoji="[youhengheng]"] {
  background-image: url(img/emoji/youhengheng.png);
}
[data-emoji="[yun]"] {
  background-image: url(img/emoji/yun.png);
}
[data-emoji="[zhadan]"] {
  background-image: url(img/emoji/zhadan.png);
}
[data-emoji="[zhayan]"] {
  background-image: url(img/emoji/zhayan.png);
}
[data-emoji="[fanu]"] {
  background-image: url(img/emoji/fanu.png);
}
[data-emoji="[zhutou]"] {
  background-image: url(img/emoji/zhutou.png);
}
[data-emoji="[ziya]"] {
  background-image: url(img/emoji/ziya.png);
}
[data-emoji="[zuohengheng]"] {
  background-image: url(img/emoji/zuohengheng.png);
}
[data-emoji="[zuqiu]"] {
  background-image: url(img/emoji/zuqiu.png);
}
/*----------------share.less(start)--------------*/
.sharebox {
  padding: 12px;
  background-color: white;
}
/*----------------share.less(start)--------------*/
/*----------------------------slider.less(start)----------------------------*/
.slider-container {
  position: relative;
  width: 100%;
  overflow: hidden;
}
.slider-wrapper {
  position: absolute;
  width: 1122px;
  left: 0;
}
.slider-slide {
  position: relative;
  width: 374px;
  float: left;
  overflow: auto;
  background-size: cover;
  box-sizing: border-box;
}
.slider-slide img {
  width: 100%;
  max-width: 750px;
}
.slide-title {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 8px;
  background-color: rgba(0, 0, 0, 0.5);
  text-overflow: nowrap;
  box-sizing: border-box;
  color: white;
  text-align: left;
}
.slider-pagination {
  position: absolute;
  text-align: right;
  left: 0;
  bottom: 10px;
  width: 100%;
  line-height: 0;
  font-size: 0;
}
.slider-pagination .bullet {
  display: inline-block;
  opacity: 1;
  width: 5px;
  height: 5px;
  border-radius: 100%;
  margin-right: 5px;
  line-height: 8px;
  font-size: 12px;
  bottom: 10px;
  background-color: rgba(255, 255, 255, 0.5);
}
.slider-pagination .bullet.active {
  background-color: white;
}
/*----------------------------slider.less(end)----------------------------*/
/*----------------richedit.less(start)--------------*/
.richedit {
  position: fixed;
  top: auto;
  bottom: 0;
  width: 100%;
  z-index: 1;
}
/*琛ㄦ儏鍖哄煙*/
.richedit .emoji {
  display: none;
  font-size: 0;
  padding: 8px 0;
  height: 170px;
}
.richedit .emoji.active {
  display: block;
}
.richedit .richinput img {
  width: 24px;
}
/*杈撳叆妗嗗尯鍩�*/
.richedit figcaption {
  position: relative;
  border-style: solid;
  border-width: 1px 0 0 0;
  background-color: white;
  padding: 8px 70px 8px 8px;
}
.richedit .input {
  position: relative;
  border: none;
  vertical-align: middle;
  box-sizing: border-box;
  border-style: solid;
  border-width: 0 0 1px 0;
}
.richedit .input:before,
.richedit .input:after {
  content: '';
  position: absolute;
  width: 1px;
  height: 5px;
  bottom: 0;
}
.richedit .input:before {
  left: 0;
}
.richedit .input:after {
  right: 0;
}
.richedit textarea {
  background-color: transparent;
  width: 100%;
  border: none;
  resize: none;
}
.richedit textarea,
.richedit pre {
  padding: 0 4px;
  line-height: 32px;
  min-height: 32px;
  max-height: 32px;
  width: 100%;
}
.richedit pre span {
  display: inline;
}
.richedit.active textarea,
.richedit.active pre {
  max-height: 60px;
}
.richedit pre {
  position: absolute;
  left: 0;
  top: 100px;
  visibility: hidden;
}
/*鍙戦�佹寜閽�*/
.richedit .button,
.richedit button {
  position: absolute;
  right: 8px;
  bottom: 8px;
  height: 32px;
  line-height: 32px;
  width: 54px;
}
/*閬僵*/
.richedit + .mask {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.6);
}
/*婵�娲荤姸鎬�*/
.richedit.active {
  top: 0;
  bottom: auto;
}
.richedit.active .emoji {
  display: block;
}
.richedit.active + .mask {
  display: block;
}
/*琛ㄦ儏婊戝姩瀹瑰櫒灏忕偣鐐�*/
.richedit .slider-pagination {
  text-align: center;
}
.richedit .slider-pagination .bullet {
  background-color: #cfcfcf;
}
.richedit .slider-pagination .bullet.active {
  background-color: #a1a1a1;
}
/*----------------richedit.less(end)--------------*/
/*----------------------------summary.less(start)----------------------------*/
/*闅愯棌鍘熷鍥炬爣*/
summary::-webkit-details-marker {
  display: none;
}
/*鍥炬爣鏍峰紡*/
summary:after {
  position: absolute;
  top: 50%;
  right: 8px;
  width: 20px;
  height: 20px;
  line-height: 20px;
  content: '';
  -webkit-transform: translateY(-50%);
  background-repeat: no-repeat;
  background-size: cover;
  font-family: "iconfont";
  font-size: 14px;
  content: "\e91a";
}
/*鍥炬爣閫変腑鏍峰紡*/
details[open] summary:after {
  content: "\e90e";
}
/*----------------------------summary.less(end)----------------------------*/
/*---------------table.less(start)---------------*/
.table-box {
  width: 100%;
  overflow: auto;
  padding: 8px 0;
}
table {
  width: 100%;
  border-collapse: collapse;
  border-style: solid;
  border-width: 1px;
  background-color: white;
}
table th,
table td {
  border-style: solid;
  border-width: 0 0 1px 0;
  border-color: inherit;
  word-break: keep-all;
}
table th {
  font-weight: bold;
  border-width: 0 0 2px 0;
}
table td,
table th {
  text-align: left;
  padding: 15px 4px;
}
/*---------------table.less(end)---------------*/
/*----------------tree.less(start)--------------*/
.tree-box {
  padding: 0 0 0 32px;
  color: #393939;
  background-color: white;
}
.tree ul {
  padding-left: 20px;
  box-sizing: border-box;
}
.tree ul {
  display: none;
}
.tree li {
  display: block;
}
.tree {
  box-sizing: border-box;
}
/*鏍戞爣棰�*/
.treetitle {
  position: relative;
  border-style: solid;
  border-width: 0 0 1px 0;
  border-color: #ddd;
}
.treetitle:active {
  background-color: #ddd;
}
/*鏍戞爣棰�-鍥炬爣*/
.treetitle .radiusround {
  display: inline-block;
  vertical-align: middle;
  width: 32px;
  height: 32px;
  font-size: 16px;
  border-radius: 100%;
  text-align: center;
  line-height: 32px;
}
.treetitle [class*=icon-].radiusround {
  font-size: 24px;
}
.treeicon + .radiusround {
  margin-right: -4px;
  margin-left: 4px;
}
.treetitle .top,
.treetitle .right,
.treetitle .middle,
.treetitle .bottom {
  position: absolute;
}
.treetitle .right {
  right: 12px;
}
.treetitle .middle {
  top: 50%;
  -webkit-transform: translateY(-50%);
}
/*鏍戞爣棰�-閫変腑鏁堟灉*/
.treetitle.active {
  color: #4587F7;
}
.treetitle.active .radiusround {
  background-color: #4587F7;
}
/*鏍戞爣棰�-鏂囧瓧棰滆壊*/
.treetitle a {
  color: inherit;
}
.treetitle .icontitle {
  padding: 15px 0 15px 8px;
}
/*宸︿晶鍥炬爣*/
.treetitle .treeicon {
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
  left: -25px;
  width: 32px;
  height: 32px;
  font-size: 16px;
  background-size: cover;
  font-style: normal;
  display: -webkit-box;
  -webkit-box-pack: center;
  -webkit-box-align: center;
  display: -webkit-flex;
  -webkit-justify-content: center;
  -webkit-align-items: center;
}
.treetitle .icon-arrowright.active:before {
  font-family: "iconfont";
  content: "\e90e";
}
/*淇敼宸︿晶绠ご鍥炬爣*/
.treetitle .treeicon.radiusround {
  left: -28px;
}
/*----------------tree.less(end)--------------*/
/*----------------validate.less(start)--------------*/
/*瀹夊叏绾у埆*/
.safelvl {
  position: absolute;
  left: 0;
  bottom: -31px;
  height: 30px;
  width: 100%;
  color: white;
  background-color: #dddddd;
}
.safelvl .progress {
  position: absolute;
  top: 0;
  left: 0;
  height: 30px;
  transition: all linear 200ms;
}
.safelvl.lvl1 .progress {
  width: 33%;
  background-color: #f86868;
}
.safelvl.lvl2 .progress {
  width: 66%;
  background-color: #f4984e;
}
.safelvl.lvl3 .progress {
  width: 100%;
  background-color: #88d038;
}
.safelvl ul {
  display: block;
  position: absolute;
  width: 100%;
  top: 0;
  left: 0;
  z-index: 2;
}
.safelvl ul li {
  display: block;
  height: 30px;
  line-height: 30px;
  text-align: center;
  width: 33%;
  float: left;
}
.safelvl ul li:last-child {
  width: 34%;
}
/*----------------validate.less(end)--------------*/
/*-----------------------------weather.less(start)-----------------------------*/
.weather-box {
  position: relative;
  height: 60px;
  box-sizing: border-box;
  overflow: hidden;
  color: white;
  transition: height 0.5s linear;
}
.weather-box small {
  color: white;
}
.weather-topinfo {
  height: 40px;
  line-height: 40px;
  padding: 0 10px;
  box-sizing: border-box;
  -webkit-transform: translateY(-100px);
  opacity: 0;
  transition: all 0.5s linear;
}
.weather-topinfo [class*="icon-"] {
  font-size: 20px;
}
.weather-current-city {
  display: inline-block;
  height: 20px;
  line-height: 20px;
  background-repeat: no-repeat;
  background-size: contain;
  background-position: left center;
}
.weather-current-date {
  float: right;
}
.weather-current-temperature,
.weather-today-right [class^="weather-icon-"] {
  height: 40px;
  margin: 10px 0;
  text-align: center;
}
.sndinfo {
  -webkit-transform: translateY(100%);
  opacity: 0;
  transition: all 0.5s linear;
}
/*褰撳墠娓╁害*/
.weather-current-temperature {
  font-size: 32px;
  height: 40px;
  margin: 10px 0;
  text-align: left;
  text-indent: 8px;
}
.weather-today {
  height: 200px;
  position: relative;
}
.weather-today-left {
  position: absolute;
  top: -40px;
  left: 5px;
  text-align: center;
  transition: all 0.5s linear;
}
.weather-today-right {
  position: absolute;
  top: -40px;
  right: 5px;
  text-align: center;
  transition: all 0.5s linear;
}
/*鍏跺畠澶╂皵*/
ul.weather-otherday {
  position: absolute;
  width: 100%;
  bottom: 10px;
  font-size: 10px;
  -webkit-transform: translateY(300px);
  opacity: 0;
  transition: all 0.5s linear;
}
ul.weather-otherday li {
  display: inline-block;
  text-align: center;
  width: 25%;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  float: left;
}
.weather-collapse {
  position: absolute;
  top: 10px;
  left: 90px;
  opacity: 1;
  transition: all 0.5s linear;
}
.weather-collapse .weather-current-city {
  background-image: none;
  padding-left: 0;
}
.weather-collapse .weather-name {
  margin-left: 5px;
}
/*灞曞紑鐘舵��*/
.weather-box.expand {
  height: 250px;
}
.weather-box.expand .weather-topinfo {
  -webkit-transform: translateY(0);
  opacity: 1;
}
.weather-box.expand .weather-current-temperature {
  text-align: center;
}
.weather-box.expand ul.weather-otherday {
  -webkit-transform: translateY(0);
  opacity: 1;
}
.weather-box.expand .sndinfo {
  -webkit-transform: translateY(0);
  opacity: 1;
}
.weather-box.expand .weather-today-left {
  top: 0;
  left: 80px;
}
.weather-box.expand .weather-today-right {
  top: 0;
  right: 80px;
}
.weather-box.expand .weather-collapse {
  top: 300px;
  opacity: 0;
}
/*澶╂皵鍥炬爣*/
#weather-current-icon {
  height: 40px;
  font-size: 40px;
  margin: 10px 0;
}
.weather-box [class*="icon-"] {
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center center;
}
.weather-otherday [class*="icon-"] {
  width: 24px;
  height: 24px;
  font-size: 24px;
  line-height: 24px;
  text-align: center;
  display: inline-block;
}
/*-----------------------------weather.less(end)-----------------------------*/
/*----------------------------calendar.less(start)----------------------------*/
.calendar {
  position: relative;
  width: 100%;
  border-style: solid;
  border-width: 0 0 1px 0;
  overflow: hidden;
}
.calendar-title {
  font-size: 20px;
  text-align: center;
}
.date_container {
  overflow: hidden;
  width: 300%;
}
.day {
  width: 300%;
}
.week-day-line {
  width: 33%;
  display: inline-block;
}
.date_container:after {
  display: table;
  content: '';
  clear: both;
  zoom: 1;
}
.month-block {
  width: 33%;
  display: inline-block;
}
.day-name,
.day-date {
  display: inline-block;
  text-align: center;
  float: left;
  width: 14%;
}
.day-name:first-child,
.day-name:last-child,
.day-date:first-child,
.day-date:last-child {
  width: 15%;
}
.day-date {
  padding: 7px 0;
}
.day-date span.show-date {
  display: inline-block;
  width: 36px;
  height: 36px;
  line-height: 36px;
  border-radius: 36px;
}
.day-date .active {
  color: #fff;
}
.arrowleft,
.arrowright {
  font-size: 20px;
}
/*----------------------------calendar.less(end)----------------------------*/
/*--------------------badge.less(start)----------------------*/
.badge,
.tip {
  display: inline-block;
  vertical-align: middle;
  text-align: center;
}
.badge,
.tip,
.close {
  position: relative;
  overflow: hidden;
  text-overflow: ellipsis;
  border-radius: 100%;
  z-index: 1;
}
/*灏忕偣鐐�*/
.dot {
  display: inline-block;
  border-radius: 100%;
  height: 4px;
  width: 4px;
  vertical-align: middle;
}
/*鏍囬灏忔爣璁�*/
.peg {
  display: inline-block;
  width: 6px;
  height: 12px;
}
.badge,
.tip,
.close {
  font-size: 12px;
}
.tip,
.close {
  width: 24px;
  height: 24px;
}
.badge {
  padding: 0 4px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  border-radius: 20px;
  min-width: 24px;
}
.badge.arrow {
  padding: 2px 8px;
  font-size: 14px;
  overflow: visible;
  color: white;
}
.badge.arrow:after {
  position: absolute;
  right: 10px;
  top: -4px;
  height: 0;
  width: 0;
  content: " ";
  border-width: 5px;
  margin-top: -5px;
  border-style: solid;
  border-color: transparent;
}
.tip {
  line-height: 24px;
}
.close {
  /*鍥剧墖*/
  background-size: cover;
  border-radius: 100%;
  /*鏂囧瓧鍥炬爣*/
  border-width: 2px;
  border-style: solid;
  color: white;
  border-color: white;
  background-color: rgba(0, 0, 0, 0.7);
  display: box;
  display: -webkit-box;
  box-pack: center;
  -webkit-box-pack: center;
  box-align: center;
  -webkit-box-align: center;
  display: flex;
  display: -webkit-flex;
  justify-content: center;
  -webkit-justify-content: center;
  align-items: center;
  -webkit-align-items: center;
}
.sticker {
  position: absolute;
  width: 0px;
  height: 0px;
  border-width: 0;
  border-style: solid;
}
.sticker span {
  position: absolute;
  font-size: 12px;
  padding: 0 2px;
}
.sticker.top,
.sticker.top span {
  top: 0;
}
.sticker.top {
  border-top-width: 32px;
}
.sticker.top span {
  margin-top: -30px;
}
.sticker.left,
.sticker.left span {
  left: 0;
}
.sticker.left {
  border-right-width: 56px;
  border-right-color: transparent;
}
.sticker.right,
.sticker.right span {
  right: 0;
}
.sticker.right {
  border-left-width: 56px;
  border-left-color: transparent;
}
.sticker.bottom,
.sticker.bottom span {
  bottom: 0;
}
.sticker.bottom {
  border-bottom-width: 32px;
}
.sticker.bottom span {
  margin-bottom: -30px;
}
/*--------------------badge.less(start)----------------------*/
/*---------------i.less(start)---------------*/
/*鎺т欢榛樿鍥炬爣灏哄*/
.icon {
  font-size: 24px;
  width: 24px;
  height: 24px;
}
.list .icon {
  font-size: 16px;
  width: 16px;
  height: 16px;
}
.card-info .icon,
.card-handler .icon {
  font-size: 20px;
  width: 20px;
  height: 20px;
}
.grid .icon {
  font-size: 32px;
  width: 32px;
  height: 32px;
}
.metro .icon {
  font-size: 40px;
  width: 40px;
  height: 40px;
}
.photo .icon {
  font-size: 28px;
  width: 28px;
  height: 28px;
}
button .icon,
input[type="button"] .icon,
.button .icon {
  font-size: 20px;
  width: 20px;
  height: 20px;
}
.badge .icon,
.tip .icon,
.close .icon {
  font-size: 12px;
  width: 12px;
  height: 12px;
}
/*鍥炬爣*/
i, .icon {
  position: relative;
  background-size: auto 200%;
  background-position: center top;
  color:#000000;
}
.icon.active {
  background-position: center bottom;
}
/*---------------i.less(end)---------------*/
/*---------------size.less(start)---------------*/
i.size8,
.icon.size8 {
  font-size: 8px;
  width: 8px;
  height: 8px;
}
.size12 .icon,
i.size12,
.icon.size12 {
  font-size: 12px;
  width: 12px;
  height: 12px;
}
.size16 .icon,
i.size16,
.icon.size16 {
  font-size: 16px;
  width: 16px;
  height: 16px;
}
.size20 .icon,
i.size20,
.icon.size20 {
  font-size: 20px;
  width: 20px;
  height: 20px;
}
.size24 .icon,
i.size24,
.icon.size24 {
  font-size: 24px;
  width: 24px;
  height: 24px;
}
.size28 .icon,
i.size28,
.icon.size28 {
  font-size: 28px;
  width: 28px;
  height: 28px;
}
.size30 .icon,
i.size30,
.icon.size30 {
  font-size: 30px;
  width: 30px;
  height: 30px;
}
.size32 .icon,
i.size32,
.icon.size32 {
  font-size: 32px;
  width: 32px;
  height: 32px;
}
.size40 .icon,
i.size40,
.icon.size40 {
  font-size: 40px;
  width: 40px;
  height: 40px;
}
.size54 .icon,
i.size54,
.icon.size54 {
  font-size: 54px;
  width: 54px;
  height: 54px;
}
/*澶村儚*/
.size32 .photo,
.photo.size32 {
  width: 32px;
  height: 32px;
}
.size32 .photo .icon,
.photo.size32 .icon {
  font-size: 18px;
  width: 18px;
  height: 18px;
}
.size40 .photo,
.photo.size40 {
  width: 40px;
  height: 40px;
}
.size40 .photo .icon,
.photo.size40 .icon {
  font-size: 24px;
  width: 24px;
  height: 24px;
}
.size50 .photo,
.photo.size50 {
  width: 50px;
  height: 50px;
}
.size50 .photo .icon,
.photo.size50 .icon {
  font-size: 28px;
  width: 28px;
  height: 28px;
}
.size54 .photo,
.photo.size54 {
  width: 54px;
  height: 54px;
}
.size54 .photo .icon,
.photo.size54 .icon {
  font-size: 30px;
  width: 30px;
  height: 30px;
}
.size80 .photo,
.photo.size80 {
  width: 80px;
  height: 80px;
}
.size80 .photo .icon,
.photo.size80 .icon {
  font-size: 54px;
  width: 54px;
  height: 54px;
}
/*灏忔苯娉�*/
.badge.size32 {
  width: 24px;
}
/*鍦嗗舰*/
.radiusround.size40 {
  width: 40px;
  height: 40px;
}
/*楂樺害*/
.height26 {
  height: 26px;
}
.button.height26 {
  line-height: 26px;
}
.card-handler.height26 > a {
  height: 26px;
  line-height: 26px;
}
.height30 {
  height: 30px;
}
.button.height30 {
  line-height: 28px;
}
.card-handler.height30 > a {
  height: 30px;
  line-height: 30px;
}
.height32 {
  height: 32px;
}
.button.height32 {
  line-height: 30px;
}
.card-handler.height32 > a {
  height: 32px;
  line-height: 32px;
}
.height40 {
  height: 40px;
}
.button.height40 {
  line-height: 38px;
}
.card-handler.height40 > a {
  height: 40px;
  line-height: 40px;
}
.height50 {
  height: 50px;
}
.button.height50 {
  line-height: 48px;
}
.card-handler.height50 > a {
  height: 50px;
  line-height: 50px;
}
.height54 {
  height: 54px;
}
.button.height54 {
  line-height: 52px;
}
.card-handler.height54 > a {
  height: 54px;
  line-height: 54px;
}
/*鏂囧瓧*/
p.size17 {
  font-size: 17px;
}
p.size20 {
  font-size: 20px;
}
/*---------------size.less(end)---------------*/
/*---------------radius.less(start)---------------*/
/*鎺у埗鍦嗚*/
/*鎸夐挳*/
button.radiusround,
input[type="button"].radiusround,
input[type="submit"].radiusround,
.button.radiusround {
  border-radius: 32px;
}
/*鍏ㄥ眬鍦嗚*/
.noradius {
  border-radius: 0 !important;
}
.radius4,
.grid.radius4 > li > a {
  border-radius: 4px;
}
.radius6,
.grid.radius6 > li > a {
  border-radius: 6px;
}
.radius8,
.grid.radius8 > li > a {
  border-radius: 8px;
}
.radius16,
.grid.radius16 > li > a {
  border-radius: 16px;
}
.radius20,
.grid.radius20 > li > a {
  border-radius: 20px;
}
.radius40,
.grid.radius40 > li > a {
  border-radius: 40px;
}
.radiusround,
.grid.radiusround > li > a {
  border-radius: 100%;
}
.grid {
  border-radius: 0;
}
/*---------------radius.less(end)---------------*/
/*----------------box.less(start)--------------*/
.box {
  display: -moz-box;
  display: -webkit-box;
  display: box;
  display: -webkit-flex;
  display: flex;
}
.box-center,
.box-middlecenter,
.text-center {
  -moz-box-pack: center;
  -webkit-box-pack: center;
  box-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
}
.box-right {
  -moz-box-pack: end;
  -webkit-box-pack: end;
  box-pack: end;
  -webkit-justify-content: flex-end;
  justify-content: flex-end;
}
.box-middle,
.box-middlecenter {
  -moz-box-align: center;
  -webkit-box-align: center;
  box-align: center;
  -webkit-align-items: center;
  align-items: center;
}
.box-top {
  -moz-box-align: start;
  -webkit-box-align: start;
  box-align: start;
  -webkit-align-items: flex-start;
  align-items: flex-start;
}
.box-bottom {
  -moz-box-align: end;
  -webkit-box-align: end;
  box-align: end;
  -webkit-align-items: flex-end;
  align-items: flex-end;
}
.box-vertical {
  -moz-box-orient: vertical;
  -webkit-box-orient: vertical;
  box-orient: vertical;
  -webkit-flex-flow: column;
  flex-flow: column;
}
.box-horizontal {
  -moz-box-orient: horizontal;
  -webkit-box-orient: horizontal;
  box-orient: horizontal;
  -webkit-flex-flow: row;
  flex-flow: row;
}
.box-shrink > div,
.box-shrink > button {
  width: 100%;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-flex-shrink: 0;
  -ms-flex: 0 0 auto;
  flex-shrink: 0;
}
.box-flex-1 {
  -moz-box-flex: 1.0;
  -webkit-box-flex: 1.0;
  box-flex: 1.0;
  -webkit-flex: 1;
  flex: 1;
}
.box-flex-2 {
  -moz-box-flex: 2.0;
  -webkit-box-flex: 2.0;
  box-flex: 2.0;
  -webkit-flex: 2;
  flex: 2;
}
.box-flex-3 {
  -moz-box-flex: 3.0;
  -webkit-box-flex: 3.0;
  box-flex: 3.0;
  -webkit-flex: 3;
  flex: 3;
}
/*flex甯冨眬鏂瑰紡*/
.flex {
  display: -webkit-flex;
  display: flex;
}
.flex-1 {
  -webkit-flex: 1;
  flex: 1;
}
.flex-2 {
  -webkit-flex: 2;
  flex: 2;
}
.flex-3 {
  -webkit-flex: 3;
  flex: 3;
}
.flex-4 {
  -webkit-flex: 4;
  flex: 4;
}
.flex-5 {
  -webkit-flex: 5;
  flex: 5;
}
.flex-6 {
  -webkit-flex: 6;
  flex: 6;
}
.flex-7 {
  -webkit-flex: 7;
  flex: 7;
}
.flex-8 {
  -webkit-flex: 8;
  flex: 8;
}
.flex-9 {
  -webkit-flex: 9;
  flex: 9;
}
/*--------------flex-flow--------------*/
/*妯悜*/
.flex-row {
  flex-flow: row;
  /*妯悜鎺掑垪*/
}
.flex-row-wrap {
  flex-flow: row wrap;
  /*瓒呰繃閮ㄥ垎灏嗘崲琛�*/
}
.flex-row-reverse {
  flex-flow: row-reverse;
  /*妯悜鍊掑簭鎺掑垪*/
}
.flex-row-reverse-wrap {
  flex-flow: row-reverse wrap;
  /*瓒呰繃閮ㄥ垎灏嗘崲琛�*/
}
/*绾靛悜*/
.flex-col {
  flex-flow: column;
  /*绾靛悜鎺掑垪*/
}
.flex-col-wrap {
  flex-flow: column wrap;
  /*瓒呰繃閮ㄥ垎灏嗘崲琛�*/
}
.flex-col-reverse {
  flex-flow: column-reverse;
  /*绾靛悜鍊掑簭鎺掑垪*/
}
/*--------------align-content--------------*/
.align-stretch {
  align-content: stretch;
  /*鎷変几*/
}
.align-start {
  align-content: flex-start;
  /*椤堕儴瀵归綈*/
}
.align-center {
  align-content: center;
  /*鍨傜洿灞呬腑*/
}
.align-end {
  align-content: flex-end;
  /*搴曢儴瀵归綈*/
}
.align-between {
  align-content: space-between;
  /*鍨傜洿涓ょ鍒嗗竷*/
}
.align-around {
  align-content: space-around;
  /*鍨傜洿灞呬腑鍒嗗竷*/
}
/*--------------justify-content--------------*/
/*閰嶅悎flex-row-wrap涓�鍚屼娇鐢�*/
.justify-stretch {
  justify-content: stretch;
  /*鎷変几*/
}
.justify-start {
  justify-content: flex-start;
  /*宸﹀榻�*/
}
.justify-center {
  justify-content: center;
  /*姘村钩灞呬腑*/
}
.justify-end {
  justify-content: flex-end;
  /*鍙冲榻�*/
}
.justify-between {
  justify-content: space-between;
  /*姘村钩涓ょ鍒嗗竷*/
}
.justify-around {
  justify-content: space-around;
  /*姘村钩灞呬腑鍒嗗竷*/
}
/*--------------align-items--------------*/
.align-items-stretch {
  align-items: stretch;
  /*鎷変几*/
}
.align-items-center {
  align-items: center;
  /*鍨傜洿灞呬腑*/
}
.align-items-start {
  align-items: flex-start;
  /*椤堕儴瀵归綈*/
}
.align-items-end {
  align-items: flex-end;
  /*搴曢儴瀵归綈*/
}
/*--------------align-self--------------*/
.align-self-stretch {
  align-self: stretch;
  /*鎷変几*/
}
.align-self-start {
  align-self: flex-start;
  /*椤堕儴瀵归綈*/
}
.align-self-center {
  align-self: center;
  /*鍨傜洿灞呬腑*/
}
.align-self-end {
  align-self: flex-end;
  /*搴曢儴瀵归綈*/
}
/*----------------box.less(end)--------------*/
/*----------------layout.less(start)--------------*/
.tb {
  -webkit-writing-mode: horizontal-tb;
}
.bt {
  -webkit-writing-mode: horizontal-bt;
}
.tb-rl {
  -webkit-writing-mode: vertical-rl;
}
.tb-lr {
  -webkit-writing-mode: vertical-lr;
}
.lr {
  direction: ltr;
}
.rl {
  direction: rtl;
}
.text-center {
  text-align: center;
}
.text-right {
  text-align: right;
}
.text-left {
  text-align: left;
}
.float-left {
  float: left;
}
.float-right {
  float: right;
}
.self-middle {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  /* IE 9 */
  -moz-transform: translateY(-50%);
  /* Firefox */
  -webkit-transform: translateY(-50%);
  /* Safari 鍜� Chrome */
  -o-transform: translateY(-50%);
}
.self-center {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  /* IE 9 */
  -moz-transform: translateX(-50%);
  /* Firefox */
  -webkit-transform: translateX(-50%);
  /* Safari 鍜� Chrome */
  -o-transform: translateX(-50%);
}
.self-middlecenter {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  /* IE 9 */
  -moz-transform: translate(-50%, -50%);
  /* Firefox */
  -webkit-transform: translate(-50%, -50%);
  /* Safari 鍜� Chrome */
  -o-transform: translate(-50%, -50%);
}
.table {
  display: table;
}
.table-cell-bottom {
  display: table-cell;
  vertical-align: bottom;
}
/*姘村钩鎺掑垪*/
.horizontal {
  overflow-x: auto;
  white-space: nowrap;
}
/*闂磋窛涓庡竷灞�*/
.indent {
  text-indent: 8px;
}
.width-full {
  width: 100%;
}
.lineheight0 {
  line-height: 0;
}
.height-full {
  height: 100%;
}
.width-auto {
  width: auto;
}
.height-auto {
  height: auto;
}
.space6,
.space12,
.space14,
.space16 {
  display: inline-block;
  *display: inline;
  *zoom: 1;
  width: 12px;
  height: 12px;
}
.space6 {
  width: 6px;
}
.space14 {
  width: 14px;
  height: 12px;
}
.space16 {
  width: 16px;
  height: 12px;
}
.rowspace,
.rowspace4,
.rowspace6,
.rowspace8,
.rowspace12,
.rowspace20,
.rowspace40 {
  display: block;
  border: none;
  clear: both;
}
.rowspace4 {
  height: 4px;
}
.rowspace {
  height: 8px;
}
.rowspace8 {
  height: 8px;
}
.rowspace12 {
  height: 12px;
}
.rowspace20 {
  height: 20px;
}
.rowspace22 {
  height: 22px;
}
.rowspace40 {
  height: 40px;
}
.margin4 {
  margin: 4px;
}
.margin6 {
  margin: 6px;
}
.margin8 {
  margin: 8px;
}
.margin12 {
  margin: 12px;
}
.lrmargin8 {
  margin-left: 8px;
  margin-right: 8px;
}
.tbmargin4 {
  margin-top: 4px;
  margin-bottom: 4px;
}
.tbmargin8 {
  margin-top: 8px;
  margin-bottom: 8px;
}
.nomargin {
  margin: 0 !important;
}
.nolrmargin {
  margin-left: 0 !important;
  margin-right: 0 !important;
}
.notbmargin {
  margin-top: 0 !important;
  margin-bottom: 0 !important;
}
.padding4 {
  padding: 4px;
}
.padding6 {
  padding: 6px;
}
.padding8 {
  padding: 8px;
}
.lrpadding4 {
  padding-left: 4px;
  padding-right: 4px;
}
.lrpadding8 {
  padding-left: 8px;
  padding-right: 8px;
}
.tbpadding4 {
  padding-top: 4px;
  padding-bottom: 4px;
}
.tbpadding8 {
  padding-top: 8px;
  padding-bottom: 8px;
}
.padding12 {
  padding: 12px;
}
.nopadding {
  padding: 0 !important;
}
.nolrpadding {
  padding-left: 0 !important;
  padding-right: 0 !important;
}
.notbpadding {
  padding-top: 0 !important;
  padding-bottom: 0 !important;
}
.indent6 {
  text-indent: 6px;
}
.indent8 {
  text-indent: 8px;
}
.indent24 {
  text-indent: 24px;
}
.paragraph {
  line-height: 24px;
  margin: 8px 0;
  padding: 0 8px;
}
.article-title {
  font-size: 20px;
  font-weight: 200;
  margin: 8px 0;
}
/*鏄剧ず涓庨殣钘�*/
.hide {
  display: none;
}
.hidden {
  visibility: hidden;
}
.block {
  display: block;
}
.inline-block {
  display: inline-block;
}
/*绾挎潯*/
.underline {
  border-style: solid;
  border-width: 0 0 1px 0;
}
/*----------------layout.less(end)--------------*/
/*鎺т欢*/
/*甯哥敤棰滆壊*/
/*----------------global.less(start)--------------*/
body {
  color: #333333;
}
/*鏍囩榛樿鏍峰紡*/
::selection {
  background: #36acf4;
  color: #ffffff;
}
::-webkit-input-placeholder {
  color: #aaaaaa;
}
:-moz-placeholder {
  color: #aaaaaa;
}
::-moz-placeholder {
  color: #aaaaaa;
}
:-ms-input-placeholder {
  color: #aaaaaa;
}
.placeholder {
  color: #aaaaaa;
}
a {
  color: #18b2ed;
}
a:not(.noclick):active,
a.active {
  opacity: 0.5;
}
/*瀹瑰櫒鏍峰紡*/
.highlight {
  border-color: #dddddd;
  background-color: #f4f4f4;
}
hr {
  border-color: #dddddd;
}
/*鏉＄汗绾�*/
.stripe:nth-child(even) {
  background-color: #f4f4f4;
}
.nostripe:nth-child(even) {
  background-color: transparent;
}
/*----------------global.less(end)--------------*/
/*----------------mbox.less(start)--------------*/
section {
  background-color: #f4f4f4;
}
/*----------------mbox.less(end)--------------*/
/*----------------aside.less(start)--------------*/
/*涓讳綋閬僵*/
.section_container_mask {
  background-color: rgba(0, 0, 0, 0.4);
}
/*渚ц竟鏍�*/
aside {
  background-color: #f4f4f4;
}
/*----------------aside.less(end)--------------*/
/*----------------titlebar.less(start)--------------*/
.titlebar {
  background-color: white;
  border-color: #cccccc;
}
.titlebar h1 {
  color: #000000;
}
.titlebar a {
  color: #000000;
}
.titlebar a:active:not(.disable) {
  color: rgba(54, 172, 244, 0.5);
}
.titlebar a.disable:not(.button) {
  opacity: 0.5;
}
.titlebar.reverse {
  background-color: #36acf4;
  border-color: #36acf4;
}
.titlebar.reverse h1 {
  color: #ffffff;
}
.titlebar.reverse a,
.titlebar.reverse button,
.titlebar.reverse input[type="button"] {
  color: #ffffff;
  border-color: rgba(255, 255, 255, 0.5);
}
.titlebar.reverse a:active,
.titlebar.reverse button:active,
.titlebar.reverse input[type="button"]:active,
.titlebar.reverse a.active,
.titlebar.reverse button.active,
.titlebar.reverse input[type="button"].active {
  color: rgba(255, 255, 255, 0.5);
  border-color: rgba(255, 255, 255, 0.25);
}
/*searchbar*/
.titlebar > .searchbar {
  background-color: transparent;
}
.titlebar.reverse > .searchbar .input-box {
  border-color: #36acf4;
}
/*----------------titlebar.less(end)----------------*/
/*----------------tabbar.less(start)--------------*/
.rectbar,
.slidebar,
.arrowbar,
.menubar,
.tabbar {
  border-color: #dddddd;
}
.tab:active,
.tab.active {
  color: #36acf4;
}
.rectbar,
.slidebar,
.tabbar {
  color: #666666;
}
.slidebar .tab:active,
.slidebar .tab.active {
  border-color: #36acf4;
}
.menubar {
  color: #888888;
  background-color: #f8f8f8;
}
.menubar.reverse .tab {
  border-color: #36acf4;
}
.arrowbar,
.menubar.reverse {
  color: #ffffff;
  background-color: #36acf4;
}
.arrowbar .tab,
.menubar.reverse .tab {
  opacity: 0.5;
}
.arrowbar .tab:active,
.arrowbar .tab.active,
.menubar.reverse .tab:active,
.menubar.reverse .tab.active {
  color: #ffffff;
  opacity: 1;
}
.arrowbar .tab.active:after {
  border-top-color: #ffffff;
}
.tabbar.animate-slide .tab.active {
  color: #36acf4;
}
.tabbar.animate-slide hr {
  border-color: #36acf4;
}
.tabbar.animate-twoline .tab.active {
  color: #36acf4;
}
.tabbar.animate-twoline .tab::before,
.tabbar.animate-twoline .tab::after {
  background: #36acf4;
}
.tabbar.animate-oneline .tab.active {
  color: #36acf4;
}
.tabbar.animate-oneline .tab::before {
  background: #36acf4;
}
.tabbar.animate-box .tab.active {
  color: #36acf4;
}
.tabbar.animate-box .tab::before,
.tabbar.animate-box .tab::after,
.tabbar.animate-box .tab-label::before,
.tabbar.animate-box .tab-label::after {
  background: #36acf4;
}
.tabbar.animate-bracket .tab.active {
  color: #36acf4;
}
.tabbar.animate-bracket .tab::before,
.tabbar.animate-bracket .tab::after,
.tabbar.animate-bracket .tab-label::before,
.tabbar.animate-bracket .tab-label::after {
  background: #36acf4;
}
/*----------------tabbar.less(end)--------------*/
/*----------------badge.less(start)--------------*/
.tip,
.badge {
  color: #ffffff;
  background-color: #fc4349;
}
.sticker {
  color: #ffffff;
  border-color: #fc4349;
}
.badge.arrow:after {
  border-bottom-color: #fc4349;
}
/*鏍囬灏忔爣璁�*/
.peg {
  background-color: #36acf4;
}
/*灏忕偣鐐�*/
.dot {
  background-color: #36acf4;
}
/*----------------badge.less(end)--------------*/
/*------------------------------button.less(start)------------------------------*/
/*鎸夐挳-鏅�氭寜閽�*/
button,
input[type="button"],
input[type="submit"],
.button {
  color: #ffffff;
  background-color: #36acf4;
}
button.outline,
input[type="button"].outline,
.button.outline {
  color: #36acf4;
  border-color: #36acf4;
  background-color: transparent;
}
button:not(.noclick):active,
input[type="button"]:not(.noclick):active,
.button:not(.noclick):active {
  color: rgba(255, 255, 255, 0.5);
  background-color: rgba(54, 172, 244, 0.5);
}
button.outline:not(.noclick):active,
input[type="button"].outline:not(.noclick):active,
.button.outline:not(.noclick):active {
  color: rgba(54, 172, 244, 0.5);
  border-color: rgba(54, 172, 244, 0.5);
  background-color: transparent;
}
/*鍘昏壊*/
button.grayscale,
input[type="button"].grayscale,
.button.grayscale {
  border-width: 1px;
}
button.grayscale,
input[type="button"].grayscale,
.button.grayscale {
  color: #333333;
  border-color: #dddddd;
  background-color: #f4f4f4;
}
button.grayscale:not(.noclick):active,
input[type="button"].grayscale:not(.noclick):active,
.button.grayscale:not(.noclick):active {
  color: inherit;
  border-color: inherit;
  background-color: transparent;
}
button.outline.grayscale,
input[type="button"].outline.grayscale,
.button.outline.grayscale {
  color: #333333;
  border-color: #dddddd;
  background-color: transparent;
}
button.outline.grayscale:not(.noclick):active,
input[type="button"].outline.grayscale:not(.noclick):active,
.button.outline.grayscale:not(.noclick):active {
  color: inherit;
  border-color: inherit;
  background-color: #f4f4f4;
}
/*鐧借壊*/
button.white,
input[type="button"].white,
.button.white {
  color: #333333;
  background-color: #ffffff;
}
button.white:not(.noclick):active,
input[type="button"].white:not(.noclick):active,
.button.white:not(.noclick):active {
  color: #333333;
  background-color: rgba(255, 255, 255, 0.5);
}
button.outline.white,
input[type="button"].outline.white,
.button.outline.white {
  color: #ffffff;
  border-color: rgba(255, 255, 255, 0.5);
  background-color: transparent;
}
button.outline.white:not(.noclick):active,
input[type="button"].outline.white:not(.noclick):active,
.button.outline.white:not(.noclick):active {
  color: rgba(255, 255, 255, 0.5);
  border-color: rgba(255, 255, 255, 0.5);
  background-color: transparent;
}
/*鎸夐挳-绂佺敤鎸夐挳*/
button.disable,
input[type="button"].disable,
.button.disable,
button[disable],
input[type="button"][disable],
button.disable:not(.noclick):active,
input[type="button"].disable:not(.noclick):active,
.button.disable:not(.noclick):active,
button[disable]:not(.noclick),
input[type="button"][disable]:not(.noclick):active {
  color: #ffffff;
  background-color: #d9d9d9;
}
button.disable.outline,
input[type="button"].disable.outline,
button[disable].outline,
input[type="button"][disable].outline,
.button.disable.outline,
button.disable.outline:not(.noclick):active,
input[type="button"].disable.outline:not(.noclick):active,
button[disable].outline:not(.noclick):active,
input[type="button"][disable].outline:not(.noclick):active,
.button.disable.outline:not(.noclick):active {
  color: #d9d9d9;
  border-color: #d9d9d9;
  background-color: transparent;
}
/*鎸夐挳-鍙栨秷鎸夐挳*/
button.cancel,
input[type="button"].cancel,
.button.cancel {
  background-color: #f86868;
}
button.cancel.outline,
input[type="button"].cancel.outline,
.button.cancel.outline {
  color: #f86868;
  border-color: #f86868;
  background-color: transparent;
}
button.cancel:not(.noclick):active,
input[type="button"].cancel:not(.noclick):active,
.button.cancel:not(.noclick):active {
  background-color: rgba(248, 104, 104, 0.5);
}
button.cancel.outline:not(.noclick):active,
input[type="button"].cancel.outline:not(.noclick):active,
.button.cancel.outline:not(.noclick):active {
  color: rgba(248, 104, 104, 0.5);
  border-color: rgba(248, 104, 104, 0.5);
  background-color: transparent;
}
/*鎸夐挳-鎻愪氦鎸夐挳*/
button.submit,
input[type="submit"],
.button.submit {
  background-color: #d80036;
}
button.submit.outline,
input[type="submit"].outline,
.button.submit.outline {
  color: #88d038;
  border-color: #88d038;
  background-color: transparent;
}
button.submit:not(.noclick):active,
input[type="submit"]:not(.noclick):active,
.button.submit:not(.noclick):active {
  background-color: rgba(136, 208, 56, 0.5);
}
button.submit.outline:not(.noclick):active,
input[type="submit"].outline:not(.noclick):active,
.button.submit.outline:not(.noclick):active {
  color: rgba(136, 208, 56, 0.5);
  border-color: rgba(136, 208, 56, 0.5);
  background-color: transparent;
}
/*鎸夐挳-淇℃伅鎸夐挳*/
button.info,
input[type="button"].info,
.button.info {
  background-color: #5bc0de;
}
button.info.outline,
input[type="button"].info.outline,
.button.info.outline {
  color: #5bc0de;
  border-color: #5bc0de;
  background-color: transparent;
}
button.info:not(.noclick):active,
input[type="button"].info:not(.noclick):active,
.button.info:not(.noclick):active {
  background-color: rgba(91, 192, 222, 0.5);
}
button.info.outline:not(.noclick):active,
input[type="button"].info.outline:not(.noclick):active,
.button.info.outline:not(.noclick):active {
  color: rgba(91, 192, 222, 0.5);
  border-color: rgba(91, 192, 222, 0.5);
  background-color: transparent;
}
/*鎸夐挳-璀﹀憡鎸夐挳*/
button.warn,
input[type="button"].warn,
.button.warn {
  background-color: #f4984e;
}
button.warn.outline,
input[type="button"].warn.outline,
.button.warn.outline {
  color: #f4984e;
  border-color: #f4984e;
  background-color: transparent;
}
button.warn:active,
input[type="button"].warn:active,
.button.warn:active {
  background-color: rgba(244, 152, 78, 0.5);
}
button.warn.outline:not(.noclick):active,
input[type="button"].warn.outline:not(.noclick):active,
.button.warn.outline:not(.noclick):active {
  color: rgba(244, 152, 78, 0.5);
  border-color: rgba(244, 152, 78, 0.5);
  background-color: transparent;
}
/*鎸夐挳-瀹屾垚鎸夐挳*/
button.success,
input[type="button"].success,
.button.success {
  background-color: #4ddb63;
}
button.success.outline,
input[type="button"].success.outline,
.button.success.outline {
  color: #4ddb63;
  border-color: #4ddb63;
  background-color: transparent;
}
button.success:not(.noclick):active,
input[type="button"].success:not(.noclick):active,
.button.success:not(.noclick):active {
  background-color: rgba(77, 219, 99, 0.5);
}
button.success.outline:not(.noclick):active,
input[type="button"].success.outline:not(.noclick):active,
.button.success.outline:not(.noclick):active {
  color: rgba(77, 219, 99, 0.5);
  border-color: rgba(77, 219, 99, 0.5);
  background-color: transparent;
}
/*鎸夐挳-姘旀场*/
button:not(.outline) .tip,
input[type="button"]:not(.outline) .tip,
.button:not(.outline) .tip,
button:not(.outline) .badge,
input[type="button"]:not(.outline) .badge,
.button:not(.outline) .badge {
  color: #ffffff;
  background-color: rgba(0, 0, 0, 0.15);
}
/*鎸夐挳-鎶曞奖鍥炬爣*/
button.shadow:not(.noclick):active,
.button.shadow:not(.noclick):active,
input[type="button"].shadow:not(.noclick):active {
  -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2);
  box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2);
  margin: 2px 0 -2px 0;
}
/*------------------------------button.less(end)------------------------------*/
/*----------------------------buttongroup.less(start)------------------------------*/
.button-group > span {
  border-color: #dddddd;
  background-color: #ffffff;
}
/*婵�娲荤姸鎬�*/
.button-group > span:not(.disable).active,
.button-group > span:not(.disable):active {
  color: #36acf4;
  background-color: #ffffff;
}
/*绂佺敤鐘舵��*/
.button-group > .disable {
  color: #aaaaaa;
}
/*澶氬僵鏍囩鎸夐挳*/
.mark-info,
.mark-success,
.mark-cancel,
.mark-warn,
.mark-disable,
.mark-primary {
  color: #ffffff;
}
.mark-disable {
  background-color: #d9d9d9;
}
.mark-info {
  background-color: #5bc0de;
  width:2rem;
}
.mark-success {
  background-color: #4ddb63;
}
.mark-cancel {
  background-color: #f86868;
}
.mark-warn {
  background-color: #f4984e;
}
.mark-primary {
  background-color: #36acf4;
}
/*------------------------------buttongroup.less(end)------------------------------*/
/*----------------popup.less.less(start)--------------*/
/*pop-box*/
.popup {
  border-color: #dddddd;
}
/*pop-閬僵*/
.popup-mask {
  background-color: rgba(0, 0, 0, 0.4);
}
/*actionsheet*/
.actionsheet button {
  color: #007aff;
  border-bottom-color: #dddddd;
  background-color: rgba(255, 255, 255, 0.9);
}
/*toast妗�*/
.popup-toast {
  background-color: rgba(0, 0, 0, 0.6);
}
/*----------------popup.less.less(end)--------------*/
/*----------------form.less(start)--------------*/
input[type="text"],
input[type="password"],
input[type="search"],
input[type="file"],
input[type="number"],
input[type="tel"],
input[type="email"],
input[type="url"],
input[type="date"],
input[type="month"],
input[type="week"],
input[type="datetime-local"],
input[type="datetime"],
input[type="time"],
keygen,
input[list],
textarea,
select,
.input-text {
  border-color: #dddddd;
  background-color: #ffffff;
}
.input-box {
  background-color: #ffffff;
  border-color: #dddddd;
}
.input-box input:not([type="button"]):not([type="radio"]):not([type="checkbox"]),
.input-box select,
.input-box keygen,
.input-box textarea,
.input-box .input-text {
  background-color: transparent;
}
/*----------------form.less(end)--------------*/
/*----------------inputbox.less(start)--------------*/
.input-box {
  border-color: #dddddd;
}
.input-box.click .icon:active,
.input-box .icon.click:active,
.input-box .icon.active {
  color: #36acf4;
}
.input-box.required {
  border-color: #e7eabd;
  background-color: #faffbd;
}
.input-box.required input {
  background-color: transparent;
}
.input-box.reverse {
  color: #ffffff;
  border-color: #36acf4;
  background-color: #36acf4;
}
.input-box.reverse input,
.input-box.reverse input::-webkit-input-placeholder {
  color: #ffffff;
}
/*----------------inputbox.less(end)--------------*/
/*----------------dragrefresh.less(start)--------------*/
.dragrefresh {
  color: #36acf4;
}
.dragrefresh svg path {
  fill: #36acf4;
}
/*----------------dragrefresh.less(end)--------------*/
/*----------------clock.less(start)--------------*/
.clock {
  border-color: #36acf4;
}
.clock .origin,
.clock .hour,
.clock .minute {
  background-color: #36acf4;
}
.clock.color-1 {
  border-color: #53c6fd;
}
.clock.color-1 .origin,
.clock.color-1 .hour,
.clock.color-1 .minute {
  background-color: #53c6fd;
}
.clock.color-2 {
  border-color: #ffae02;
}
.clock.color-2 .origin,
.clock.color-2 .hour,
.clock.color-2 .minute {
  background-color: #ffae02;
}
.clock.color-3 {
  border-color: #3ae3ea;
}
.clock.color-3 .origin,
.clock.color-3 .hour,
.clock.color-3 .minute {
  background-color: #3ae3ea;
}
.clock.color-4 {
  border-color: #ff6f36;
}
.clock.color-4 .origin,
.clock.color-4 .hour,
.clock.color-4 .minute {
  background-color: #ff6f36;
}
.clock.color-5 {
  border-color: #cf7af3;
}
.clock.color-5 .origin,
.clock.color-5 .hour,
.clock.color-5 .minute {
  background-color: #cf7af3;
}
.clock.color-6 {
  border-color: #4cd32e;
}
.clock.color-6 .origin,
.clock.color-6 .hour,
.clock.color-6 .minute {
  background-color: #4cd32e;
}
.clock.color-7 {
  border-color: #4587f7;
}
.clock.color-7 .origin,
.clock.color-7 .hour,
.clock.color-7 .minute {
  background-color: #4587f7;
}
.clock.color-8 {
  border-color: #00c2eb;
}
.clock.color-8 .origin,
.clock.color-8 .hour,
.clock.color-8 .minute {
  background-color: #00c2eb;
}
.clock.color-9 {
  border-color: #ff618f;
}
.clock.color-9 .origin,
.clock.color-9 .hour,
.clock.color-9 .minute {
  background-color: #ff618f;
}
.clock.color-10 {
  border-color: #21d9a1;
}
.clock.color-10 .origin,
.clock.color-10 .hour,
.clock.color-10 .minute {
  background-color: #21d9a1;
}
/*----------------clock.less(end)--------------*/
/*----------------row.less(start)--------------*/
.row,
.group,
.card {
  border-color: #dddddd;
}
/*----------------row.less(end)--------------*/
/*----------------card.less(start)--------------*/
.card-handler > a {
  color: #aaaaaa;
  border-color: #dddddd;
}
.card-info {
  color: #aaaaaa;
}
/*----------------card.less(end)--------------*/
/*----------------range.less(start)--------------*/
input[type=range] {
  background-color: #dddddd;
}
input[type=range]::-webkit-slider-thumb {
  background-color: #36acf4;
  border-color: red;
}
/*----------------range.less(end)--------------*/
/*----------------inputcolor.less(start)--------------*/
::-webkit-color-swatch-wrapper {
  border-color: #dddddd;
}
/*----------------inputcolor.less(end)--------------*/
/*----------------progress.less(end)--------------*/
progress {
  color: #dddddd;
  /*IE10*/
  border-color: #dddddd;
  background-color: transparent;
}
progress::-moz-progress-bar {
  background: #36acf4;
}
progress::-webkit-progress-bar {
  background: transparent;
}
progress::-webkit-progress-value {
  background-color: #36acf4;
}
.progress-bar {
  color: white;
  background-color: #cccccc;
}
.progress {
  background-color: #36acf4;
}
/*----------------progress.less(end)--------------*/
/*-----------------------------checkbox.less(start)-----------------------------*/
input[type="checkbox"],

.checkbox,
.radio {
  color: #aaaaaa;
}
input[type="checkbox"]:checked,
input[type="radio"]:checked,
.checkbox.active,
.radio.active {
  color: #36acf4;
}
input[type="checkbox"][disabled],
input[type="checkbox"][disabled]:checked,
.checkbox.active.disabled,
.radio.active.disabled,
.checkbox.disabled,
.radio.disabled {
  color: #d9d9d9;
}
/*-----------------------------checkbox.less(end)-----------------------------*/
/*----------------richedit.less(start)--------------*/
.richedit .emoji {
  background-color: #f4f4f4;
}
.richedit figcaption {
  border-color: #dddddd;
}
.richedit .input {
  border-color: #dddddd;
}
.richedit .input:before,
.richedit .input:after {
  background-color: #dddddd;
}
.richedit.active .input {
  border-color: #36acf4;
}
.richedit.active .input:before,
.richedit.active .input:after {
  background-color: #36acf4;
}
/*----------------richedit.less(end)--------------*/
/*----------------switch.less(start)--------------*/
/*鍏抽棴鐘舵��*/
.switch {
  border-color: #dddddd;
}
/*鍏抽棴鐘舵�佸渾鐐�*/
.switch .switch-handle {
  background-color: #dddddd;
}
/*鍏抽棴鐘舵�佹枃瀛梠ff*/
.switch:after {
  color: #aaaaaa;
}
/*鎵撳紑鐘舵�佸皬鍦嗙偣*/
.switch.active .switch-handle {
  background-color: #36acf4;
}
/*鎵撳紑鐘舵�佹枃瀛梠n*/
.switch.active:after {
  color: #aaaaaa;
}
/*寮�鍏虫帶浠秚oggle-鍙嶈浆*/
.switch.reverse {
  background-color: #dddddd;
}
.switch.reverse:after {
  color: #aaaaaa;
}
.switch.reverse.active {
  background-color: #36acf4;
}
/*----------------toggle.less(end)--------------*/
/*----------------grid.less(start)--------------*/
.grid li > label {
  color: #666666;
}
/*杈规*/
.grid.border {
  border-color: #dddddd;
}
/*----------------grid.less(end)----------------*/
/*----------------photo.less(start)----------------*/
.photo,
.default {
  background-color: #dddddd;
}
.photo {
  color: #ffffff;
}
.default {
  color: #cccccc;
}
.photo.border {
  color: #666666;
  background-color: white;
}
/*----------------photo.less(end)----------------*/
/*----------------------------list.less(start)----------------------------*/
.list,
.timeline {
  border-color: #dddddd;
}
.list li {
  background-color: #ffffff;
}
.list:not(.noclick) li:active {
  background-color: #f4f4f4;
}
.list li.noclick:active {
  background-color: #ffffff;
}
.list.bg-transparent li,
.list li.bg-transparent {
  background-color: transparent;
}
.star {
  color: #aaaaaa;
}
.star.active {
  color: #f4984e;
}
.star.active-half {
  /* Chrome10-25,Safari5.1-6 */
  background-image: -webkit-linear-gradient(left, #f4984e 0%, #f4984e 50%, #aaaaaa 51%, #aaaaaa 100%);
  /*W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+*/
  background-image: -webkit-linear-gradient(to right, #f4984e 0%, #f4984e 50%, #aaaaaa 51%, #aaaaaa 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
/*----------------------------list.less(end)----------------------------*/
/*----------------------------title.less(start)----------------------------*/
.sliver,
li.sliver,
.title {
  border-color: #FFFFFF;
}
.sliver,
li.sliver {
  color: #F5F5F5;
  background-color: #f4f4f4;
}
/*----------------------------title.less(end)----------------------------*/
/*----------------------------statusbar.less(start)----------------------------*/
.statusbar {
  background-color: #dddddd;
}
/*----------------------------statusbar.less(end)----------------------------*/
/*----------------------------searchbar.less(start)----------------------------*/
.searchbar {
  background-color: #dddddd;
}
/*----------------------------searchbar.less(end)----------------------------*/
/*-----------------------------loading.less(start)-----------------------------*/
.loading {
  box-shadow: inset 0 0 0 4px #36acf4;
}
.loading-more .loading {
  box-shadow: inset 0 0 0 3px #36acf4;
}
.loading-more,
.loading-more .loading:before,
.loading-more .loading:after {
  background: #f4f4f4;
}
/*-----------------------------loading.less(end)-----------------------------*/
/*-----------------------------calendar.less(start)-----------------------------*/
.calendar {
  border-color: #dddddd;
}
.day-name {
  color: #666666;
}
.day-date .today:not(.active) {
  color: #36acf4;
}
.day-date .active {
  background-color: #36acf4;
}
.arrowleft,
.arrowright {
  color: #dddddd;
}
.arrowleft:active,
.arrowright:active {
  color: #36acf4;
}
.not-this-month {
  color: #dddddd;
}
/*-----------------------------calendar.less(end)-----------------------------*/
/*----------------------------chat.less(start)----------------------------*/
.chat .author i {
  color: #aaaaaa;
}
.chat .content {
  background-color: #dddddd;
}
.chat .content:after {
  border-right-color: #dddddd;
}
.chat .even .content {
  background-color: #b8daff;
}
.chat .even .content:after {
  border-left-color: #b8daff;
}
/*----------------------------chat.less(end)----------------------------*/
/*---------------table.less(start)---------------*/
table {
  color: #888888;
  border-color: #dddddd;
}
/*---------------table.less(end)---------------*/
/*---------------tree.less(start)---------------*/
table {
  color: #888888;
  border-color: #dddddd;
}
/*---------------tree.less(end)---------------*/
.treetitle .radiusround {
  background-color: #ffae02;
  color: #ffffff;
}
.treetitle .treeicon:not(.radiusround),
.treetitle .right {
  color: #aaaaaa;
}
/*----------------layout.less(start)--------------*/
.underline {
  border-color: #dddddd;
}
/*----------------layout.less(end)--------------*/
/*----------------theme.less(start)--------------*/
/*鎺т欢棰滆壊*/
.color-primary {
  color: #36acf4;
}
.color-placeholder {
  color: #aaaaaa;
}
.color-disable {
  color: #d9d9d9;
}
.color-submit {
  color: #88d038;
}
.color-cancel {
  color: #f86868;
}
.color-success {
  color: #4ddb63;
}
.color-info {
  color: #5bc0de;
}
.color-warn {
  color: #f4984e;
}
.color-tip {
  color: #fc4349;
}
/*闅忔満棰滆壊*/
.color-white {
  color: white;
}
.color-default {
  color: #333333;
}
.color-1 {
  color: #53c6fd;
}
.color-2 {
  color: #ffae02;
}
.color-3 {
  color: #3ae3ea;
}
.color-4 {
  color: #ff6f36;
}
.color-5 {
  color: #cf7af3;
}
.color-6 {
  color: #4cd32e;
}
.color-7 {
  color: #4587f7;
}
.color-8 {
  color: #00c2eb;
}
.color-9 {
  color: #ff618f;
}
.color-10 {
  color: #21d9a1;
}
/*鑳屾櫙棰滆壊*/
.bg-transparent {
  background-color: transparent;
}
.bg-primary {
  background-color: #36acf4;
}
.bg-white {
  background-color: white;
}
.bg-default {
  background-color: #f4f4f4;
}
.bg-disable {
  background-color: #d9d9d9;
}
.bg-submit {
  background-color: #88d038;
}
.bg-cancel {
  background-color: #f86868;
}
.bg-success {
  background-color: #4ddb63;
}
.bg-info {
  background-color: #5bc0de;
}
.bg-warn {
  background-color: #f4984e;
}
.bg-tip {
  background-color: #fc4349;
}
.bg-primary,
.bg-default,
.bg-disable,
.bg-submit,
.bg-cancel,
.bg-success,
.bg-info,
.bg-warn,
.bg-tip,
.bg-1,
.bg-2,
.bg-3,
.bg-4,
.bg-5,
.bg-6,
.bg-7,
.bg-8,
.bg-9,
.bg-10 {
  color: white;
}
.bg-1 {
  background-color: #53c6fd;
}
.bg-2 {
  background-color: #ffae02;
}
.bg-3 {
  background-color: #3ae3ea;
}
.bg-4 {
  background-color: #ff6f36;
}
.bg-5 {
  background-color: #cf7af3;
}
.bg-6 {
  background-color: #4cd32e;
}
.bg-7 {
  background-color: #4587f7;
}
.bg-8 {
  background-color: #00c2eb;
}
.bg-9 {
  background-color: #ff618f;
}
.bg-10 {
  background-color: #21d9a1;
}
/*----------------theme.less(end)--------------*/

</style>
</head>
<body>
	<script>

</script>
	<div>
		<div class="titlebar">
			<h1>发货单</h1>
		</div>
	</div>
	<div class="body">
		<ul class="list">
			<li class="nojustify">
				<div class="justify-content">
					<div class="row">
						<%
					Object objectdetaillist =  request.getAttribute("orderdetail");
					List<Object> orderdetail = (List<Object>)objectdetaillist;
					Tbl_user user = (Tbl_user)orderdetail.get(0);
					Tbl_order order = (Tbl_order)orderdetail.get(1);
					Date date = order.getOrder_date();
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
					String orderdate=sdf.format(date);
					String username = user.getUser_name();
					double totalprice = order.getOrder_price();
					String usertelnum = user.getUser_tel_num();
					String useraddr = user.getUser_addr();
		 %>
						<label for="consigneetel" id="consigneetel">收货人电话：<%=usertelnum %></label>
						<br> <label for="ordertime" id="ordertime">下单时间：<%=orderdate %></label>
						<br> <label for="address" id="address">收货人地址：<%=useraddr %></label>
						<br> <label for="name" id="name">发件人姓名：<%=username %></label>
						<br>
					</div>
				</div>
			</li>
		</ul>
		<table>
			<tr>
				<td>商品名</td>
				<td>商品ID</td>
				<td>商品价格</td>
				<td>商品数量</td>
				<td>换货</td>
			</tr>
			<%
			    	Object objectordergoodsdetaillist =  request.getAttribute("ordergoodsdetail");
			    	List<List<Object>> list = (List<List<Object>>)objectordergoodsdetaillist;
			    	for(int i=0;i<list.size();i++){
			    		List<Object> list2 = (List<Object>)list.get(i);
			    		Tbl_commodity commodity = (Tbl_commodity)list2.get(0);
			    		Tbl_order_detail detail = (Tbl_order_detail)list2.get(1);
			    		String goodsid = detail.getGoods_id();
			    		String goodsname = commodity.getGoods_name();
			    		double singleprice = commodity.getGoods_price();
			    		int count = detail.getGoods_number();
			    		double goodstotalprice = singleprice * count;
			    %>
			<tr>
				<td><%=goodsname %></td>
				<td><%=goodsid %></td>
				<td><%=singleprice %></td>
				<td><%=count %></td>
				<td>□</td>

			</tr>
			<%
			    }
			    %>

		</table>
		<div style="margin-top:10px;float:right;margin-right:20px;">
		<label>总价：<%=totalprice %></label><br>
		<p>请核实订单信息</p>
		<p>如订单有误，请及时联系客服进行退换货处理</p>
		<p>客服电话 4006898199</p>
		</div>
	</div>
</body>
</html>
