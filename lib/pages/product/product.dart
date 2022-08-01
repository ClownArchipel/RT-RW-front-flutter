import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/data/grid_shop_product_adapter.dart';
import 'package:reterewe/data/my_colors.dart';
import 'package:reterewe/models/shop_product.dart';
import 'package:reterewe/networks/api.dart';
import 'package:reterewe/pages/snap/snap.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  ProductGridState createState() => ProductGridState();
}

class ProductGridState extends State<ProductGrid> {
  List<ShopProduct>? items = [];
  late BuildContext context;
  var pid;
  var idorder;
  String? token;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[200],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

//getdata product from api
  _getData() {
    Network().getDocuments("/product").then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        items = list.map((e) => ShopProduct.fromJson(e)).toList();
      });
    });
  }

  @override
  void onItemClick(int index, ShopProduct obj) {
    _showSimpleDialog(context, index);
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void dispose() {
    super.dispose();
  }

//main progam
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: MyColors.grey_10,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("RETEWE", style: TextStyle(color: MyColors.grey_10)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MyColors.grey_10),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info, color: MyColors.grey_10),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: MyColors.grey_10),
              onPressed: () {},
            ), // overflow menu
          ]),
      body: GridShopProductAdapter(items!, onItemClick).getView(),
    );
  }

  //add order
  void add() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var id = jsonDecode(localStorage.getString('id')!);

    Map data = {
      'user_id': id.toString(),
      'product_id': pid.toString(),
      'payment_type': 'gopay',
    };
    var res = await Network().postData(data, "/order");
    var body =jsonDecode(res.body);
    idorder = body['id'];

    var resp = await Network().getData("/order/${idorder}");
    var rbody = jsonDecode(resp.body);
    token = rbody['snap_token'];

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SnapScreen(
            transactionToken: '${token}'),
      ),
    );
  }

  //pop up
  void _showSimpleDialog(context, index) async{
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Apakah Anda Yakin?",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        pid = index + 1;
                        add();
                      },
                      child: Text('Ya'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Tidak'),
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }
}
