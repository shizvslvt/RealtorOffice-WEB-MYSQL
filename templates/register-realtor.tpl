<link rel="stylesheet" href="../assets/style/auth_style.css">
<div class="auth">
    <h2>Sign Up as Rieltor</h2>
    <form action="?p=register-realtor" method="post" id="signupForm">
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
        <div class="user-box-active">
            <input type="date" name="exp" required="">
            <label class="active">Experience</label>
        </div>
        <button type="submit">Sign Up as Rieltor</button><br>


    </form>
</div>