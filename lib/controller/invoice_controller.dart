import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InvoiceController extends GetxController{

  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  RxMap customer = {}.obs;
  RxBool isAdded = false.obs;

  clearController(){
    customerNameController.clear();
    customerEmailController.clear();
    customerPhoneController.clear();
  }

  String? validate(String? value, String text) {
    if (value == null || value.isEmpty) {
      return '$text is required';
    }
    return null;
  }
  String? validateEmail(String? value, String text) {
    if (value == null || value.isEmpty) {
      return '$text is required';
    }
    if(!GetUtils.isEmail(value)){
      return "Enter a valid email";
    }
    return null;
  }


  String? validatePhone(String? value, String text) {
    if (value == null || value.isEmpty) {
      return '$text is required';
    }
    if(value.length != 10){
      return "Enter a valid phone number";
    }
    return null;
  }

  Future<void> addCustomer(key) async{
    if(key.currentState!.validate()){
      customer['customerName'] = customerNameController.text.capitalizeFirst!.trim();
      customer['customerEmail'] = customerEmailController.text;
      customer['customerPhone'] = customerPhoneController.text;
      isAdded.value = true;
      Get.toNamed("billing");  

    }
  }

  Future<void> editCustomer(key) async{
    if(key.currentState!.validate()){
      customer['customerName'] = customerNameController.text.capitalizeFirst!.trim();
      customer['customerEmail'] = customerEmailController.text;
      customer['customerPhone'] = customerPhoneController.text;

      Get.toNamed("billing");     
    }
  }
} 