import 'package:http/http.dart' as http;
import 'package:shop/Model/product_model.dart';
import 'package:shop/Utils/my_string.dart';

class ProductService{

  static Future<List<ProductsModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if(response.statusCode == 200){
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    }else{
      return throw Exception('Failed to load product');
    }
  }

}