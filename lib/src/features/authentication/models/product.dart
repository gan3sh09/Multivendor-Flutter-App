
class ProductModel {
  final String? productId;
  final String productName;
  final String productDescription;
  final int productPrice;
  final String productImage;

  ProductModel({
    this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'productId' : productId,
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
    };
  }

  // Create a UserModel instance from a JSON map
  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      productId : json['productId'],
      productName: json['productName'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      productImage: json['productImage'],
    );
  }
}