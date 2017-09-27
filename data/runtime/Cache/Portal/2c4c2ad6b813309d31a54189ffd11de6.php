<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zxx">
  <head>
    	<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="1,2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/themes/simplebootx/Public/assets/ass/images/favicon.ico">

    <title>Home</title>
    <link rel="icon" href="/themes/simplebootx/Public/assets/images/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/themes/simplebootx/Public/assets/images/favicon.ico" type="image/x-icon">
    <link href="/themes/simplebootx/Public/assets/simpleboot/themes/simplebootx/theme.min.css" rel="stylesheet">
    <link href="/themes/simplebootx/Public/assets/simpleboot/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="/themes/simplebootx/Public/assets/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="/themes/simplebootx/Public/assets/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
    <![endif]-->
    <link href="/themes/simplebootx/Public/assets/css/style.css" rel="stylesheet">




    <!-- Bootstrap core CSS -->
    <link href="/themes/simplebootx/Public/assets/ass/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
       
    <!-- Bootstrap Datepicker CSS -->
    <link href="/themes/simplebootx/Public/assets/ass/vendor/bootstrap-datepicker/css/datepicker.min.css" rel="stylesheet">
           
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/themes/simplebootx/Public/assets/ass/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Custom Fonts -->
    <link href="/themes/simplebootx/Public/assets/ass/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- PrettyPhoto CSS -->
    <link href="/themes/simplebootx/Public/assets/ass/vendor/prettyPhoto/prettyPhoto.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/themes/simplebootx/Public/assets/ass/css/style.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/themes/simplebootx/Public/assets/ass/css/custom.css" rel="stylesheet">
	
  </head>

  <body id="page-top" class="aboutus-page">
    
    <!-- Nav Section -->
    
   <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                
                <!-- Logo Here -->
                <a class="navbar-brand page-scroll" href="index.html"><p>爱烘焙</p></a>
            </div>            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="li-class" ; $style="nav navbar-nav navbar-right"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
                <ul class="nav pull-right" id="main-menu-user">
                <?php if(session('user') != null): ?><li class="dropdown  login">
                        <a class=" " data-toggle="dropdown" href="#">
                        <img src="/themes/simplebootx/Public/assets/images/headicon.png" class="headicon"/>
                        <span class="user-nicename"></span><b class="caret"></b></a>
                        <ul class="dropdown-menu pull-right">
                           <li>
                                <a href="<?php echo U('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a>
                            </li>
                           <li class="divider"></li>
                           <li>
                                <a href="<?php echo U('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a>
                            </li>
                        </ul>
                    </li>
                    <?php else: ?>
                    <li class="dropdown  offline">
                        <a class="" data-toggle="dropdown" href="#">
                            <img src="/themes/simplebootx/Public/assets/images/headicon.png" class="headicon"/>登录<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu pull-right">
                           <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
                           <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li>
                           <li><a href="<?php echo leuu('user/login/index');?>"><i class="fa fa-sign-in"></i> &nbsp;登录</a></li>
                           <li class="divider"></li>
                           <li><a href="<?php echo leuu('user/register/index');?>"><i class="fa fa-user"></i> &nbsp;注册</a></li>
                        </ul>
                    </li><?php endif; ?>
            </ul>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
        
    
    <!-- Page Title Header -->
    
    <?php $header=sp_sql_posts("cid:7;field:post_title,post_excerpt,object_id,smeta,term_id;order:listorder asc;limit:4;"); $img = json_decode($header[0]['smeta']); ?>
<header class="inner-page">
    <div class="container-fluid">
        <div class="row">
            <div class="col-mg-12">
                <img src="http://localhost/data/upload/<?php echo ($img->photo[0]->url); ?>" class="img-responsive" alt="Page Title Bg">  <!-- Page Title Image -->
                <div class="page-title">
                    <p><?php echo ($header["0"]["post_content"]); ?></p>
                    <h1><?php echo ($header["0"]["post_title"]); ?></h1>
                </div>        
            </div>
        </div>
    </div>
