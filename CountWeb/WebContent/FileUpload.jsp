<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>词频统计</title>
<!-- 时间的显示 -->

<script language="javascript" type="text/javascript">

  window.onload = function(){
    showTime();     //网页一加载就调用showTime()函数；
  }
  function checkTime(i){  //补位处理
    if(i<10)  
    {
       i="0"+i;     //当秒分小于10时，在左边补0；
    }
    return i;
  }
  function showTime(){
    var now=new Date();
    var year=now.getFullYear();
    var month=now.getMonth()+1; //js获取的月份是从0开始；
    var day=now.getDate();
    var h=now.getHours();
    var m=now.getMinutes();
    var s=now.getSeconds();
    m=checkTime(m)
    s=checkTime(s)

    var weekday=new Array(7)
    weekday[0]="星期日"
    weekday[1]="星期一"
    weekday[2]="星期二"
    weekday[3]="星期三"
    weekday[4]="星期四"
    weekday[5]="星期五"
    weekday[6]="星期六"
    var w=weekday[now.getDay()]; //js获取的星期是0~6,0是星期天；
    document.getElementById("show").innerHTML=""+year+"年"+month+"月"+day+"日 "+w+"  "+h+":"+m+":"+s;
    t=setTimeout('showTime()',500)
  }
</script>
<!--时分秒的显示-->
 <script>
    var hour,minute,second;//时 分 秒
    hour=minute=second=0;//初始化
    var millisecond=0;//毫秒
    var int;
    function Reset()//重置
    {
      window.clearInterval(int);
      millisecond=hour=minute=second=0;
      document.getElementById('timetext').value='00时00分00秒000毫秒';
    }
   
    function start()//开始
    {
      int=setInterval(timer,50);
    }
   
    function timer()//计时
    {
      millisecond=millisecond+50;
      if(millisecond>=1000)
      {
        millisecond=0;
        second=second+1;
      }
      if(second>=60)
      {
        second=0;
        minute=minute+1;
      }
   
      if(minute>=60)
      {
        minute=0;
        hour=hour+1;
      }
      document.getElementById('timetext').value=hour+'时'+minute+'分'+second+'秒'+millisecond+'毫秒';
   
    }
   
    function stop()//暂停
    {
      window.clearInterval(int);
    }
  </script>
  
<style type="text/css">
body {
   background:#fff url(1.jpg)  no-repeat left top;
   background-size:100%;
   }
  .luli{
   	margin-top: 40px;
   	margin-left: 120px;
   }
   #show{
   	margin-top: 20px;
   	margin-left: 600px;
   }
</style>
</head>
	<body>
	<div id="show" class="show" style="color:blue">显示时间的位置</div>
	<table align="center"class="luli">
	<tr>
		<td>	
	<form method="post" action="CountWeb/UploadServlet"enctype="multipart/form-data">
	<fieldset>
	<legend>英文词频统计</legend>
	<table border="1" cellspacing="5" width="600">
		<colgroup align="right"></colgroup>
	<tr>
       <td>选择一个文件</td>
       <td><input type="file" name="uploadFile" /> (请选择TXT文件)</td>
      </tr>
    <tr>
       <td>统计行数</td>
       <td>自定义分隔符: <input type="text" name="synstr" value="" /></td>
     </tr>	
     <tr>
       <td>上传文件</td>
       <td><input type="submit" value="上传" /></td>
     </tr>
       <tr>
       <td>时间统计</td>
       <td><div style="text-align: center">
  <input type="text" id="timetext" value="00时00分00秒" readonly>
  <button type="button" onclick="start()">开始</button> <button type="button" onclick="stop()">暂停</button> <button type="button" onclick="Reset()">重置</button>
</div></td>
     </tr>    			
	</table>
	</fieldset>
	</form>
	</td>
	</tr>
	</table>
	</body>
</html>