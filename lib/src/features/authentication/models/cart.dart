
class CartModel {
  final String productId;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final int productQuantity;
  final double productTotalPrice;

  CartModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice,
      
    };
  }

  // Create a UserModel instance from a JSON map
  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      productName: json['productName'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      productImage: json['productImage'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
    );
  }
}