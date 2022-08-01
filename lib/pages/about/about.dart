import 'package:flutter/material.dart';
import 'package:reterewe/data/my_strings.dart';

class About extends StatefulWidget {

  const About({Key? key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}


class AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1, brightness: Brightness.dark,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 18,
                  child: Image.asset('assets/images/google_logo.png',height: 20,)),
                Text('ReteRewe',
                  style: TextStyle(
                    color:Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'FjallaOne'
                  ),),
                const SizedBox(width: 10,)      
              ],
            ),// overflow menu
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/bg_polygon.png',
                    fit: BoxFit.cover, height: double.infinity, width: double.infinity, ),
                  Container(height: double.infinity, width: double.infinity, color: Colors.black.withOpacity(0.5)),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            primary: Colors.amber, elevation: 0
                          ),
                          child: Text("CONTACT US", style: TextStyle(color: Colors.white),),
                          onPressed: (){},
                        ),
                        Container(
                          width : 220,
                          child: Text("Fusce Dictum Tristique Elit Nec Laculis", textAlign : TextAlign.center,  style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[400])),
                        )

                      ],
                    )
                  ),
                ],
              ),
            ),
            Container(height: 15),
            Text("Our Team", style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[800])),
            Container(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Adams G", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("Executive Officer", style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Betty L", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("Marketing", style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Roberts", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("Business Analyst", style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                )
              ],
            ),
            Container(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Miller W", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("UX Designer", style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Kevin John", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("Web Developer",style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/photo_female_6.jpg'),
                      ),
                      Container(height: 8),
                      Text("Laura M", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[600])),
                      Container(height: 4),
                      Text("Mobile Dev", style:TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[400])),
                    ],
                  ),
                )
              ],
            ),
            Container(height: 25),
            Text("Mission", style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[800])),
            Container(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(MyStrings.long_lorem_ipsum, textAlign : TextAlign.justify,style:TextStyle(fontWeight: FontWeight.w300,color: Colors.grey[500])),
            ),
            Container(height: 25),
            Text("Address", style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[800])),
            Container(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/mapsloc.png', height: 150, width: double.infinity, fit: BoxFit.cover),
                  Container(height: 15),
                  Text("Ketintang, Kec. Gayungan, Kota Surabaya", style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[400])),
                  Text("Jawa Timur, Indonesia", style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[600])),
                  Text("60231", style:TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[600])),
                ],
              ),
            ),
            Container(height: 15),
          ],
        ),
      ),
    );
  }
}

