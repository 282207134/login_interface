import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 这个小部件是您的应用程序的根部。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application', // 应用的标题
      theme: ThemeData(
        primarySwatch: Colors.blue, // 主题颜色
        visualDensity: VisualDensity.adaptivePlatformDensity, // 视觉密度
      ),
      home: LoginPage(), // 初始页面为登录页
      debugShowCheckedModeBanner: false, // 不显示右上角的debug标签
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // 表单的全局键
  String _username = ''; // 用户名字符串
  String _password = ''; // 密码字符串

  void _login() {
    if (_formKey.currentState!.validate()) {
      // 如果表单验证通过
      _formKey.currentState!.save(); // 保存表单状态

      // 检查凭据是否正确
      if (_username == 'liuyu' && _password == '123456') {
        // 导航到MyHomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        // 显示错误消息
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("登録")),
      ), // 页面顶部的应用栏
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0), // 内边距
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Username'), // 用户名输入框
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username'; // 验证输入内容
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value!, // 保存输入内容
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(20),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'), // 密码输入框
                  obscureText: true, // 隐藏输入内容
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password'; // 验证输入内容
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value!, // 保存输入内容
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _login, // 登录按钮
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
