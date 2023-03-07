<?php
if (! isset($_GET['name']) || strlen($_GET['name']) < 1){
    die("Name parameter missing");
}

if (isset($_POST['logout'])){
    header('Location: index.php');
    return;
}
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
    <!--
        If the user selects, Rock, Paper, or Scissors and presses "Play", the game chooses random computer throw,
        and scores the game and prints out the result of the game:
        Your Play=Paper Computer Play=Paper Result=Tie
        The computation as to whether the user wins, loses, or ties is to be done in a function named check() that returns a string telling the user what happenned:
        // This function takes as its input the computer and human play
        // and returns "Tie", "You Lose", "You Win" depending on play
        // where "You" is the human being addressed by the computer
        function check($computer, $human) {
            ...
                return "Tie";
            ...
                return "You Win";
            ...
                return "You Lose";
            ...
        }
        The "Test" option requires that you write two nested for loops that tests all combinations of possible human and computer play combinations:
        for($c=0;$c< 3;$c++) {
            for($h=0;$h< 3;$h++) {
                $r = check($c, $h);
                print "Human=$names[$h] Computer=$names[$c] Result=$r\n";
            }
        }
        The $names variable contains the strings "Rock", "Paper", and "Scissors" in this example.
        The output of this should look as follows:
        This will allow you to make sure that your check() function properly handles all combinations of the possible plays without
        having to play for a long time as the computer makes random plays.
    -->
</body>
</html>