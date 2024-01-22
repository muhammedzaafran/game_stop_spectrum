class ProductModel {
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

  ProductModel(
      {required this.productId,
      required this.categoryId,
      required this.productName,
      required this.categoryName,
      required this.price,
      required this.productImage,
      required this.productDescription,
      required this.createdAt,
      required this.updatedAt,
      required this.consoleType});

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
    };
  }
}
