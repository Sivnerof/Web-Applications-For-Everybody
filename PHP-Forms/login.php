<?php
if (isset($_POST['cancel'])){
    header("Location: index.php");
    return;
}

$salt = 'XyZzy12*_';
$stored_hash = '1a52e17fa899cf40fb04cfc42e6352f1'; // Password is php123

$failure = false;

if (isset($_POST['who']) && isset($_POST['pass'])){
    if (strlen($_POST['who']) < 1 || strlen($_POST['pass']) < 1){
        $failure = "User name and password are required";
    } else {
        $check = hash('md5', $salt.$_POST['pass']);
        if ($check === $stored_hash){
            header("Location: game.php?name=".urlencode($_POST['who']));
            return;
        } else {
            $failure = "Incorrect password";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rock Paper Scissors | Login</title>
    <?php require_once "bootstrap.php";?>
</head>
<body>
    <div class="container">
        <h1>Please Log In</h1>
        <?php
        if ($failure !== false) {
            echo('<p style="color: red;">'.htmlentities($failure)."</p>\n");
        }
        ?>
        <form action="login.php" method="POST">
            <label for="who">User Name</label><!--
            --><input type="text" name="who" id="who" placeholder="e.g. John">
            <br>
            <label for="pass">Password</label><!--
            --><input type="password" name="pass" id="pass">
            <br>
            <button type="submit">Log In</button>
            <button type="submit" name="cancel" value="Cancel">Cancel</button>
        </form>
    </div>
</body>
</html>