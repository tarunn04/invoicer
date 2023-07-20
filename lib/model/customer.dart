class CustomerModel {
  String? id; // The document ID
  String? customerName;
  String? customerEmail;
  String? customerPhone;
 

  CustomerModel({
    this.id, // Include the document ID in the constructor
    this.customerName,
    this.customerEmail,
    this.customerPhone,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'], // Assign the 'id' from the JSON to the class property
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      customerPhone: json['customerPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include the 'id' in the JSON representation
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerPhone': customerPhone,
    };
  }
}
