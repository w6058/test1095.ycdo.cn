<?php if (!defined('THINK_PATH')) exit();?><t!DOCTYPE html>
<html lang="en">
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

  <body id="page-top">
    
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
    
    <!-- Full Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide carousel-fade header">
    
        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <?php $home_slides=sp_getslide("portal_index"); $home_slides=empty($home_slides)?$default_home_slides:$home_slides; ?>
             <?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): if($k == 0 ): ?><div class="item active">
                    <?php else: ?> 
                     <div class="item"><?php endif; ?>
                    <!-- Set the first background image using inline CSS below. -->
                    <div class="fill" style="background-image:url(<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>);"></div>
                    <div class="carousel-caption">
                        <img src="/themes/simplebootx/Public/assets/ass/images/slide-wave.png" class="img-responsive" alt="Slide">
                        <h2>Delicious Foods</h2> 
                        <h3><?php echo ($vo["slide_name"]); ?></h3> 
                        <a href="reservation.html" class="btn btn-white">Make a Reservation</a>
                    </div>
                </div><?php endforeach; endif; ?>
            
            
        </div>
        
    </header>   
    
    
    <!-- About Section -->
    
    <section id="about" class="about"><!-- Section id-->
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12 left-side">
                    <div class="section-title">
                        <h1>关于我们</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                    <?php $chefCook=sp_sql_posts("cid:2;"); $img = json_decode($chefCook[0]['smeta']); ?>
                    <div class="about-content">
                        <p class="text-uppercase fw-700"><?php echo ($chefCook["0"]["post_title"]); ?></p>
                        <p><?php echo ($chefCook["0"]["post_content"]); ?></p>
                    </div>
                    <div class="about-chef">
                        <h3>Chef Cook</h3>
                        <img src="<?php echo ($img->photo[0]->url); ?>" alt="">
                        <p>"Unique creations for unique<br>occasions."</p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 right-side">
                <?php $home_slides=sp_getslide("portal_about"); $home_slides=empty($home_slides)?$default_home_slides:$home_slides; ?>
                    <div class="row about-img">
                        <?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><div class="col-sm-6 col-xs-12">
                                <figure><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" class="img-responsive" alt="Picture"></figure>
                            </div><?php endforeach; endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- Our Menu Section -->
    
    <section id="ourmenu" class="ourmenu"><!-- Section id-->
        <div class="container">
            <div class="row">
            <?php $lastnews=sp_sql_posts("cid:1;order:listorder asc;limit:3;"); ?>
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>我们的菜单</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                </div>
                <?php if(is_array($lastnews)): foreach($lastnews as $key=>$vo): ?><div class="col-md-4 col-sm-4 col-xs-12">               
                        <div class="hover ehover">
                           <?php echo ($vo["post_content"]); ?>
                            <div class="overlay">
                                <a href="ourmenu" class="info btn btn-gold">查看更多 </a>
                            </div>  
                            <h3><?php echo ($vo["post_title"]); ?></h3>          
                        </div>
                    </div><?php endforeach; endif; ?>
                
                
                <div class="col-md-12 col-sm-12 col-xs-12 call-to-btn">
                    <a href="ourmenu" class="btn btn-white">更多</a>
                </div>
                
            </div>
        </div>
    </section>
    

    <!-- Meal of the Day Section -->
    
    <section id="mealoftheday" class="mealoftheday"><!-- Section id-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>一天的膳食</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                </div>
                <?php $dayFood=sp_sql_posts("cid:3;"); $img = json_decode($dayFood[0]['smeta']); ?>
                <div class="col-md-7 col-sm-6">
                    <div class="meal-img">
                        <img src="<?php echo ($img->photo[1]->url); ?>" class="img-responsive" alt="meal of the day" />
                    </div>
                </div>
                <div class="col-md-5 col-sm-6">
                    <div class="meal-details">
                        <h3><?php echo ($dayFood["0"]["post_title"]); ?></h3>
                        <p><?php echo ($dayFood["0"]["post_content"]); ?></p>
                        <div class="row chaf-qut">
                            <div class="col-sm-3 col-xs-5">
                                <img src="<?php echo ($img->photo[0]->url); ?>" class="img-circle img-responsive" alt="avtar" />
                            </div>
                            <div class="col-sm-9 col-xs-7">
                                <p><?php echo ($dayFood["0"]["post_excerpt"]); ?></p>
                            </div>
                        </div>
                    </div>  
                </div>                                
                
            </div>
        </div>
    </section> 
       

    <!-- Book a Table Section -->
    
    <section id="bookatable" class="bookatable"><!-- Section id-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                <?php $yuDing=sp_sql_posts("cid:6;"); ?>
                    <div class="best-dish">
                        <h1><?php echo ($yuDing["0"]["post_title"]); ?></h1>
                        <p class="big-text"><?php echo ($yuDing["0"]["post_excerpt"]); ?></p>
                        <p><?php echo ($yuDing["0"]["post_content"]); ?> </p>
                        <div class="call-to-action">
                            <a href="reservation.html" class="btn btn-gold">Book a Table</a>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section id="events" class="events"><!-- Section id-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>即将举行的活动</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-1.png" alt="Underline" />
                    </div>
                </div>                
            </div>
            <?php $events=sp_sql_posts("cid:5;limit:3;"); ?>
            <div class="row event-block">
            <?php if(is_array($events)): foreach($events as $k=>$vo): $img = json_decode($vo['smeta']); ?>
                <?php if($k == 0 ): ?><div class="col-md-4 col-sm-4">
                        <div class="event-artical">
                            <img src="<?php echo ($img->photo[0]->url); ?>" class="img-responsive" alt="Event" />
                            <p class="event-date"><?php echo ($vo["post_excerpt"]); ?></p>
                            <h4 class="event-name fs-20"><?php echo ($vo["post_title"]); ?></h4>
                            <p class="event-details"><?php echo ($vo["post_content"]); ?></p>
                        </div>
                    </div>
                    <?php elseif($k == 1): ?>
                        <div class="col-md-4 col-sm-4">
                            <div class="event-artical">                     
                                <p class="event-date"><?php echo ($vo["post_excerpt"]); ?></p>
                                <h4 class="event-name fs-20"><?php echo ($vo["post_title"]); ?></h4>
                                <p class="event-details"><?php echo ($vo["post_content"]); ?></p>
                                <img src="<?php echo ($img->photo[0]->url); ?>" class="img-responsive" alt="Event" />
                            </div>
                        </div>
                    <?php else: ?> 
                        <div class="col-md-4 col-sm-4">
                            <div class="event-artical">
                                <img src="<?php echo ($img->photo[0]->url); ?>" class="img-responsive" alt="Event" />
                                <p class="event-date"><?php echo ($vo["post_excerpt"]); ?></p>
                                <h4 class="event-name fs-20"><?php echo ($vo["post_title"]); ?></h4>
                                <p class="event-details"><?php echo ($vo["post_content"]); ?></p>
                            </div>
                        </div><?php endif; endforeach; endif; ?>
            </div>
            
        </div>
    </section>
    

    <!-- Contact Section -->
    
    <section id="contactus" class="contactus"><!-- Section id-->
        <div class="container">
            <div class="row contect-out-bg">
                <!---<div class="col-md-6 col-sm-6">
                    <div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387145.8662688941!2d-74.2581880279189!3d40.70531105474914!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sin!4v1476860298090" height="450" ></iframe>
                    </div>
                </div>--->
                <div class="col-md-6 col-sm-6">
                    <div class="section-title">
                        <h1>联系我们</h1>
                        <img src="/themes/simplebootx/Public/assets/ass/images/sep-2.png" alt="sep">
                    </div>
                    
                    <div class="contact-form row"><!-- contact form -->
                        <form class="" action="send_email.php" id="contact" name="contact" method="post" >
                          <div class="form-group col-md-6">
                            <input type="text" class="form-control" name="InputName" id="InputName" placeholder="您的姓名" required >
                          </div>
                          <div class="form-group col-md-6">
                            <input type="email" class="form-control" name="InputEmail" id="InputEmail" placeholder="您的邮箱" required >
                          </div>
                          <div class="form-group col-md-12">
                            <textarea class="form-control" name="InputMessage" id="InputMessage" rows="4" placeholder="内容" required  ></textarea>
                          </div>
                          
                          <button name="submit" type="submit" class="btn btn-white">发信息</button>
                        </form>
                    </div>
                    
                </div>                
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