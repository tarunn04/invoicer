import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  RxList<Map<String, dynamic>> originalProducts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredProducts = <Map<String, dynamic>>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductCategories();
  }

  void fetchProductCategories() async {
    try {
      final querySnapshot = await products.get();
      List<DocumentSnapshot> productDocs = querySnapshot.docs;

      for (var productDoc in productDocs) {
        Map<String, dynamic> productData =
            productDoc.data() as Map<String, dynamic>;
        List<dynamic> productsList = productData['products'];

        for (var product in productsList) {
          originalProducts.add(product);
        }
      }

      filteredProducts.value = originalProducts;
    } catch (e) {
      print('Error fetching product categories: $e');
    }
  }

  void filterProducts(String query) {
    searchQuery.value = query.toLowerCase();

    if (searchQuery.value.isEmpty) {
      filteredProducts.value = originalProducts;
    } else {
      filteredProducts.value = originalProducts
          .where((product) =>
              product['productName']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.value) ||
              product['costPrice']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.value))
          .toList();
    }
  }
}
