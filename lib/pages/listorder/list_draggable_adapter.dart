import 'package:flutter/material.dart'; //import pakcage material
import 'package:reterewe/models/Order.dart';
import 'package:reterewe/pages/code/codescreen.dart';
import 'package:reterewe/pages/snap/snap.dart';

class ListOrder {
  //deklarasi variabel global
  List items = <Order>[];
  Function onReorder;

  //deklarasi construct ListBeranda
  ListOrder(this.items, this.onReorder);

  //widget fungsi untuk mengambil data
  Widget getView() {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      children: List.generate(
        this.items.length,
        (index) {
          return ItemTile(Key('$index'), index, this.items[index]);
        },
      ),
    );
  }

  //fungsi untuk bisa merubah urutan list
  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final Order item = this.items.removeAt(oldIndex);
    this.items.insert(newIndex, item);
    this.onReorder();
  }
}

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {
  final Order object;
  final int index;
  final Key key;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[200],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  ItemTile(this.key, this.index, this.object);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            if (object.status == "pending") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SnapScreen(transactionToken: '${object.snaptoken}'),
                ),
              );
            } else {
              if (object.status == "expire") {
                _showSimpleDialog(context, index);
              } else {
                String? vcode = object.code;                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CodeScreen(code:vcode ),
                  ),
                );
              }
            }
          },
          child: ListTile(
            key: PageStorageKey<int>(index),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(">>${object.orderid.toString()}",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text(object.status.toString(),
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        Divider(height: 0)
      ],
    );
  }

  void _showSimpleDialog(context, index) async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      "Pembayaranmu Gagal !!!",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali'),
              ),
            )
          ],
        );
      },
    );
  }
}
