import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invoicer/model/json.dart';
import 'package:invoicer/model/product.dart';

class ProductPageController extends GetxController {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  final RxList<ProductModel> productList = <ProductModel>[].obs;
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  List<ProductModel> originalProductList = [];
  RxSet categorySet = <String>{}.obs;
  // RxInt len = 0.obs;

  @override
  void onInit() {
    fetchUniqueCategories();
    fetchProducts();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchProducts() async {
  try {
    final querySnapshot = await products.get();
    originalProductList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      data['id'] = doc.id; // Add the document ID to the data map

      return ProductModel.fromJson(data);
    }).toList();


    productList.value = List<ProductModel>.from(originalProductList);
  } catch (e) {
    print('Error fetching products: $e');
  }
}
  Future<void> fetchUniqueCategories() async {
    try {
      final querySnapshot = await products.get();

      querySnapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>?;
        final category = data?['productCategory'] as String?;
        if (category != null) {
          categorySet.add(category);
        }
      });

      // len.value = categorySet.length;
    } catch (e) {
      print('Error fetching unique categories: $e');
    }
  }

  void searchProducts(String query) {
    final lowercaseQuery = query.trim().toLowerCase();
    searchQuery.value = lowercaseQuery; 
    if (lowercaseQuery.isEmpty) {
      productList.value = List<ProductModel>.from(originalProductList);
    } else {
      productList.value = originalProductList.where((product) {
        final productName = product.productName!.toLowerCase();
        return productName.contains(lowercaseQuery);
      }).toList();
    }
  }
 


}