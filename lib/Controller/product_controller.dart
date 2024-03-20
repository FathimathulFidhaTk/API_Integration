import 'package:api_integration/Server/http_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  @override

  void onInit(){
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var product = await HttpService.getProduct();
      if(product !=null){
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }

  }


}