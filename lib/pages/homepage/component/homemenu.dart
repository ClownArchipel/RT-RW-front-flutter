import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/pages/product/product.dart';

class HomeMenu extends StatelessWidget {
  final double? size;
  HomeMenu({ Key? key, this.size ,}) : super(key: key);
  final List lmenu = [
    "Beli Voucher",
    // "Connect Wifi"
  ];
  final List iconmenu = [
    Icons.shopping_cart,
    // Icons.login
  ];
  final List routemenu=[
    ProductGrid()
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return Container(   
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          padding: const EdgeInsets.symmetric(vertical: 5),    
          color: kPrimaryColor,  
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => routemenu[index]));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconmenu[index]),
                SizedBox(width: 10,),
                Text(lmenu[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'FjallaOne',fontSize: 30
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: lmenu.length,
    );
  }
}