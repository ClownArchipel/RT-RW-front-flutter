import 'dart:convert'; // import pakcage untuk konversi JSON
import 'package:http/http.dart' as http; //import package untuk komunikasi hhtp dan di alias menjadi "http"
import 'package:shared_preferences/shared_preferences.dart'; // import package shared preferences untuk penggunaan lokal storage

class Network{
  final String _url = 'https://94ea-114-5-241-252.ap.ngrok.io/api';//mendeklarasikan base url web service / api service
  var token; // deklarasi token sebagai penyimpan token JWT

  _getToken() async { 
    SharedPreferences? localStorage = await SharedPreferences.getInstance(); // mendeklarasikan variabel untuk penggunaan shared preferences
    var _token= localStorage.getString('token'); //memasukan token JWT ke variabel _token
    token = json.decode(_token!); //konversi JSON ke tipe data yang dikenali variabel _token
  }//fungsi mengambil token
  
  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl; // mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    return await http.post(
        myUri,//full url
        body: jsonEncode(data),//konten body
        headers: _setHeaders()//set header
    );//proses komunikasi http dengan method post
  }//fungsi autentikasi

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    return await http.post(
        myUri,//full url
        body: data,//konten body
    );//proses komunikasi http dengan method post
  }//fungsi register

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    return await http.get(
        myUri,//full url
    );//proses komunikasi http dengan method get
  }//fungsi mengambil data

  Future getDocuments(apiUrl) async{
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    return await http.get(
        myUri//full url
    );
  }

  getDatagen(apiUrl) async {
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    await _getToken();//memanggil fungsi get token
    return await http.get(
        myUri,//full url
        headers: _setHeaders()//set header
    );//proses komunikasi http dengan method get
  }

  getDataof(apiUrl) async {
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    return await http.get(
        myUri,
        headers: _setHeaders()
    );//proses komunikasi http dengan method get
  }

   setLogout(apiUrl) async {
    var fullUrl = _url + apiUrl;// mendeklarasikan url dengan menambahkan base url (_url) dan endpoint (apiUrl)
    Uri myUri = Uri.parse(fullUrl);//konversi tipe data String ke Uri
    await _getToken();
    return await http.post(
        myUri,
        headers: _setHeaders()
    );//proses komunikasi http dengan method post
  }//fungsi logout

  _setHeaders() => {
    'Content-type' : 'application/json',//mendeklarasikan tipe konten
    'Accept' : 'application/json',//mendeklarasikan penerimaan konten
    'Authorization' : 'Bearer $token'//mendeklarasikan tipe autentikasi
  };//fungsi setting header

  

}