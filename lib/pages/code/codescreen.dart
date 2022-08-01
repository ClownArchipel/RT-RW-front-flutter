import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reterewe/constanst.dart';

class CodeScreen extends StatefulWidget {
  String? code;
  CodeScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Column(
              children: const [
                Text(
                  "VOUCHER",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            backgroundColor: kPrimaryColor,
            expandedHeight: _size.height / 2,
            floating: false,
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
              child: PreferredSize(
                preferredSize: const Size.fromHeight(0),
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
          )
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.08),
        child: Column(
          children: [
            Container(
              transform: Matrix4.translationValues(0, 50, 0),
              child: Container(
                color: Colors.white,
                width: _size.width / 2,
                height: 100,
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Center(
                    child: Text(
                      widget.code.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size.height * .14,
            ),
            GestureDetector(
              onTap: () async {
                Clipboard.setData(ClipboardData(text: widget.code.toString()));
              },
              child: Container(
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFFC59A55),
                ),
                child: const Center(
                  child: Text(
                    "Copy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         child: TextButton(
  //           onPressed: () {
  //             Clipboard.setData(ClipboardData(text: widget.code.toString()));
  //           },
  //           child: Text(
  //             widget.code.toString(),
  //             style: TextStyle(color: Colors.black),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
