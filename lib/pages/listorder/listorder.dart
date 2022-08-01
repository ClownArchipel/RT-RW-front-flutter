import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/models/Order.dart';
import 'package:reterewe/networks/api.dart';
import 'package:reterewe/pages/listorder/list_draggable_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orderlist extends StatefulWidget {
  const Orderlist({Key? key,}) : super(key: key);

  @override
  OrderlistState createState() => new OrderlistState();
}

class OrderlistState extends State<Orderlist> {
  //deklarasi variabel
  late BuildContext context;
  List<Order>? order= [];

  _getDoc() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var id = jsonDecode(localStorage.getString('id')!);
    Network().getData("/findlist/${id}").then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        order = list.map((e) => Order.fromJson(e)).toList();
      });
    });  
  }

  void onReorder() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getDoc();
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //deklarasi device
      Size size =  MediaQuery.of(context).size;
      
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Id Order"),
              Text("Status Transaksi"),
            ],
          ),
        ),
        body:ListOrder(order!, onReorder).getView());
    }
}

