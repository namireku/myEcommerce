<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/Proj/core/init.php';
include 'includes/head.php';
$email = ((isset($_POST['email']))?sanitize($_POST['email']):'');
$email = trim($email);
$password = ((isset($_POST['password']))?sanitize($_POST['password']):'');
$password = trim($password);
$errors = array();
?>
<style>
  body{
    background-image: url("/Proj/images/HeaderLogo/background.jpg") ;
    background-size: 100vw 100vh;
    background-attachment: fixed;
  }
</style>

<div id="login-form" style="width: 50%;height: 60%;border: 2px solid #000; border-radius: 15px; box-shadow: 7px 7px 15px rgba(0,0,0,0.6); margin: 7% auto; padding: 15px; background-color: #fff;">
    <div>

      <?php
        if($_POST){
          //form validation
          if(empty($_POST['email']) || empty($_POST['password'])){
            $errors[] = 'You must provide email and password.';
          }

          //validate email address
          if(!filter_var($email,FILTER_VALIDATE_EMAIL)){
            $errors[] = 'You must enter valid email';
          }

          //password more than 6 characters
          if(strlen($password) < 6){
            $errors[] = 'Password must be at least 6 characters.';
          }

          //check if email exist in database
          $query = $db->query("SELECT * FROM users WHERE email='$email'");
          $user = mysqli_fetch_assoc($query);
          $userCount = mysqli_num_rows($query);
          if($userCount < 1){
            $errors[] = 'This email doesn\'t exist in the database';
          }

          //check if password matches with that in the database
          if ($password != $user['password']) {
            $errors[] = 'Password does not match our records';
          }

          //check for Errors
          if(!empty($errors)){
            echo display_errors($errors);
          }else{
            //log user in
            $user_id = $user['id'];
            login($user_id);
          }
        }
      ?>

    </div>
    <h2 class="text-center">Login</h2><hr/>
    <form action="login.php" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" value="<?=$email;?>"/>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" value="<?=$password;?>"/>
        </div>
        <div class="form-group">
            <input type="submit" value="login" class="btn btn-primary" />
        </div>
    </form>
    <p class="text-right"><a href="/Proj/index.php">Visit Site</a></p>
</div>

<?php include 'includes/footer.php'; ?>
