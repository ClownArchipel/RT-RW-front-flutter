import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/homemain.dart';
import 'package:reterewe/networks/api.dart';
import 'package:reterewe/pages/auth/register.dart';
import 'package:reterewe/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String username = '';
  String password = '';

  bool hidePassword = true;
  bool loading = false;
  bool rememberPsw = false;

  hideKeyboard() => textFieldFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(          
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: _size.height * .42,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30.0),
                        ),
                        color: kPrimaryColor,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/bg_add.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: _size.height * .34,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.08),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFABBAD5),
                                      spreadRadius: .8,
                                      blurRadius: 1.5,
                                      offset: Offset(
                                        0,
                                        1.5,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 12.0),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: _size.width / 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        validator: (val) => val!.length == 0
                                            ? 'Enter your Username'
                                            : null,
                                        onChanged: (val) =>
                                            username = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Enter Your Username',
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      thickness: .4,
                                      height: .4,
                                      indent: 18.0,
                                      endIndent: 18.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: _size.width / 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        focusNode: textFieldFocus,
                                        validator: (val) => val!.length == 0
                                            ? 'Enter Your Correct Password'
                                            : null,
                                        onChanged: (val) =>
                                            password = val.trim(),
                                        obscureText: hidePassword,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Enter Password',
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          suffix: Text(
                                            'Lupa Kata Sandi?',
                                            style: TextStyle(
                                              color: Color(0xFFC59A55),
                                              fontSize: _size.width / 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      thickness: .4,
                                      height: .4,
                                      indent: 18.0,
                                      endIndent: 18.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _login();
                                  }
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color(0xFFC59A55),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignupPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xFFC59A55),
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Color(0xFFC59A55),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
  void _login() async {
    //mendeklarasikan data input
    var data = {
      'username': username,
      'password': password,
    };
    //menyimpan Json response dari alamat endpoint ('/auth/login')
    var res = await Network().authData(data, '/auth/login');
    var body = json.decode(res.body); // menyimpan body response Json

    if (body['access_token'] != null) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('id', json.encode(body['user']['id']));
      localStorage.setString('name', json.encode(body['user']['name']));
      
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MyHomePage(indexpage: 0)));
    } else {
      Fluttertoast.showToast(
          // msg: body['error'],
          msg: 'Please check your username and password',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }
}
