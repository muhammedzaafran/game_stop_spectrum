class CartModel {
  late final String productId;
  late final String categoryId;
  late final String productName;
  late final String categoryName;
  late final String price;
  late final List productImage;
  late final String productDescription;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final String consoleType;
  late final int productQuantity;
  late final double productTotalPrice;

  CartModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.price,
    required this.consoleType,
    required this.productImage,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'categoryName': categoryName,
      'price': price,
      'productImage': productImage,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'consoleType': consoleType,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      categoryName: json['categoryName'],
      price: json['price'],
      productImage: json['productImage'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
      consoleType: json['consoleType'],
    );
  }
}
