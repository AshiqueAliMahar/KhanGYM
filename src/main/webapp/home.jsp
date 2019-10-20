<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>

        #sidebar{
            background-color: silver;
            width: 300px;
            height:650px;
            font-family: Monaco;
            overflow: auto;
        }
        ul{
            list-style-type: none;
            margin: 0px;
        }
        ul li{
            border-bottom: 1px solid black;
        }
        #sidebar ul li:hover{
            background-color: darkred;
            color:white;
            font-size: 18px;
        }
        .font-weight-bold{
            border: none;
        }
    </style>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if(session.getAttribute("log")!=null){
%>
<div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#exercise">Exercise</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav" style="border: none">

                <li class="nav-item" style="border: none">
                    <a class="nav-link" href="#dietPlan">Diet plan</a>
                </li>
                <li class="nav-item" style="border: none">
                    <a class="nav-link" href="#workoutPlan">Workout Plan</a>
                </li>
                <li class="nav-item" style="border: none">
                    <a class="nav-link" href="About.html">About</a>
                </li>
                <li class="nav-item" style="border:none">
                    <a class="nav-link" href="logOut.action">Logout</a>
                </li>
            </ul>

        </div>
        <div align="right">Logged In as:<s:property value="#session.name"/></div>
    </nav>
    <div class="row">
        <div id="sidebar" style="border-right: 5px solid darkblue" class="col-4">
            <ul class="p-0">
                <li class="text-center h3" id="exercise"> <b>Exercises</b></li>
                <li class="font-weight-bold">Biceps</li>
                <ul>
                    <li onclick='changepic1("Biceps/bicep-curls.gif","pic","Biceps/bcdtl.jpg","desc")'>Biceps Curls</li>
                    <li onclick='changepic1("Biceps/cable-curls.gif","pic","Biceps/cb.png","desc")'>Cable Curls</li>
                    <li onclick='changepic1("Biceps/preacher-curls.gif","pic","Biceps/p.png","desc")'>Preacher Curls</li>
                    <li onclick='changepic1("Biceps/concentration-curls.gif","pic","Biceps/cc.png","desc")'>Concentration Curls</li>
                    <li onclick='changepic1("Biceps/dumbbell-curls.gif","pic","Biceps/dc.png","desc")'>Dumbell Curls</li>
                </ul>
                <li class="font-weight-bold">Chest</li>
                <ul>
                    <li onclick="changepic1('Chest/c.gif','pic','Chest/dp.png','desc')">Decline Bench Press</li>
                    <li onclick="changepic1('Chest/c1.gif','pic','Chest/fp.png','desc')">Flat Bench Press</li>
                    <li onclick="changepic1('Chest/c2.gif','pic','Chest/df.png','desc')">Dumbbell Fly</li>
                    <li onclick="changepic1('Chest/c3.png','pic','Chest/ip.png','desc')">Incline Dumbell Fly</li>
                    <li onclick="changepic1('Chest/c4.png','pic','Chest/pu.png','desc')">Push-Ups</li>
                    <li onclick="changepic1('Chest/c5.gif','pic','Chest/po.png','desc')">Push-Over</li>
                </ul>
                <li class="font-weight-bold">Shoulders</li>
                <ul>
                    <li onclick="changepic1('shoulders/barbell-military-press.gif','pic','shoulders/bmp.png','desc')">Barbell-Millitary-Press</li>
                    <li onclick="changepic1('shoulders/cable-front-raises.gif','pic','shoulders/cf.png','desc')">Cable-Front-Raises</li>
                    <li onclick="changepic1('shoulders/dumbbell-lateral-raise.gif','pic','shoulders/db.png','desc')">Dumbbel-Lateral-Raise</li>
                    <li onclick="changepic1('shoulders/seated-dumbbell-press.gif','pic','shoulders/sdb.png','desc')">Seated-Dumbbel-Press</li>
                    <li onclick="changepic1('shoulders/seated-machine-press.gif','pic','shoulders/smp.png','desc')">Seated-Machine-Press</li>
                    <li onclick="changepic1('shoulders/upright-row-barbell.gif','pic','shoulders/up.png','desc')">Upright-Row-Barbell</li>
                </ul>
                <li class="font-weight-bold">Triceps</li>
                <ul>
                    <li onclick="changepic1('Triceps/close-grip-bench-press.gif','pic','Triceps/cg.png','desc')">Close-Grip-Bench-Press</li>
                    <li onclick="changepic1('Triceps/machine-tricep-extensions.gif','pic','Triceps/mc.png','desc')">Machine-Tricep-Extensions</li>
                    <li onclick="changepic1('Triceps/standing-barbell-tricep-extensions.gif','pic','Triceps/tc.png','desc')">Standing-Barbell-Tricep-Extensions</li>
                    <li onclick="changepic1('Triceps/standing-dumbbell-tricep-extension.gif','pic','Triceps/kb.png','desc')">Standing-Dumbbell-Tricep-Extensions</li>
                    <li onclick="changepic1('Triceps/tricep-extensions-cable.gif','pic','Triceps/itc.png','desc')">Tricep-Extensions-Cable</li>
                    <li onclick="changepic1('Triceps/tricep-kickbacks.gif','pic','Triceps/kb.png','desc')">Tricep-Kickbacks</li>
                </ul>
                <li class="font-weight-bold">Wings</li>
                <ul>
                    <li onclick="changepic1('Wings/mlpd.gif','pic','Wings/pd.png','desc')">Machine-Lat-Pulldowns</li>
                    <li onclick="changepic1('Wings/oabor.gif','pic','Wings/oa.png','desc')">One-Arm-Bent-Over-Rows</li>
                    <li onclick="changepic1('Wings/tbr.gif','pic','Wings/tb.png','desc')">T-Bar-Rows</li>
                    <li onclick="changepic1('Wings/wgpups.gif','pic','Wings/wg.png','desc')">Wide-Grip-Pullups</li>
                    <li onclick="changepic1('Wings/bor.gif','pic','Wings/db.png','desc')">Bent-Over-Row</li>
                </ul>
                <li class="font-weight-bold">Abs</li>
                <ul>
                    <li onclick="changepic1('ABS/tc.gif','pic','ABS/tc1.png','desc')">Twist-Crunch</li>
                    <li onclick="changepic1('ABS/su.gif','pic','ABS/su1.png','desc')">Sit-Ups</li>
                    <li onclick="changepic1('ABS/knc.gif','pic','ABS/knc1.png','desc')">Kneeling-Cable-Crunches</li>
                    <li onclick="changepic1('ABS/dsb.gif','pic','ABS/dsb1.png','desc')">Dumbbell-Side-Bends</li>
                    <li onclick="changepic1('ABS/hll.gif','pic','ABS/tc1.png','desc')">Hanging-Leg-Lifts</li>
                </ul>
                <li class="font-weight-bold" onclick="changepic('Thighs/alt.jpg','pic')">Legs</li>
                <ul>
                    <li onclick="changepic1('Thighs/bd.gif','pic','Thighs/bd1.png','desc')">Barbell-Deadlifts</li>
                    <li onclick="changepic1('Thighs/bs.gif','pic','Thighs/bs1.png','desc')">Barbell-Squats</li>
                    <li onclick="changepic1('Thighs/cs.gif','pic','Thighs/cs1.png','desc')">Cable-Squats</li>
                    <li onclick="changepic1('Thighs/ds.gif','pic','Thighs/ds1.png','desc')">Dumbbell-Squats</li>
                    <li onclick="changepic1('Thighs/le.gif','pic','Thighs/le1.png','desc')">Leg-Extensions</li>
                </ul>
                <li class="font-weight-bold" id="dietPlan" onclick="changepic('DietPlan/dp.jpg','pic')">Diet Plan</li>
                <ul>
                    <li onclick="changepic('DietPlan/D1.png','pic')">Muscle Gain For Man</li>
                    <li onclick="changepic('DietPlan/D2.png','pic')">Fat Loss For Man</li>
                    <li onclick="changepic('DietPlan/D3.png','pic')">Muscle Gain For Woman</li>
                    <li onclick="changepic('DietPlan/D4.png','pic')">Fat Loss For Woman</li>
                </ul>
                <li class="font-weight-bold" id="workoutPlan" onclick="changepic('DietPlan/dp.jpg','pic')">Workout Plan</li>
                <ul>
                    <li onclick="changepic2('WorkOutPlan/mgmb.png','pic','WorkOutPlan/mgmb1.png','desc','WorkOutPlan/mgmb2.png','d2','WorkOutPlan/mgmb3.png','d3','','d4','','d5')">Muscle Gain For Man(Beginner)</li>
                    <li onclick="changepic2('WorkOutPlan/mgmi.png','pic','WorkOutPlan/mgfmi1.png','desc','WorkOutPlan/mgfmi2.png','d2','WorkOutPlan/mgfmi3.png','d3','WorkOutPlan/mgfmi4.png','d4','WorkOutPlan/mgfmi5.png','d5')">Muscle Gain For Man(Intermediate)</li>
                    <li onclick="changepic2('WorkOutPlan/mgma.png','pic','WorkOutPlan/mgma1.png','desc','WorkOutPlan/mgma2.png','d2','WorkOutPlan/mgma3.png','d3','','d4','','d5')">Muscle Gain For Man(Advanced)</li>
                    <li onclick="changepic1('WorkOutPlan/flmb.png','pic','','desc')">Fat Loss For Man(Beginner)</li>
                    <li onclick="changepic1('WorkOutPlan/flmi.png','pic','','desc')">Fat Loss For Man(Intermediate)</li>
                    <li onclick="changepic1('WorkOutPlan/flwb.png','pic','','desc')">Fat Loss For Woman(Beginner)</li>
                    <li onclick="changepic1('WorkOutPlan/flwi.png','pic','','desc')">Fat Loss For Woman(Intermediate)</li>
                    <li onclick="changepic1('WorkOutPlan/flwa.png','pic','','desc')">Fat Loss For Woman(Advanced)</li>
                </ul>
            </ul>
        </div>
        <div class="col-8" >
            <div class="m-auto">
                <img src="home/lazar.jpg" class="img-thumbnail img-fluid float-left" id="pic">
                <img src="" class="img-thumbnail img-fluid" id="desc">
                <img src="" id="d2" class="img-thumbnail img-fluid">
                <img src="" id="d3" class="img-thumbnail img-fluid">
                <img src="" id="d4" class="img-thumbnail img-fluid">
                <img src="" id="d5" class="img-thumbnail img-fluid">
                
            </div>
        </div>
    </div>
</div>

<script>
    function changepic(srcName,id){
        document.getElementById(id).src=srcName;
        document.getElementById('desc').src='';
        document.getElementById('d2').src='';
        document.getElementById('d3').src='';
        document.getElementById('d4').src='';
        document.getElementById('d5').src='';
        //location.href=('#exercise');
    }
    function changepic1(srcName,id,srcDesc,descId){
        document.getElementById(id).src=srcName;
        document.getElementById(descId).src=srcDesc;
        document.getElementById('d2').src='';
        document.getElementById('d3').src='';
        document.getElementById('d4').src='';
        document.getElementById('d5').src='';
        //location.href=('#exercise');
    }
    function changepic2(srcName,id,srcDesc,descId,srcD2,d2,srcD3,d3,srcD4,d4,srcD5,d5){
        document.getElementById(id).src=srcName;
        document.getElementById(descId).src=srcDesc;
        document.getElementById(d2).src=srcD2;
        document.getElementById(d3).src=srcD3;
        document.getElementById(d4).src=srcD4;
        document.getElementById(d5).src=srcD5;
        //location.href=('#exercise');
    }
    function about(){
    	
    }
</script>
<%}else{
	response.sendRedirect("index.jsp");
} %>
</body>
</html>