</header>
    
    <!-- About page Section -->
    
    <section id="aboutpage" class="aboutpage about"><!-- Section id-->
    <?php $aboutOne=sp_sql_posts("cid:8;"); $img = json_decode($aboutOne[0]['smeta']); ?>
        <div class="container">
            <div class="row">
            	<div class="col-md-6 col-sm-12 left-side">
                	<div class="section-title inside-page">
                    	<h4><?php echo ($aboutOne["0"]["post_title"]); ?></h4>
                        <h2><?php echo ($aboutOne["0"]["post_excerpt"]); ?></h2>
                    </div>
                    <div class="about-page-content">
                    	<p><?php echo ($aboutOne["0"]["post_content"]); ?></p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 right-side">
                	<div class="row about-img">
                    	<div class="col-sm-6 col-xs-6">
                        	<figure><img src="<?php echo ($img->photo[0]->url); ?>" class="img-responsive" alt="Picture"></figure>
                        </div>
                        <div class="col-sm-6 col-xs-6">
                        	<figure><img src="<?php echo ($img->photo[1]->url); ?>" class="img-responsive" alt="Picture"></figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Happy Customers Section -->
    
    <section id="happy" class="happy"><!-- Section id-->
    <?php $aboutTwo=sp_sql_posts("cid:9;"); ?>
        <div class="container">
            <div class="row">
            	<div class="col-md-12">
                	<div class="best-dish">
                    	<div class="section-title inside-page">
                            <h4><?php echo ($aboutTwo["0"]["post_title"]); ?></h4>
                            <h2><?php echo ($aboutTwo["0"]["post_excerpt"]); ?></h2>
                        </div>
                        <p class="fs-16"><?php echo ($aboutTwo["0"]["post_content"]); ?></p>               
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
	<!-- Our Team Section -->
    
    <section id="ourteam" class="ourteam"><!-- Section id-->
        <div class="container">
            <div class="row">
            	<div class="col-md-12">
                	<div class="section-title">
                    	<h2 class="fw-600">我们的团队</h2>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                </div>
            </div>
             <?php $aboutThree=sp_sql_posts("cid:10;limit:3;"); $img = json_decode($aboutThree[0]['smeta']); ?>
            <div class="row">
                <?php if(is_array($aboutThree)): foreach($aboutThree as $k=>$vo): $img = json_decode($vo['smeta']); ?>
            		<div class="col-md-4 col-sm-4">
                    	<div class="team-block">
                        	<p class="name fs-18"><?php echo ($vo["post_title"]); ?></p>
                            <p class="pos fs-12"><?php echo ($vo["post_excerpt"]); ?></p>
                            <img src="<?php echo ($img->photo[0]->url); ?>" class="img-circle img-responsive" alt="avtar" />
                            <p class="details"><?php echo ($vo["post_content"]); ?></p>
                            <ul class="list-inline social-icon">
                            	<li><a href="#" ><i class="fa fa-facebook-f"></i></a></li>
                                <li><a href="#" ><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" ><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div><?php endforeach; endif; ?>
                </div>							
            </div>
    </section>

    <!-- Footer Section -->
     <!-- Footer Section -->
    
    <footer id="footer" class="footer"><!-- Section id-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>Newsletter</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="newsletter">
                        <form class="form-inline">
                          <div class="form-group">
                            <input type="email" class="form-control" id="inputEmail2" placeholder="Your email address">
                          </div>
                          <button type="submit" class="btn btn-default fs-18"><i class="fa fa-envelope-o"></i></button>
                        </form>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="social">
                        <ul class="list-inline fs-24">
                            <li><a href="#" ><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" ><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" ><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#" ><i class="fa fa-pinterest-p"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright clearfix">
            <div class="">
                <p class="copy">Copyright &copy; 2017.Company name All rights reserved.</p>
            </div>
        </div>
    </footer>

    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/themes/simplebootx/Public/assets/ass/js/ie10-viewport-bug-workaround.js"></script>
    
    <!-- jQuery -->
    <script src="/themes/simplebootx/Public/assets/ass/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/themes/simplebootx/Public/assets/ass/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Bootstrap Datepicker- JavaScript -->
    <script src="/themes/simplebootx/Public/assets/ass/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    	
    <!-- Plugin JavaScript -->
    <script src="/themes/simplebootx/Public/assets/ass/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/themes/simplebootx/Public/assets/ass/vendor/scrollreveal/scrollreveal.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="/themes/simplebootx/Public/assets/ass/js/theme.js"></script>
    
    <!-- custom JavaScript -->
    <script src="/themes/simplebootx/Public/assets/ass/js/custom.js"></script>
    
    <!-- prettyPhoto -->
    <script src="/themes/simplebootx/Public/assets/ass/vendor/prettyPhoto/jquery.prettyPhoto.js"></script>
    
  </body>
</html>