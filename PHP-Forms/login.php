<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rock Paper Scissors | Login</title>
</head>
<body>
    /*
        The login.php should be a login screen.
        It should present a field for the person's name (name="who") and their password (name="pass").
        Your form should have a button labeled "Log In" that submits the form data using method="POST" (i.e. these should not be GET parameters).
        The login screen needs to have some error checking on its input data.
        If either the name or the password field is blank, you should put up a message of the form:
        User name and password are required
        If the password is non-blank and incorrect, you should put up a message of the form:
            Incorrect password
        If there are errors, you should come back to the login screen (login.php) and show the error with blank input fields
            (i.e. don't carry over the values for name="who" and name="pass" fields from the previous post).
        You are to use a "salted hash" for the password.
        The "plaintext" of the password is not to be present in your application source code except in comments.
        For this assignment, we will be using the following values for the salt and stored hash:
        $salt = 'XyZzy12*_';
        $stored_hash = '1a52e17fa899cf40fb04cfc42e6352f1';
        Note that the sample code is using a different salted hash so you should change the sample code to use this hash.
        The stored_hash is the MD5 of the salt concatenated with the plaintext of php123 - which is the password.
        This hash is computed using the following PHP:
        $md5 = hash('md5', 'XyZzy12*_php123');
        In order to check an incoming password you must concatenate the salt plus password together and then run that through the hash() function and compare it to the stored_hash.
        If the incoming password, properly hashed matches the stored stored_hash value, the user's browser is redirected to the game.php page with the user's name as a GET parameter using:
        header("Location: game.php?name=".urlencode($_POST['who']));
    */
</body>
</html>