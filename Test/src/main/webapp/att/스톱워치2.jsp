<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<script>
	let time = 0; 
	let starFlag = true; // startŬ���� false
	$(document).ready(function(){
	  buttonEvt();
	});
	
	function init(){
		$("#time").text("00:00:00");
	}
	
	function buttonEvt(){
		let hour = 0; //��
		let min = 0;  //��
		let sec = 0;  //��
		let timer; // setInterval()
	
	  // start btn
	  $("#startbtn").click(function(){
	
	    if(starFlag){
	      starFlag = false;
	      if(time == 0){ //time�� 0�̸� �ð� �ʱ�ȭ
	        init(); 
	      }
	
	      timer = setInterval(function(){
	        time++;
	        
	      //Math.floor()�׻� �����ϰ� �־��� ���ں��� �۰ų� ���� ���� ū ������ ��ȯ�մϴ�.
	                                   //time = 1(1��)  60(1��)   3600(1�ð�)
	        min = Math.floor(time/60); //       0         1       60
	        hour = Math.floor(min/60);//        0         0        1
	        sec = time%60;            //        1         0        0
	        min = min%60;             //        0         1        0
	
	        
	        // �� �� �� �� 1�� �ڸ��϶� �ι�°�ڸ��� 0 �� �ٴ´�. 01 : 02 : 13
	        let th = hour;
	        let tm = min;
	        let ts = sec;
	        if(th<10){
	        th = "0" + hour;
	        }
	        if(tm < 10){
	        tm = "0" + min;
	        }
	        if(ts < 10){
	        ts = "0" + sec;
	        }
	       
	        $("#time").text(th + ":" + tm + ":" + ts);
	        
	      }, 1000);
	    }
	  });
	
	  // ���⶧
	  $("#pausebtn").click(function(){
	    if(time != 0){
	      clearInterval(timer);
	      starFlag = true;
	    }
	  });
	
	  // �����Ҷ�
	  $("#stopbtn").click(function(){
	    if(time != 0){
	      clearInterval(timer);
	      starFlag = true;
	      time = 0;
	      init();
	    }
	  });
	}

</script>
</head>
<body>
	<div id="time" class="time">00:00:00</div>
	<button type="button" id="startbtn" class="fa fa-play" aria-hidden="true"></button> 
	<button type="button" id="pausebtn" class="fa fa-pause" aria-hidden="true"></button>
	<button type="button" id="stopbtn" class="fa fa-stop" aria-hidden="true"></button>
</body>
</html>