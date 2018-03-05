<?php
	$db=mysqli_connect('localhost','root','2014zxm','user');
	if($frm_action == 'check')   
	{   
	  $gradeName = $_GET['name'];   
	  $gradeAdminObj = new Services_GradeAdmin($db);   
	  //根据$gradeName去判断是否再数据库里存在填入的用户名字，如果存在返回1，如果   
	不存在返回0，这个返回值是传到grade.js里。   
	  $gradeCheck = $gradeAdminObj->getGradeByName($gradeName);   
	  if(is_numeric($gradeCheck)){   
	   echo '1';   
	  }else{   
	   echo '0';   
	  }   
	  exit();   
	}
?>