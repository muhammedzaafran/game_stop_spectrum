// import 'package:flutter/material.dart';
//
// class CustomBottomSheet extends StatefulWidget {
//   @override
//   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// }
//
// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).pop(); // Close the bottom sheet when tapped outside
//       },
//       child: Container(
//         height: 200, // Set the desired height for your bottom sheet
//         color: Colors.transparent, // Make the background transparent
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: const Radius.circular(10.0),
//               topRight: const Radius.circular(10.0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Your Bottom Sheet Title',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               // Add your custom content here
//               // Example:
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Your custom content goes here',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               // Add more widgets as needed
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void showCustomBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return CustomBottomSheet();
//     },
//   );
// }
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Bottom Sheet Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               showCustomBottomSheet(context);
//             },
//             child: Text('Show Bottom Sheet'),
//           ),
//         ),
//       ),
//     );
//   }
// }
