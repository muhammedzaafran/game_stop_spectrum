// // ... (your existing imports)
//
// class ProductDetailsScreen extends StatefulWidget {
//   ProductModel productModel;
//   ProductDetailsScreen({Key? key, required this.productModel});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   User? user = FirebaseAuth.instance.currentUser;
//   int currentindex = 0;
//   final CarouselController carouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppConstant.black,
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "GET YOUR GAMES HERE ",
//             style: TextStyle(fontFamily: 'BebasNeue-Regular', fontSize: 35),
//           ),
//           backgroundColor: AppConstant.transparent,
//           elevation: 0,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             alignment: Alignment.center,
//             width: Get.width,
//             height: Get.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CarouselSlider.builder(
//                   // ... (your existing CarouselSlider code)
//                 ),
//                 const SizedBox(height: 13),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: Get.height * 0.4,
//                     child: Card(
//                       elevation: 5.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [Colors.blue, Colors.teal],
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             // ... (your existing Card content)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//
//       ),
//     );
//   }
// }
