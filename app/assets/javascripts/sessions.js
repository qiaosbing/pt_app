function login() {

    var verifyUrl = "sessions/index_table";
    //var message = document.getElementById("message");

    var studentId = document.getElementsByName("user");
    var password = document.getElementsByName("pwd");
    alert(studentId[0].value);
    alert(password[0].value);
    var oError = "";
    var isError = true;
    if (studentId[0].value.length != 10) {
        oError = "学号请输入10位字符";
        isError = false;
    }
    if (password[0].value.length <= 0) {
        oError = "密码不能为空！";
        isError = false;
    }
    alert(verifyUrl);
    if (isError) {
        $.ajax({
            type: 'post',
            url: verifyUrl,
            user: studentId[0].value,
            pwd:  password[0].value,
            datatype: 'josn',               //同步调用，保证先执行result=true,后再执行return result;
            success: function (data) {
                if (data.result == 'SUCCESS') {
                    window.location.href = "/AYZXX-B/books/list";
                    //弹出登录成功！
                    alert("登陆成功！");
                } else {
                    alert("帐号错误，登陆失败！");
                }
            }
        });
    } else {
        alert(oError);
    }
};