class CategoryModel {
  final String categoryId;
  final String categoryImg;
  final String categoryName;
  final dynamic createdAt;
  final dynamic updatedAt;

  CategoryModel(
      {required this.categoryId,
      required this.categoryImg,
      required this.categoryName,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryImg': categoryImg,
      'categoryName': categoryName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
