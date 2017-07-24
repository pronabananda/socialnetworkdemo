var xmlhttp;

var nm;





function loadProductName(str)
{
// str = document.getElementById("division").value;
 var activity, segments, categories, product;
 
 activity = document.getElementById("activity").value;
 //segments = document.getElementById("segments").value;
 categories = document.getElementById("categories").value;
// product = document.getElementById("product").value;
 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    //url ="response.jsp?key=productname&val=1&activity=" + activity + "&segments=" + segments + "&categories=" + categories + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=productname&val=1&activity=" + activity + "&categories=" + categories + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=getProduct;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getProduct()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("load_product").innerHTML=xmlhttp.responseText;
  }
}



function loadThanaNames()
{
// str = document.getElementById("division").value;
//To save the name of the District
var w = document.aspnetForm.ddlHomeDistrict.selectedIndex;
var selected_text = document.aspnetForm.ddlHomeDistrict.options[w].text;
document.aspnetForm.selected_District.value=selected_text;
/////-----------------------------/////
 var districtID;
 districtID = document.getElementById("ddlHomeDistrict").value;

 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }
 // alert ("Populationg thana names..");
 // alert("districtID");
    url ="jsp/thana.jsp?dist=" + districtID + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=getThanas;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getThanas()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("load_Upazila").innerHTML=xmlhttp.responseText;
  }
}


function loadSegmentName(str)
{
// str = document.getElementById("division").value;
 var activity, segments, categories, product;
 
 activity = document.getElementById("activity").value;
// segments = document.getElementById("segments").value;
// categories = document.getElementById("categories").value;
// product = document.getElementById("product").value;
 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=segmentname&val=1&activity=" + activity + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=getOutputSegment;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutputSegment()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("load_segments").innerHTML=xmlhttp.responseText;
  }
}


function load_dbranch(str)
{
// str = document.getElementById("division").value;
	//var activity, segments, categories, product;
 
	var dbranch;   
	
	dbranch = document.getElementById("dpoint").value;
 // alert(dbranch); 
 //activity = document.getElementById("activity").value;
// segments = document.getElementById("segments").value;
// categories = document.getElementById("categories").value;
// product = document.getElementById("product").value;
 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)  
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=dbranch&val=1&dbranch=" + dbranch + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=load_dbranchOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function load_dbranchOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_dbranch").innerHTML=xmlhttp.responseText;
  }
}


function load_taskflow(str)
{
// str = document.getElementById("division").value;
	//var activity, segments, categories, product;
 
	var taskflow;   
	
	taskflow = document.getElementById("task").value;
	//alert(taskflow); 
 // alert(dbranch); 
 //activity = document.getElementById("activity").value;
// segments = document.getElementById("segments").value;
// categories = document.getElementById("categories").value;
// product = document.getElementById("product").value;
 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)    
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }
   
    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    url ="taskflow.jsp?taskflow=" + taskflow + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=load_taskflowOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function load_taskflowOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_task_flow").innerHTML=xmlhttp.responseText;
  }
}



function delete_taskflowTemp(str)
{

	var logid;   
	logid = str;

 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)    
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }
   
    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=delete_taskflowTemp&logid=" + logid + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=delete_taskflowTempOutput;
    xmlhttp.open("GET",url,false);
    xmlhttp.send(null);
}

function delete_taskflowTempOutput() 
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_save_status").innerHTML=xmlhttp.responseText;
  }
}

function insert_taskflowTemp(logid, task_id, dept, detail, sl, branch)
{

	/*var logid;   
	logid = str;
	*/
 var str="0";
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)    
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }
   
    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=insert_taskflowTemp&logid=" + logid + "&task_id=" + task_id + "&dept=" + dept + "&detail=" + detail + "&sl=" + sl + "&branch=" + branch + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=insert_taskflowTempOutput;
    xmlhttp.open("GET",url,false);
    xmlhttp.send(null);
}

function insert_taskflowTempOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_save_status").innerHTML=xmlhttp.responseText;
  }
}



function loadTaskViewSpan(pagenum,fdate, tdate, criticality, callback, cif, cusname, reportedby, contact, 
		acno, tpin, log_state, assigned,
		did, branch_code,  activity, categories, product, task)
{
	
	xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    
    //var pageno = document.getElementById("assignedpage").value;
    
    //url=url+"?q="+str;
    //url ="assignmentprocess.jsp?pageno=" + pageno + "&fdate=" + fdate + "&tdate=" + tdate + "&criticality=" + criticality + "&callback=" + callback + "&idn=" + Math.random() * 100;
    //alert(url);
    
    url ="taskview.jsp?pagenum=" + pagenum + "&fdate=" + fdate + "&tdate=" + tdate + "&criticality=" + criticality +
    	"&reportedby=" + reportedby + "&callback=" + callback +"&cif=" + cif + "&cusname=" + cusname +
    	"&contact=" + contact +"&acno=" + acno + "&tpin=" + tpin +
    	"&log_state="+ log_state +"&assigned=" + assigned +
    	"&did=" + did +"&branch_code=" + branch_code + "&activity=" + activity +
    	"&categories="  + categories +  "&product=" + product +
    	"&task=" + task + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=loadTaskViewSpanOutput;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function loadTaskViewSpanOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("span_taskview").innerHTML=xmlhttp.responseText;
	  }
}



