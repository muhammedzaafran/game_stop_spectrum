import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getCategoryData() async {
    final QuerySnapshot categoryData =
        await _firestore.collection('categories').get();
    return categoryData.docs;
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getCategoryProductData(
      String categoryId) async {
    final QuerySnapshot productData = await _firestore
        .collection('products')
        .where('categoryId', isEqualTo: categoryId)
        .get();
    return productData.docs;
  }
}
