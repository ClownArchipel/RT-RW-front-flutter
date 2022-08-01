import 'package:flutter/material.dart';
import 'package:reterewe/constanst.dart';
import 'package:reterewe/pages/homepage/homepage.dart';
import 'package:reterewe/pages/listorder/listorder.dart';
import 'package:reterewe/pages/profil/profil.dart';


class MyHomePage extends StatefulWidget {
  //mendeklarasikan parameter untuk class widget MyHomePage
  final int indexpage;
  final title;
  //deklarasi construct class MyHomePage
  const MyHomePage({Key? key, required this.indexpage, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // deklarasi variabel class MyHomePage
  int _selectedIndex = 0;
  String? input = '';
  String? output = '';
  //deklarasi halaman yang ditampilkan
  final _widgetOptions = [
    const Homepage(),
    Orderlist(),
    Profil(),
  ];

  //dibawah ini deklarasi fungsi ketika halaman dimuat
  @override
  void initState(){
    super.initState();

  }

  @override
  void dispose(){
    super.dispose();
  }

  //widget inti home main
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),        
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_module),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          fixedColor: kPrimaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  //fungsi ketika bottom navigation di tekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
