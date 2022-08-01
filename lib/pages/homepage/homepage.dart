import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/pages/homepage/component/homemenu.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {

    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      body:NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              expandedHeight: size.height/2,
              floating: false,
              automaticallyImplyLeading: false,
              flexibleSpace: Center(
                child: PreferredSize(
                    preferredSize: const Size.fromHeight(30),
                    child: Container(
                      transform: Matrix4.translationValues(0, 50, 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[500],
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[50],
                          radius: 58,
                          child: Image.asset('assets/images/logorete.png')),
                      ),
                    ),
                  ),
              ),
              title: TextButton(
                onPressed: (){
                },
                style: const ButtonStyle(
                ),
                child: const Text('RETEWE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (String value){},
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "About Us",
                      child: Text("About Us"),
                    ),
                  ],
                )
              ],
            )
          ];
        },
        // body: ListBeranda(doc!, onReorder).getView()),
        body: SizedBox(
          // width: size.width - 20,
          child:HomeMenu(),
        ),
    ));
  
  }
}