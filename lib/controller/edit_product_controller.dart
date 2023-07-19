import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoicer/model/product.dart';

class EditProductController extends GetxController{

  CollectionReference products = FirebaseFirestore.instance.collection('products');

  final GlobalKey<FormState> ProductEditformKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCategoryController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController markedPriceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  clearTextController() {
    productNameController.clear();
    productCategoryController.clear();
    lengthController.clear();
    widthController.clear();
    heightController.clear();
    costPriceController.clear();
    markedPriceController.clear();
    weightController.clear();
    sizeController.clear();
    quantityController.clear();
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
    void refillTextFields(Map<String, dynamic> product) {
    productNameController.text = product['productName'] ?? '';
    productCategoryController.text = product['productCategory'] ?? '';
    lengthController.text = product['length']?.toString() ?? '';
    widthController.text = product['width']?.toString() ?? '';
    heightController.text = product['height']?.toString() ?? '';
    weightController.text = product['weight']?.toString() ?? '';
    sizeController.text = product['size'] ?? '';
    quantityController.text = product['quantity']?.toString() ?? '';
    costPriceController.text = product['costPrice']?.toString() ?? '';
    markedPriceController.text = product['markedPrice']?.toString() ?? '';
  }

  Future<void> updateProduct() async {
    if (ProductEditformKey.currentState!.validate()) {
      String? productName = productNameController.text.capitalizeFirst?.trim();


      // Create a new product object
     ProductModel updatedProduct = ProductModel(
      productName: productName,
      productCategory: productCategoryController.text.capitalizeFirst?.trim(),
      length: lengthController.text,
      width: widthController.text,
      height: heightController.text,
      costPrice: int.tryParse(costPriceController.text) ?? 0,
      markedPrice: int.tryParse(markedPriceController.text) ?? 0,
      weight: lengthController.text,
      size: sizeController.text,
      quantity: int.tryParse(quantityController.text) ?? 0,
      );
      try {
        // Update the product in Firestore using the documentId
        await products.doc(productName).update(updatedProduct.toJson());

        // Clear text controllers after successful update
        clearTextController();

        // Show a success message or perform other actions if needed
        Get.snackbar(
          'Product Updated',
          'Product details have been updated successfully!',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        // Handle errors while updating the product
        Get.snackbar(
          'Error',
          '$e',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }     
  }
  
  
}