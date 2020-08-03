<?php
define('BASEURL', $_SERVER['DOCUMENT_ROOT'].'/Proj/');
define('CART_COOKIE','SBwi72UCklwiqzz2');
define('CART_COOKIE_EXPIRE',time() + (86400 *30));
define('TAXRATE',0.087);//Sales tax rate. Set to 0 if you are not charging tax.

define('CURRENCY', 'usd');
define('CHECKOUTMODE','TEST'); //change TEST to LIVE when you are ready to go LIVE

if(CHECKOUTMODE == 'TEST'){
    define('STRIPE_PRIVATE','sk_test_mDtbDjqm2jiIJ8hRKkCiyEGe');
    define('STRIPE_PUBLIC','pk_test_jCkvsh133xx8UtQBkmGnKGfy');
}


