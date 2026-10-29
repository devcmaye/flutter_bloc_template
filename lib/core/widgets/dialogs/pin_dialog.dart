// import 'package:flutter/material.dart';

// class PinDialog extends StatelessWidget {
//   const PinDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text("Enter PIN"),
//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(
//                 6,
//                 (index) => Container(
//                   width: 40,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.teal),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             _buildKeypad(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildKeypad() {
//     return GridView.builder(
//       shrinkWrap: true,
//       itemCount: 12,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 1.8,
//       ),
//       itemBuilder: (_, i) {
//         if (i == 9) return const SizedBox();
//         if (i == 11) {
//           return const Icon(Icons.backspace);
//         }

//         final number = i == 10 ? 0 : i + 1;

//         return Center(
//           child: Text(number.toString(), style: const TextStyle(fontSize: 18)),
//         );
//       },
//     );
//   }
// }