function loadTaskname(str)
{
// str = document.getElementById("division").value;
 var activity, segments, categories, product;
 
 activity = document.getElementById("activity").value;
 //segments = document.getElementById("segments").value;
 categories = document.getElementById("categories").value;
 product = document.getElementById("product").value;
 
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
//    url ="response.jsp?key=taskname&val=" + str + "&idn=" + Math.random() * 100;
    //url ="response.jsp?key=taskname&val=1&activity=" + activity + "&segments=" + segments + "&categories=" + categories + "&product=" + product + "&idn=" + Math.random() * 100;
    url ="response.jsp?key=taskname&val=1&activity=" + activity + "&categories=" + categories + "&product=" + product + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function loadContent1(str)
{

 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function loadContentTime()
{
	var str = "123";
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
    url ="response.jsp?key=entrytime&val=" + str + "&idn=" + Math.random() * 100;
    xmlhttp.onreadystatechange=getTime;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
    
    //loadContentLog();
}

function loadContentLog()
{
	var str = "123";
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
    url ="response.jsp?key=log&val=" + str + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=getLog;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function loadQuestion()
{
	var str = document.getElementById("task").value;
	if(str == "") return;
 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    url=url+"?q="+str;
    url ="response.jsp?key=ques&val=" + str + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=getQuestion;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function loadPendingList(fdate, tdate,criticality, callback)
{
	//var str = document.getElementById("division").value;
//	if(str == "") return;
	xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    var pageno = document.getElementById("pendingpage").value;
    
    //url=url+"?q="+str;
    url ="tst.jsp?pageno=" + pageno + "&fdate=" + fdate + "&tdate=" + tdate + "&criticality=" + criticality + "&callback=" + callback + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=getPendingOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}


function getPendingOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("loadPending").innerHTML=xmlhttp.responseText;
	  }
}

function loadAssignmentList(fdate, tdate,criticality, callback)
{
	//var str = document.getElementById("division").value;
//	if(str == "") return;
	xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    
    var pageno = document.getElementById("assignedpage").value;
    
    //url=url+"?q="+str;
    url ="assignmentprocess.jsp?pageno=" + pageno + "&fdate=" + fdate + "&tdate=" + tdate + "&criticality=" + criticality + "&callback=" + callback + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=getAssignmentOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getAssignmentOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("loadassigned").innerHTML=xmlhttp.responseText;
	  }
}





function loadOutboundList(fdate, tdate, criticality, callback)
{
	//var str = document.getElementById("division").value;
//	if(str == "") return;
	xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="loadJSP.jsp";
    
    var pageno = document.getElementById("outboundpage").value;
    
    //url=url+"?q="+str;
    url ="outboundlist.jsp?pageno=" + pageno + "&fdate=" + fdate + "&tdate=" + tdate + "&criticality=" + criticality +"&callback=" + callback + "&idn=" + Math.random() * 100;
    //alert(url);
    xmlhttp.onreadystatechange=getOutboundOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutboundOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("loadoutbound").innerHTML=xmlhttp.responseText;
	  }
}


function assignmentProcess(procStatus, txtuserid, log_sequence, procRem, cnt)
{
		xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	nm = "span" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	    /*var log_sequence = document.getElementById("LOG_SEQUENCE" + cnt).value;
	    var txtuserid = document.getElementById("txtuserid" + cnt).value;
	    var rej	= document.getElementById("rej" + cnt).value;
	    var reason = "Nil";*/
	    
	   /* if(rej == "Y")
	    {
	    	reason = document.getElementById("reason" + cnt).value;
	    }
	    
	    if (txtuserid == "")
    	{
	    	document.getElementById(nm).innerHTML="<font color=red>You must select User</font>";
	    	return;
    	}*/
	    
	    
	    url ="pendingprocess.jsp?tran_type=A&log_sequence=" + log_sequence + "&txtuserid=" + txtuserid + "&procStatus=" + procStatus + "&procRem=" + procRem + "&idn=" + Math.random() * 100;
	    //alert(url);
	    xmlhttp.onreadystatechange=assignmentProcessOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function assignmentProcessOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById(nm).innerHTML=xmlhttp.responseText;
	  }
}



