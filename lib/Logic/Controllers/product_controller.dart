import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/Model/product_model.dart';
import 'package:shop/Services/product_service.dart';

class ProductController extends GetxController {
  RxList<ProductsModel> productList = <ProductsModel>[].obs;
  RxList<ProductsModel> favoritesList = <ProductsModel>[].obs;
  RxBool isLoading = true.obs;
  GetStorage storage = GetStorage();
  static final favoritesKey = 'isFavoritesList';

  @override
  void onInit() {
    super.onInit();
    getProducts();
    List? storageList = storage.read<List>(favoritesKey);
    if (storageList != null) {
      favoritesList =
          storageList.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
  }

  void getProducts() async {
    var products = await ProductService.getProduct();
    try {
      // isLoading.value = true;
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for Favorites Screen

  void manageFavorite(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove(favoritesKey);
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write(favoritesKey, favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }
}
