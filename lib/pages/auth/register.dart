import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reterewe/networks/api.dart';
import 'package:reterewe/pages/auth/login.dart';
import 'package:reterewe/widgets/loading.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key, }) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String email = '';
  String name = '';
  String username = '';
  String phone = '';
  String passwordconf = '';
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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: .0,
              backgroundColor: Colors.white,
              centerTitle: true,              
              title: Text(
                'Register',
                style: TextStyle(
                  color: Color(0xFF2C3D50),
                  fontSize: _size.width / 21.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 12.0),
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
                                  boxShadow:const [
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
                                            ? 'Enter Your Email'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Email',
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
                                        validator: (val) => val!.length == 0
                                            ? 'Enter Your Name'
                                            : null,
                                        onChanged: (val) => name = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Name',
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
                                        validator: (val) => val!.length == 0
                                            ? 'Enter Your Username'
                                            : null,
                                        onChanged: (val) => username = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Username',
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
                                        validator: (val) => val!.length == 0
                                            ? 'Enter Your Phone Number'
                                            : null,
                                        onChanged: (val) => phone = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Phone',
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
                                        validator: (val) => val!.length == 0
                                            ? 'Enter Your Password'
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
                                          labelText: 'Password',
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
                                        validator: (val) =>
                                            val!.trim() != password
                                                ? 'Please Check Your Password'
                                                : null,
                                        onChanged: (val) =>
                                            passwordconf = val.trim(),
                                        obscureText: hidePassword,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Re-Password',
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
                                    SizedBox(height: 12),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _register();
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
                                      "Register",
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
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
                                  child: const Center(
                                    child: Text(
                                      "Login",
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
  // //fungsi untukk register
  void _register() async {
    //deklarasi data input
    Map data = {
      'name':name,
      'username':name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation':passwordconf,
    };

    var res = await Network().authData(data, '/auth/register');//menyimpan response json dari endpoint ("/auth/register")
    var body = json.decode(res.body);//menyimpan data body dari response json

    //apabila sukses maka akan menampilkan toaster succes
    if (body['message'] == 'User successfully registered') {
      //menampilkan toaster
      Fluttertoast.showToast(
          // msg: body['error'],
          msg: 'Success Registered',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
      //syntax untuk pindah halaman
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => SignupPage()),
      );
    } else {
      //menampilkan toaster gagal
      Fluttertoast.showToast(
          // msg: body['error'],
          msg: 'Please check your input',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  } 
}