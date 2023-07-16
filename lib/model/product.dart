class ProductModel {
  String? productName;
  String? productCategory;
  String? length;
  String? width;
  String? breadth;
  String? costPrice;
  String? marketPrice;
  String? weight;
  String? size;
  String? quantity;

  ProductModel({
    this.productName,
    this.productCategory,
    this.length,
    this.width,
    this.breadth,
    this.costPrice,
    this.marketPrice,
    this.weight,
    this.size,
    this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productCategory: json['productCategory'],
      length: json['length'],
      width: json['width'],
      breadth: json['breadth'],
      costPrice: json['costPrice'],
      marketPrice: json['marketPrice'],
      weight: json['weight'],
      size: json['size'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productCategory': productCategory,
      'length': length,
      'width': width,
      'breadth': breadth,
      'costPrice': costPrice,
      'marketPrice': marketPrice,
      'weight': weight,
      'size': size,
      'quantity': quantity,
    };
  }
}
