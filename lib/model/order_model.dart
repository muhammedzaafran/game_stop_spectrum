class OrderModel {
  late final String productId;
  late final String categoryId;
  late final String productName;
  late final String categoryName;
  late final String price;
  late final List<dynamic> productImage;
  late final String productDescription;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final String consoleType;
  late final int productQuantity;
  late final double productTotalPrice;
  late final String customerId;  // Added field
  late final String customerName;
  late final String customerPhone;
  late final String customerAddress;

  OrderModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.price,
    required this.productImage,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.consoleType,
    required this.productQuantity,
    required this.productTotalPrice,
    required this.customerId,  // Added parameter
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
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
      'productTotalPrice': productTotalPrice,
      'customerId': customerId,  // Added field
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerAddress': customerAddress,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      productId: json['productId'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      categoryName: json['categoryName'],
      price: json['price'],
      productImage: json['productImage'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      consoleType: json['consoleType'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
      customerId: json['customerId'],  // Added field
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      customerAddress: json['customerAddress'],
    );
  }
}
