import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invoicer/model/product.dart';

class ProductPageController extends GetxController {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  final RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      final querySnapshot = await products.get();
      productList.value = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
