<link rel="stylesheet" href="../assets/style/auth_style.css">
<div class="auth">
    <h2>Sign Up</h2>
    <form action="?p=register" method="post">
        <div class="user-box">
            <input type="text" name="mail" required="">
            <label>Mail</label>
        </div>
        <div class="user-box">
            <input type="text" name="password" required="">
            <label>Password</label>
        </div>
        <div class="user-box">
            <input type="text" name="repeatpass" required="" >
            <label>Repeat password</label>
        </div>
        <button type="submit">Sign Up</button>
    </form>
</div>