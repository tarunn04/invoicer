import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/widget/toast_message.dart';

class ProductController extends GetxController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCategoryController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController breadthController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController marketPriceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  clearTextController() {
    productNameController.clear();
    productCategoryController.clear();
    lengthController.clear();
    widthController.clear();
    breadthController.clear();
    costPriceController.clear();
    marketPriceController.clear();
    weightController.clear();
    sizeController.clear();
    quantityController.clear();
  }

  CollectionReference products = FirebaseFirestore.instance.collection('products');
  final GlobalKey<FormState> ProductformKey = GlobalKey<FormState>();

  @override
  void onClose() {
    productNameController.dispose();
    productCategoryController.dispose();
    lengthController.dispose();
    widthController.dispose();
    breadthController.dispose();
    costPriceController.dispose();
    marketPriceController.dispose();
    weightController.dispose();
    sizeController.dispose();
    quantityController.dispose();
    super.onClose();
  }

  String? validate(String? value, String? textBody) {
    if (value == null || value.isEmpty) {
      return '$textBody is required';
    }
    return null;
  }

  String? validateDimention(String? value, String? textBody) {
    // Your validation logic here
    return null;
  }

  Future addToDb() async{
  if (ProductformKey.currentState!.validate()) {
    try {
      // Create a new product object
      Map<String, dynamic> newProduct = {
        'productName': productNameController.text.capitalizeFirst?.trim(),
        'productCategory': productCategoryController.text.capitalizeFirst?.trim(),
        'length': lengthController.text,
        'width': widthController.text,
        'breadth': breadthController.text,
        'costPrice': costPriceController.text,
        'marketPrice': marketPriceController.text,
        'weight': weightController.text,
        'size': sizeController.text,
        'quantity': quantityController.text,
      };

      // Get the category value
      String? category = productCategoryController.text.capitalizeFirst;

      // Check if the category document already exists
      products.doc(category).get().then((categoryDoc) {
        if (categoryDoc.exists) {
          // Category exists, add the product under the existing category
          products.doc(category).update({
            'products': FieldValue.arrayUnion([newProduct])
          }).then((value) {
            ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: Text("Product Added Successfully"),
            ));
            clearTextController();
          });
        } else {
          // Category doesn't exist, create a new category document
          products.doc(category).set({
            'products': [newProduct]
          }).then((value) {
            ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: Text("Product Added Successfully"),
            ));
            clearTextController();
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

}
