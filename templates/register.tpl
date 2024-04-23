<link rel="stylesheet" href="../assets/style/auth_style.css">
<div class="auth">
    <h2>Sign Up</h2>
    <form action="?p=register" method="post" id="signupForm">
        <div class="user-box">
            <input type="text" name="name" required="">
            <label>Name</label>
        </div>
        <div class="user-box">
            <input type="text" name="mail" required="">
            <label>Mail</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" required="">
            <label>Password</label>
        </div>
        <div class="user-box">
            <input type="password" name="repeatpass" required="">
            <label>Repeat password</label>
        </div>
        <div class="user-box-active">
            <input type="date" name="birthday" required="">
            <label class="active">Birthday</label>
        </div>
        <div class="user-box">
            <input type="text" name="PID" required="">
            <label>PID</label>
        </div>
        <button type="submit">Sign Up</button><br>
        <a href="?p=register-realtor">
            <button type="button">Sign Up as Realtor</button>
        </a>
    </form>
</div>
