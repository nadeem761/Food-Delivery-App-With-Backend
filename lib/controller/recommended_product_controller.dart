import 'package:food_delivery_app/data/rep/popular_product.dart';
import 'package:food_delivery_app/data/rep/recommended_product_repo.dart';
import 'package:food_delivery_app/models/popular_products_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    final response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      //print("got it");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      update();
      //print(_popularProductList);
      _isLoaded = true;
    } else {
      //print("not goted");
    }
  }
}
