class ProductModel {
  String? productName;
  String? productCategory;
  String? length;
  String? height;
  String? width;
  int costPrice;
  int markedPrice;
  String? weight;
  String? size;
  int quantity;

  ProductModel({
    this.productName,
    this.productCategory,
    this.length,
    this.height,
    this.width,
    required this.costPrice,
    required this.markedPrice,
    this.weight,
    this.size,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    productName: json['productName'],
    productCategory: json['productCategory'],
    length: json['length'],
    height: json['height'],
    width: json['width'],
    costPrice: int.parse(json['costPrice']),
    markedPrice: int.parse(json['markedPrice']),
    weight: json['weight'],
    size: json['size'],
    quantity: int.parse(json['quantity']),
  );
}

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productCategory': productCategory,
      'length': length,
      'height': height,
      'width': width,
      'costPrice': costPrice,
      'markedPrice': markedPrice,
      'weight': weight,
      'size': size,
      'quantity': quantity,
    };
  }
}
