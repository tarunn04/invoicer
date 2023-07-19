class ProductModel {
  String? id; // The document ID
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
    this.id, // Include the document ID in the constructor
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
      id: json['id'], // Assign the 'id' from the JSON to the class property
      productName: json['productName'],
      productCategory: json['productCategory'],
      length: json['length'],
      height: json['height'],
      width: json['width'],
      costPrice: json['costPrice'],
      markedPrice: json['markedPrice'],
      weight: json['weight'],
      size: json['size'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include the 'id' in the JSON representation
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
