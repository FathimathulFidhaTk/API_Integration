import 'package:api_integration/Model/product_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<ProductModel>> getProduct() async {
    var resp = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (resp.statusCode == 200) {
      var data = resp.body;
      return ProductModelFromJson(data);
    } else {
     throw Exception();
    }

  }

}