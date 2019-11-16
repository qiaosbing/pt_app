// function login() {
//     var studentId = document.getElementsByName("user");
//     var password = document.getElementsByName("pwd");
//     alert(studentId[0].value);
//     alert(password[0].value);
//     var oError = "";
//     var isError = true;
//     if (studentId[0].value.length != 10) {
//         oError = "学号请输入10位字符";
//         isError = false;
//     }
//     if (password[0].value.length <= 0) {
//         oError = "密码不能为空！";
//         isError = false;
//     }
//     if (isError) {
//         $.ajax({
//             url: "/sessions/index_table",
//             type: 'get',
//             user: studentId[0].value,
//             pwd:  password[0].value,
//             datatype: 'josn',               //同步调用，保证先执行result=true,后再执行return result;
//             success: function (data) {
//                 if (data.result == 'SUCCESS') {
//                     //弹出登录成功！
//                     alert("登陆成功！");
//                 } else {
//                     alert("帐号错误，登陆失败！");
//                 }
//             }
//         });
//     } else {
//         alert(oError);
//     }
// };
//用户登录
function sumbit_name_sex() {
    var username = $("#username").val(); //获取用户输入的用户名
    var password = $("#password").val(); //获取密码
    var web_url = window.location.href;
    $.ajax({
        url: web_url + 'UserLogin',
        type: 'POST',
        data: {username: username, password: password},
        dataType: 'json',
        //请求成功
        success: function (data) {
            console.log(data);//输入相应的内容
            if (data.status == 200) {
                window.location.href = "home_page"; //首页
            } else {
                alert(data.status);
                window.location.href;
            }
        },
    })
}

// 用户注册
function sumbit_regster() {
    var username = $("#username").val(); //获取用户名
    var email = $("#email").val(); //邮箱
    var password = $("#password").val(); //获取密码
    var s_password = $("#s_password").val(); //获取二次密码
    var web_url = window.location.href;
    $.ajax({
        url: web_url + 'UserSignup',
        type: 'POST',
        data: {username: username, email: email, password: password, s_password: s_password},
        dataType: 'json',
        //请求成功
        success: function (data) {
            console.log(data);//输入相应的内容
            if (data.status == 200) {
                alert("注册成功,正在跳转登录页面...");
                window.location.href;
            } else {
                alert(data.status);
                window.location.href = "signuup";
            }
        },
    })
}