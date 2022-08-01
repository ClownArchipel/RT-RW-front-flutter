class Order {
  String? id;
  String? number;
  String? transactionid;
  String? orderid;
  String? grossamount;
  String? paymenttype;  
  String? pdfurl;
  String? quantity;
  String? status;
  String? snaptoken;
  String? userid;
  String? productid;
  String? code;
  String? duration;

  Order(this.id, this.grossamount, this.number,this.orderid,this.paymenttype,this.pdfurl,this.productid,this.quantity,this.snaptoken,this.status,this.transactionid,this.userid,this.code,this.duration);

  Order.fromJson(Map json)
      : id = json['id'].toString(),
        grossamount = json['gross_amount'].toString(),
        number = json['number'].toString(),
        orderid = json['order_id'].toString(),
        paymenttype = json['payment_type'],
        pdfurl = json['pdf_url'].toString(),
        productid = json['product_id'].toString(),
        quantity = json['quantity'].toString(),
        snaptoken = json['snap_token'].toString(),
        status = json['status'],
        transactionid = json['transaction_id'],
        code = json['code'],
        duration = json['duration'].toString(),
        userid = json['user_id'].toString();
        

  Map toJson() {
    return {
      'id': id,
      'gross_amount': grossamount,
      'number': number,
      'order_id': orderid,
      'payment_type': paymenttype,
      'pdf_url': pdfurl,
      'product_id': productid,
      'quantity': quantity,
      'snap_token': snaptoken,
      'status': status,
      'transaction_id': transactionid,
      'code': code,
      'duration': duration,
      'user_id': userid,
    };
  }
}