function assignerProcess(aprocstatus,agentremarks, logid,cnt)
{
		xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	nm = "aspan" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	    /*var log_sequence = document.getElementById("aLOG_SEQUENCE" + cnt).value;
	    var txtuserid = document.getElementById("atxtuserid" + cnt).value;
	    var agentremarks = document.getElementById("agentremarks" + cnt).value;
	    var tran_type = "";*/
	    //var tranuserid = "";
	    
	  
	    url ="assignerprocess.jsp?aprocstatus=" + aprocstatus + "&agentremarks=" + agentremarks + "&logid=" + logid +  "&idn=" + Math.random() * 100 ;
	    //alert(url);
	    xmlhttp.onreadystatechange=assignerProcessOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function assignerProcessOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById(nm).innerHTML=xmlhttp.responseText;
	  }
}


function outboundProcess(aprocstatus,agentremarks, logid,cnt)
{
		xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	nm = "aspanO" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	    /*var log_sequence = document.getElementById("aLOG_SEQUENCE" + cnt).value;
	    var txtuserid = document.getElementById("atxtuserid" + cnt).value;
	    var agentremarks = document.getElementById("agentremarks" + cnt).value;
	    var tran_type = "";*/
	    //var tranuserid = "";
	    
	  
	    url ="outboundprocess.jsp?aprocstatus=" + aprocstatus + "&agentremarks=" + agentremarks + "&logid=" + logid +  "&idn=" + Math.random() * 100 ;
	    //alert(url);
	    xmlhttp.onreadystatechange=outboundProcessOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function outboundProcessOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById(nm).innerHTML=xmlhttp.responseText;
	  }
}




//str = document.getElementById("division").value;	
//url="response.jsp?key=taskname&val=" + str + "&idn=" + Math.ceil( Math.random() * 100);

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("task_load").innerHTML=xmlhttp.responseText;
  }
}

function getLog()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_logid").innerHTML=xmlhttp.responseText;
  }
}

function getQuestion()
{
  if (xmlhttp.readyState==4)
  {
	  var str = xmlhttp.responseText;
//	  str = str + "";
//	  str = str.replace("  ","");
//	  str = str.replace(" ","");
//	  str = str.replace("\n",""); 
//	  document.getElementById("txtStatic").value=str;
//	  document.getElementById("txtStatic").value = document.getElementById("txtStatic").value.replace(" ","");
//	  document.getElementById("txtStatic").value=str;
	  
	  var f =str.indexOf("|");
	  var l =str.indexOf("*");
	  
	  str = str.substring(f+1, l);
	  
	  var m,st, dy;
	  
	  m =str.indexOf("-");
	  
	  st = str.substring(0, m);
	  dy = str.substring(m+1);
	  
	  document.getElementById("txtStatic").value=st;
	  document.getElementById("txtDynamic").value=dy;
	  document.getElementById("txtStatic").focus();
	  
  }
}

function getTime()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("span_entrytime").innerHTML=xmlhttp.responseText;
  }
}


function createuserRequest()
{
		xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	//nm = "aspan" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	    var uid = document.getElementById("uid").value;
		var uname = document.getElementById("uname").value;
		var pwd = document.getElementById("pwd").value;
		var rpwd = document.getElementById("rpwd").value;
		var role = document.getElementById("role").value;
		var did = document.getElementById("did").value;
		var branch_code = document.getElementById("branch_code").value;
	    
	    url ="create_user.jsp?uid=" + uid + "&uname=" + uname + "&pwd=" + pwd +  "&role=" + role + "&did=" + did + "&branch_code=" + branch_code + "&idn=" + Math.random() * 100;
	    //alert(url);
	    xmlhttp.onreadystatechange=CreateUserOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function getAllUsers()
{
	xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	//nm = "aspan" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	   
	    
	    url ="create_user.jsp?idn=" + Math.random() * 100;
	    //alert(url);
	    xmlhttp.onreadystatechange=CreateUserOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function CreateUserOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("msg").innerHTML=xmlhttp.responseText;
	  }
}


function getBrowseResult()
{
	xmlhttp=GetXmlHttpObject();

	  if (xmlhttp==null)
	  {
	   alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

	  	//nm = "aspan" + cnt;
	    var url="loadJSP.jsp";
	    //url=url+"?q="+str;
	    
	   
	    
	    url ="browse_result.jsp?idn=" + Math.random() * 100;
	    //alert(url);
	    xmlhttp.onreadystatechange=getBrowseResultOutput;
	    xmlhttp.open("GET",url, false);
	    xmlhttp.send(null);
}

function getBrowseResultOutput()
{
	if (xmlhttp.readyState==4)
	  {
	  document.getElementById("span_browse").innerHTML=xmlhttp.responseText;
	  }
}



function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
       return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
      return new ActiveXObject("Microsoft.XMLHTTP");
    }
 return null;
}


