<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rock Paper Scissors | Game</title>
</head>
<body>
    /*
        In order to protect the game from being played without the user properly logging in,
        the game.php must first check the session to see if the user's name is set and
        if the user's name is not set in the session the game.php must stop immediately using the PHP die() function:
            die("Name parameter missing");
        To test, navigate to game.php manually without logging in - it should fail with "Name parameter missing".
        If the user is logged in, 
        they should be presented with a drop-down menu showing the options Rock, Paper, Scissors, and Test as well as buttons labeled "Play" and "Logout".
        If the Logout button is pressed the user should be redirected back to the index.php page using:
            header('Location: index.php');
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
    */
</body>
</html>