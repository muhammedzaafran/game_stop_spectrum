import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetProductDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getProductData() async {
    final QuerySnapshot productData = await _firestore
        .collection('products')
        .get();
    return productData.docs;
  }
}