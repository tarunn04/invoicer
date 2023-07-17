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

  @override
  void onInit() {
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
      originalProductList = querySnapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productList.value = List<ProductModel>.from(originalProductList);
    } catch (e) {
      print('Error fetching products: $e');
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