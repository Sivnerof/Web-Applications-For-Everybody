<?php
if (! isset($_GET['name']) || strlen($_GET['name']) < 1){
    die("Name parameter missing");
}

if (isset($_POST['logout'])){
    header('Location: index.php');
    return;
}

$names = array('Rock', 'Paper', 'Scissors');
$human = isset($_POST["human"]) ? $_POST['human']+0 : -1;

$computer = 0;
$computer = rand(0,2);

function check($computer, $human) {
    if ($human === $computer) {
        return "Tie";
    } else if ( ($human === 0 && $computer === 2) || ($human === 1 && $computer === 0) || ($human === 2 && $computer === 1)) {
        return "You Win";
    } else {
        return "You Lose";
    }
}

$result = check($computer, $human);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rock Paper Scissors | Game</title>
    <?php require_once "bootstrap.php";?>
</head>
<body>
    <h1>Rock, Paper, Scissors</h1>
    <?php
    if ( isset($_REQUEST['name']) ) {
        echo "<p>Welcome: ";
        echo htmlentities($_REQUEST['name']);
        echo "</p>\n";
    }
    ?>
    <form method="POST">
        <label for="rps-selection">Choose your weapon:</label>
        <select name="human" id="rps-selection">
            <option value="-1">--Please choose an option--</option>
            <option value="0">Rock</option>
            <option value="1">Paper</option>
            <option value="2">Scissors</option>
            <option value="3">Test</option>
        </select>
        <button  type="submit" name="logout" value="logout">Logout</button>
        <button type="submit" value="Play">Play</button>
    <form>
    <pre>
    <?php
    if ( $human == -1 ) {
        print "Please select a strategy and press Play.\n";
    } else if ( $human == 3 ) {
        for($c=0;$c<3;$c++) {
            for($h=0;$h<3;$h++) {
                $r = check($c, $h);
                print "Human=$names[$h] Computer=$names[$c] Result=$r\n";
            }
        }
    } else {
        print "Your Play=$names[$human] Computer Play=$names[$computer] Result=$result\n";
    }
    ?>
    </pre>
</body>
</html>
