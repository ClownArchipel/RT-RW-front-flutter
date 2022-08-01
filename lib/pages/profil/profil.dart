//import package
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/data/my_strings.dart';
import 'package:reterewe/networks/api.dart';
import 'package:reterewe/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  Profil();

  @override
  ProfilState createState() => new ProfilState();
}

class ProfilState extends State<Profil> {
  String _name = '';

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
  Future<String> setName() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  _name = pref.getString('name')!;
  return _name;
}

  @override
  Widget build(BuildContext context) {
    //deklarasi ukuran device
    Size size = MediaQuery.of(context).size;

    //nilai kembalian untuk profil
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          //appbar pada profil
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[300],
            expandedHeight: size.height / 3,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/image_10.jpg',
                  fit: BoxFit.cover),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                transform: Matrix4.translationValues(0, 50, 0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[500],
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 48,
                    child: Image.asset('assets/images/logorete.png'),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      //body dari profil
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(height: 70),
              FutureBuilder(
                future: setName(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    var rlname = jsonDecode(snapshot.data!);
                    return Text(rlname, style: TextStyle(color: Colors.black));
                  } else return CircularProgressIndicator();
                }),
              Container(height: 15),
              Text("Jika aku tidak dapat melakukan hal-hal besar, aku dapat melakukan hal-hal kecil dengan cara yang hebat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
              Container(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  primary: kPrimaryColor,
                ),
                child: Text("LOGOUT", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  logout(context);
                },
              ),
              Container(height: 30),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: 20,
                  child: Text('RETEREWE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[300],
                      )),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: 20,
                  child: Text('Version 0.0.1',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[300],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //fungsi untuk logout
  void logout(BuildContext context) async {
    var token;

    //set to logout
    var res = await Network().setLogout("/auth/logout");
    var body = json.decode(res.body);

    //get acces token from local storage
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!);

    //execute the logout function
    if (token != null) {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      localStorage.remove('id');
      localStorage.remove('name');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
