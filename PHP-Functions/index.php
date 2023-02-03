<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crack The Hash</title>
</head>
<body>
    <h1>MD5 Cracker</h1>
    <p>This application takes an MD5 hash of a four digit pin and checks all 10,000 possible four digit PIN numbers to determine the correct one.</p>

    <?php
        if (isset($_GET['md5'])) {
            $time_pre = microtime(true);
            $md5 = $_GET['md5'];
            $result = "<p>PIN: Not Found</p>";
            $count = 0;
            echo "<table><caption>Debug Output</caption><thead><tr><td>HASH</td><td>PIN</td></tr></thead>";
            for ($x = 0; $x < 10000; $x++) {
                $count = $x + 1;
                if ($x < 15){
                    echo "<tr><td>";
                    echo (string)md5($x);
                    echo "</td><td>$x</td></tr>";
                }
                if ((string)md5($x) === $md5){
                    $result = "<p>PIN FOUND: $x</p>";
                    break;
                }
            }
            $time_post = microtime(true);
            $time_elapsed = $time_post-$time_pre;
            echo "</table><p>Elapsed time: $time_elapsed</p><p>Total Checks: $count</p>$result";
        }
    ?>

    <form method="GET">
        <input type="text" name="md5" size="40">
        <button type="submit">Crack MD5</button>
    </form>
</body>
</html>
