
// class ShopProduct {

//   String? image;
//   String? title;
//   String? price;

// }
class ShopProduct {
  String? image;
  String? title;
  String? price;

  ShopProduct(this.image, this.title, this.price,);

  ShopProduct.fromJson(Map json)
      : image = json['image'],
        title = json['name'],
        price = json['price'].toString();

  Map toJson() {
    return {
      'image': image,
      'name': title,
      'price': price,
    };
  }
}

