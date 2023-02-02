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

    <pre>
    <?php
        echo "<p>Debug Output:</p>";
        if (isset($_GET['md5'])) {
            for ($x = 0; $x < 10000; $x++) {
                if ($x < 15){
                    echo (string)md5($x);
                    echo "  ";
                    echo $x;
                }
                if ((string)md5($x) === $_GET['md5']){
                    echo $x;
                }
            }
        }
    ?>
    </pre>

    <form method="GET">
        <input type="text" name="md5" size="40">
        <button type="submit">Crack MD5</button>
    </form>
</body>
</html>
