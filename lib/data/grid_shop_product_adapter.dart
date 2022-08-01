import 'package:flutter/material.dart';
import 'package:reterewe/data/img.dart';
import 'package:reterewe/data/my_colors.dart';
import 'package:reterewe/models/shop_product.dart';
import 'package:reterewe/widgets/my_text.dart';

class GridShopProductAdapter {
  List items = <ShopProduct>[];
  List<Widget> itemsTile = <ItemTile>[];

  GridShopProductAdapter(this.items, onItemClick) {
    for (var i = 0; i < items.length; i++) {
      itemsTile.add(ItemTile(index: i, object: items[i], onClick: onItemClick));
    }
  }

  Widget getView() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      childAspectRatio: 0.8,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      padding: const EdgeInsets.all(4),
      crossAxisCount: 2,
      children: itemsTile,
    );
  }
}

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {
  final ShopProduct? object;
  final int? index;
  final Function? onClick;

  const ItemTile({
    Key? key,
    @required this.index,
    @required this.object,
    @required this.onClick,
  })  : assert(index != null),
        assert(object != null),
        assert(onClick != null),
        super(key: key);

  void onItemClick(ShopProduct obj) {
    onClick!(index, obj);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ onItemClick(object!); },
      child: Container(
        padding: EdgeInsets.all(2),
        child: Card(
            margin: EdgeInsets.all(0),
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(Img.get('logorete.png'),
                      width: double.infinity, fit: BoxFit.cover),
                ),
                Container(height: 5),
                Row(
                  children: <Widget>[
                    Container(width: 10),
                    Expanded(
                      child: Text(object!.title.toString(),
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_90),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Container(height: 5),
                Row(
                  children: <Widget>[
                    Container(width: 10),
                    const Spacer(),
                    Text('Rp. ${object!.price.toString()}',
                        style: MyText.subhead(context)!.copyWith(
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold)),
                    Container(width: 10),
                  ],
                ),
                Container(height: 10),
              ],
            )),
      ),
    );
  }
}
