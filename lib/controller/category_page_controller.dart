
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoicer/model/product.dart';
import 'package:invoicer/screens/category_product.dart';

class CategoryProductPageController extends GetxController{
  CollectionReference products = FirebaseFirestore.instance.collection('products');
  
  RxList<ProductModel> productsList = RxList<ProductModel>();

  TextEditingController searchController = TextEditingController();
  RxString category = ''.obs;
  RxList<ProductModel> originalProductsList = RxList<ProductModel>();

  Future<void> fetchDataFromCategory(String Category)async {
    category.value = Category;
    products.where("productCategory", isEqualTo: Category).get().then((value) {
      value.docs.forEach((element) {
        
        var save = ProductModel.fromJson(element.data() as Map<String, dynamic>);

        productsList.add(save);
        originalProductsList.add(save);
      });
    });
  }

  void searchProducts(String query) {
    var lowercaseQuery = query.trim().toLowerCase();
    if(lowercaseQuery.isEmpty){
      productsList.value = List<ProductModel>.from(originalProductsList);
    }else{
      productsList.value = List<ProductModel>.from(originalProductsList.where((element) => element.productName!.toLowerCase().contains(lowercaseQuery)));
    }
  }
}