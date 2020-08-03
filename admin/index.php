<?php
  require_once '../core/init.php';
  if(!is_logged_in()){
    header('Location: logout.php');
  }
  include 'includes/head.php';
  include 'includes/navigation.php';

?>
<br/>
<b>Administrator Home</b>
<?php include 'includes/footer.php';
