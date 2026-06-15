# PHP

```php
<?php
// Always start the session first
session_start();

// set session variables 
$_SESSION['user_id'] = 42; $_SESSION['username'] = 'maiaungureanu'; $_SESSION['is_logged_in'] = true; echo"Session variables have been set!";

//access session variables 
if (!isset($_SESSION['is_logged_in']) || $_SESSION['is_logged_in'] !== true) {
// Redirect to login page if not authenticated 
header("Location: login.php"); exit; } 
// Access the stored data safely 
echo "Welcome back, " . htmlspecialchars($_SESSION['username']) . "!";

//destroying sessions
// 1. Unset all session variables
$_SESSION = [];

// 2. Erase the session cookie from the browser completely
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// 3. Destroy the session on the server
session_destroy();

// 4. Redirect to home or login page
header("Location: index.php");
exit;
```