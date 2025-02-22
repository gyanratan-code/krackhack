// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:newser/views/footer.dart';
// // // // // import 'package:newser/views/header.dart';
// // // // //
// // // // // class AddNews extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: SingleChildScrollView(
// // // // //         child: Container(
// // // // //           color: Colors.white,
// // // // //           child: Column(
// // // // //             children: [
// // // // //               HeaderWidget(), // Assuming you have a Header widget
// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.all(16.0),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Center(
// // // // //                       child: Text(
// // // // //                         'Add A News',
// // // // //                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // // //                       ),
// // // // //                     ),
// // // // //                     SizedBox(height: 4),
// // // // //                     Center(
// // // // //                       child: Text(
// // // // //                         'Hi Naman, Add your news...',
// // // // //                         style: TextStyle(fontSize: 16, color: Colors.grey),
// // // // //                       ),
// // // // //                     ),
// // // // //                     SizedBox(height: 16),
// // // // //                     _buildTextField('Title (20 words limit)', 50),
// // // // //                     _buildTextField('Image', 50),
// // // // //                     _buildTextField('Categories', 50),
// // // // //                     _buildTextField('Description (80 words limit)', 300, maxLines: 50),
// // // // //                     _buildTextField('Give your long description here...', 400, maxLines: 50),
// // // // //                     _buildTextField('All Images', 100, maxLines: 5),
// // // // //                     SizedBox(height: 16),
// // // // //                     ElevatedButton(
// // // // //                       onPressed: () {
// // // // //                         Navigator.pushNamed(context, "/new_news_confirmation");
// // // // //                       },
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: Colors.black,
// // // // //                         foregroundColor: Colors.white,
// // // // //                         minimumSize: Size(double.infinity, 50),
// // // // //                         shape: RoundedRectangleBorder(
// // // // //                           borderRadius: BorderRadius.circular(8), // Decreased border radius
// // // // //                         ),
// // // // //                       ),
// // // // //                       child: Text('Done'),
// // // // //                     ),
// // // // //                     SizedBox(height: 8),
// // // // //                     ElevatedButton(
// // // // //                       onPressed: () {},
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: Colors.grey.shade300,
// // // // //                         foregroundColor: Colors.black,
// // // // //                         minimumSize: Size(double.infinity, 50),
// // // // //                         shape: RoundedRectangleBorder(
// // // // //                           borderRadius: BorderRadius.circular(8), // Decreased border radius
// // // // //                         ),
// // // // //                       ),
// // // // //                       child: Text('Save Draft'),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       bottomNavigationBar: FooterWidget(), // Assuming you have a Footer widget
// // // // //     );
// // // // //   }
// // // // //
// // // // //   Widget _buildTextField(String hint, double height, {int maxLines = 1}) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.only(bottom: 12.0),
// // // // //       child: SizedBox(
// // // // //         height: height,
// // // // //         child: TextField(
// // // // //           maxLines: maxLines,
// // // // //           decoration: InputDecoration(
// // // // //             hintText: hint,
// // // // //             border: OutlineInputBorder(
// // // // //               borderRadius: BorderRadius.circular(8.0),
// // // // //             ),
// // // // //             filled: true,
// // // // //             fillColor: Colors.white,
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:newser/views/footer.dart';
// // // // import 'package:newser/views/header.dart';
// // // //
// // // // class AddNews extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Column(
// // // //         children: [
// // // //           const HeaderWidget(), // Fixed Header
// // // //           Expanded(
// // // //             child: SingleChildScrollView(
// // // //               child: Container(
// // // //                 color: Colors.white,
// // // //                 padding: const EdgeInsets.all(16.0),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Center(
// // // //                       child: Text(
// // // //                         'Add A News',
// // // //                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                     ),
// // // //                     SizedBox(height: 4),
// // // //                     Center(
// // // //                       child: Text(
// // // //                         'Hi Naman, Add your news...',
// // // //                         style: TextStyle(fontSize: 16, color: Colors.grey),
// // // //                       ),
// // // //                     ),
// // // //                     SizedBox(height: 16),
// // // //                     _buildTextField('Title (20 words limit)', 50),
// // // //                     _buildTextField('Image', 50),
// // // //                     _buildTextField('Categories', 50),
// // // //                     _buildTextField('Description (80 words limit)', 300, maxLines: 50),
// // // //                     _buildTextField('Give your long description here...', 400, maxLines: 50),
// // // //                     _buildTextField('All Images', 100, maxLines: 5),
// // // //                     SizedBox(height: 16),
// // // //                     ElevatedButton(
// // // //                       onPressed: () {
// // // //                         Navigator.pushNamed(context, "/new_news_confirmation");
// // // //                       },
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.black,
// // // //                         foregroundColor: Colors.white,
// // // //                         minimumSize: Size(double.infinity, 50),
// // // //                         shape: RoundedRectangleBorder(
// // // //                           borderRadius: BorderRadius.circular(8),
// // // //                         ),
// // // //                       ),
// // // //                       child: Text('Done'),
// // // //                     ),
// // // //                     SizedBox(height: 8),
// // // //                     ElevatedButton(
// // // //                       onPressed: () {},
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.grey.shade300,
// // // //                         foregroundColor: Colors.black,
// // // //                         minimumSize: Size(double.infinity, 50),
// // // //                         shape: RoundedRectangleBorder(
// // // //                           borderRadius: BorderRadius.circular(8),
// // // //                         ),
// // // //                       ),
// // // //                       child: Text('Save Draft'),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       bottomNavigationBar: const FooterWidget(selectedIndex: 2,), // Fixed Footer
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildTextField(String hint, double height, {int maxLines = 1}) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.only(bottom: 12.0),
// // // //       child: SizedBox(
// // // //         height: height,
// // // //         child: TextField(
// // // //           maxLines: maxLines,
// // // //           decoration: InputDecoration(
// // // //             hintText: hint,
// // // //             border: OutlineInputBorder(
// // // //               borderRadius: BorderRadius.circular(8.0),
// // // //             ),
// // // //             filled: true,
// // // //             fillColor: Colors.white,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:newser/views/footer.dart';
// // // import 'package:newser/views/header.dart';
// // // import 'package:newser/views/new_news_confirmation.dart';
// // //
// // // class AddNews extends StatefulWidget {
// // //   @override
// // //   _AddNewsState createState() => _AddNewsState();
// // // }
// // //
// // // class _AddNewsState extends State<AddNews> {
// // //   final TextEditingController _titleController = TextEditingController();
// // //   final TextEditingController _descriptionController = TextEditingController();
// // //   final TextEditingController _longDescriptionController = TextEditingController();
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Column(
// // //         children: [
// // //           const HeaderWidget(),
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               child: Container(
// // //                 color: Colors.white,
// // //                 padding: const EdgeInsets.all(16.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     const Center(
// // //                       child: Text(
// // //                         'Add A News',
// // //                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 4),
// // //                     const Center(
// // //                       child: Text(
// // //                         'Hi Naman, Add your news...',
// // //                         style: TextStyle(fontSize: 16, color: Colors.grey),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 16),
// // //                     _buildTextField('Title (20 words limit)', _titleController, 50),
// // //                     _buildTextField('Description (80 words limit)', _descriptionController, 300, maxLines: 5),
// // //                     _buildTextField('Give your long description here...', _longDescriptionController, 400, maxLines: 10),
// // //                     const SizedBox(height: 16),
// // //
// // //                     ElevatedButton(
// // //                       onPressed: () {
// // //                         // Ensure all required fields are filled
// // //                         if (_titleController.text.trim().isEmpty ||
// // //                             _descriptionController.text.trim().isEmpty ||
// // //                             _longDescriptionController.text.trim().isEmpty) {
// // //                           ScaffoldMessenger.of(context).showSnackBar(
// // //                             const SnackBar(content: Text("All fields must be filled")),
// // //                           );
// // //                           return;
// // //                         }
// // //
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => NewNewsConfirmation(
// // //                               title: _titleController.text.trim(),
// // //                               description: _descriptionController.text.trim(),
// // //                               longDescription: _longDescriptionController.text.trim(),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.black,
// // //                         foregroundColor: Colors.white,
// // //                         minimumSize: const Size(double.infinity, 50),
// // //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // //                       ),
// // //                       child: const Text('Done'),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       bottomNavigationBar: const FooterWidget(selectedIndex: 2),
// // //     );
// // //   }
// // //
// // //   Widget _buildTextField(String hint, TextEditingController controller, double height, {int maxLines = 1}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 12.0),
// // //       child: SizedBox(
// // //         height: height,
// // //         child: TextField(
// // //           controller: controller,
// // //           maxLines: maxLines,
// // //           decoration: InputDecoration(
// // //             hintText: hint,
// // //             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
// // //             filled: true,
// // //             fillColor: Colors.white,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:iit_marketing/views/footer.dart';
// // import 'package:iit_marketing/views/newNewsConfirmation.dart';
// // // import 'package:newser/views/new_news_confirmation.dart';
// //
// // class AddNews extends StatefulWidget {
// //   @override
// //   _AddNewsState createState() => _AddNewsState();
// // }
// //
// // class _AddNewsState extends State<AddNews> {
// //   final TextEditingController _titleController = TextEditingController();
// //   final TextEditingController _descriptionController = TextEditingController();
// //   final TextEditingController _longDescriptionController = TextEditingController();
// //
// //   String _titleError = "";
// //   String _descriptionError = "";
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           // const HeaderWidget(),
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Container(
// //                 color: Colors.white,
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     SizedBox(
// //                       height: 34,
// //                     ),
// //                     const Center(
// //                       child: Text(
// //                         'Add A New Item to sell...',
// //                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     const Center(
// //                       child: Text(
// //                         'Hi Naman, Add your item to sell...',
// //                         style: TextStyle(fontSize: 16, color: Colors.grey),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //
// //                     // Title Field (20 Words Limit)
// //                     _buildTextField(
// //                       'Title (20 words limit)',
// //                       _titleController,
// //                       50,
// //                       maxWords: 20,
// //                       errorMessage: _titleError,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _titleError = _validateWordLimit(value, 20);
// //                         });
// //                       },
// //                     ),
// //
// //                     // Description Field (80 Words Limit)
// //                     _buildTextField(
// //                       'Description (80 words limit)',
// //                       _descriptionController,
// //                       300,
// //                       maxLines: 5,
// //                       maxWords: 80,
// //                       errorMessage: _descriptionError,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _descriptionError = _validateWordLimit(value, 80);
// //                         });
// //                       },
// //                     ),
// //
// //                     // Long Description (No Word Limit)
// //                     _buildTextField(
// //                       'Give your long description here...',
// //                       _longDescriptionController,
// //                       400,
// //                       maxLines: 10,
// //                     ),
// //
// //                     const SizedBox(height: 16),
// //
// //                     // Done Button
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (_titleController.text.trim().isEmpty ||
// //                             _descriptionController.text.trim().isEmpty ||
// //                             _longDescriptionController.text.trim().isEmpty) {
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             const SnackBar(content: Text("All fields must be filled")),
// //                           );
// //                           return;
// //                         }
// //
// //                         if (_titleError.isNotEmpty || _descriptionError.isNotEmpty) {
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             const SnackBar(content: Text("Please fix errors before proceeding")),
// //                           );
// //                           return;
// //                         }
// //
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => NewNewsConfirmation(
// //                               title: _titleController.text.trim(),
// //                               description: _descriptionController.text.trim(),
// //                               longDescription: _longDescriptionController.text.trim(),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.black,
// //                         foregroundColor: Colors.white,
// //                         minimumSize: const Size(double.infinity, 50),
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //                       ),
// //                       child: const Text('Done'),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: const FooterWidget(selectedIndex: 2),
// //     );
// //   }
// //
// //   // ✅ Custom Text Field Widget with Word Limit Validation
// //   // Widget _buildTextField(
// //   //     String hint,
// //   //     TextEditingController controller,
// //   //     double height, {
// //   //       int maxLines = 1,
// //   //       int? maxWords,
// //   //       String errorMessage = "",
// //   //       Function(String)? onChanged,
// //   //     }) {
// //   //   return Padding(
// //   //     padding: const EdgeInsets.only(bottom: 12.0),
// //   //     child: Column(
// //   //       crossAxisAlignment: CrossAxisAlignment.start,
// //   //       children: [
// //   //         SizedBox(
// //   //           height: height,
// //   //           child: TextField(
// //   //             controller: controller,
// //   //             maxLines: maxLines,
// //   //             onChanged: (value) {
// //   //               if (maxWords != null) {
// //   //                 int wordCount = _countWords(value);
// //   //                 if (wordCount > maxWords) {
// //   //                   List<String> words = value.trim().split(RegExp(r'\s+')).take(maxWords).toList();
// //   //                   controller.text = words.join(" ");
// //   //                   controller.selection = TextSelection.collapsed(offset: controller.text.length);
// //   //                 }
// //   //               }
// //   //               if (onChanged != null) onChanged(value);
// //   //             },
// //   //             decoration: InputDecoration(
// //   //               hintText: hint,
// //   //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
// //   //               filled: true,
// //   //               fillColor: Colors.white,
// //   //             ),
// //   //           ),
// //   //         ),
// //   //         if (errorMessage.isNotEmpty)
// //   //           Padding(
// //   //             padding: const EdgeInsets.only(top: 4.0),
// //   //             child: Text(
// //   //               errorMessage,
// //   //               style: const TextStyle(color: Colors.red, fontSize: 12),
// //   //             ),
// //   //           ),
// //   //       ],
// //   //     ),
// //   //   );
// //   // }
// //
// //   Widget _buildTextField(
// //       String label, // Changed from 'hint' to 'label' for clarity
// //       TextEditingController controller,
// //       double height, {
// //         int maxLines = 1,
// //         int? maxWords,
// //         String errorMessage = "",
// //         Function(String)? onChanged,
// //       }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 12.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           SizedBox(
// //             height: height,
// //             child: TextField(
// //               controller: controller,
// //               maxLines: maxLines,
// //               onChanged: (value) {
// //                 if (maxWords != null) {
// //                   int wordCount = _countWords(value);
// //                   if (wordCount > maxWords) {
// //                     List<String> words =
// //                     value.trim().split(RegExp(r'\s+')).take(maxWords).toList();
// //                     controller.text = words.join(" ");
// //                     controller.selection =
// //                         TextSelection.collapsed(offset: controller.text.length);
// //                   }
// //                 }
// //                 if (onChanged != null) onChanged(value);
// //               },
// //               decoration: InputDecoration(
// //                 labelText: label, // 👈 This makes the label float above when clicked
// //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
// //                 filled: true,
// //                 fillColor: Colors.white,
// //               ),
// //             ),
// //           ),
// //           if (errorMessage.isNotEmpty)
// //             Padding(
// //               padding: const EdgeInsets.only(top: 4.0),
// //               child: Text(
// //                 errorMessage,
// //                 style: const TextStyle(color: Colors.red, fontSize: 12),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //
// //   // ✅ Helper Function: Count Words
// //   int _countWords(String text) {
// //     return text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
// //   }
// //
// //   // ✅ Helper Function: Validate Word Limit
// //   String _validateWordLimit(String text, int limit) {
// //     return _countWords(text) > limit ? "Exceeded the limit" : "";
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/views/footer.dart';
// import 'package:iit_marketing/views/newNewsConfirmation.dart';
//
// class AddNews extends StatefulWidget {
//   @override
//   _AddNewsState createState() => _AddNewsState();
// }
//
// class _AddNewsState extends State<AddNews> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _longDescriptionController = TextEditingController();
//
//   String _titleError = "";
//   String _descriptionError = "";
//   String? _selectedCategory; // Stores selected category
//   String _categoryError = ""; // Stores category validation error
//
//   final List<String> _categories = [
//     "Clothes",
//     "Footwear",
//     "Electronics",
//     "Furniture",
//     "Books",
//     "Groceries",
//     "Accessories",
//     "Stationery",
//     "Sports Equipment",
//     "Others"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 34),
//                     const Center(
//                       child: Text(
//                         'Add A New Item to sell...',
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Center(
//                       child: Text(
//                         'Hi Naman, Add your item to sell...',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//
//                     // Category Dropdown
//                     _buildCategoryDropdown(),
//
//                     // Title Field (20 Words Limit)
//                     _buildTextField(
//                       'Title (20 words limit)',
//                       _titleController,
//                       50,
//                       maxWords: 20,
//                       errorMessage: _titleError,
//                       onChanged: (value) {
//                         setState(() {
//                           _titleError = _validateWordLimit(value, 20);
//                         });
//                       },
//                     ),
//
//                     // Description Field (80 Words Limit)
//                     _buildTextField(
//                       'Description (80 words limit)',
//                       _descriptionController,
//                       300,
//                       maxLines: 5,
//                       maxWords: 80,
//                       errorMessage: _descriptionError,
//                       onChanged: (value) {
//                         setState(() {
//                           _descriptionError = _validateWordLimit(value, 80);
//                         });
//                       },
//                     ),
//
//                     // Long Description (No Word Limit)
//                     _buildTextField(
//                       'Give your long description here...',
//                       _longDescriptionController,
//                       400,
//                       maxLines: 10,
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Done Button
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_titleController.text.trim().isEmpty ||
//                             _descriptionController.text.trim().isEmpty ||
//                             _longDescriptionController.text.trim().isEmpty ||
//                             _selectedCategory == null) {
//                           setState(() {
//                             _categoryError = _selectedCategory == null ? "Please select a category" : "";
//                           });
//
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("All fields must be filled")),
//                           );
//                           return;
//                         }
//
//                         if (_titleError.isNotEmpty || _descriptionError.isNotEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Please fix errors before proceeding")),
//                           );
//                           return;
//                         }
//
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NewNewsConfirmation(
//                               title: _titleController.text.trim(),
//                               description: _descriptionController.text.trim(),
//                               longDescription: _longDescriptionController.text.trim(),
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                       child: const Text('Done'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: const FooterWidget(selectedIndex: 2),
//     );
//   }
//
//   /// ✅ Custom Category Dropdown Widget
//   Widget _buildCategoryDropdown() {
//     return Container(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButtonFormField<String>(
//               value: _selectedCategory,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedCategory = newValue;
//                   _categoryError = ""; // Reset error on selection
//                 });
//               },
//               items: _categories.map((String category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               decoration: InputDecoration(
//                 labelText: "Select Category",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
//                 filled: true,
//                 fillColor: Colors.white,
//                 errorText: _categoryError.isNotEmpty ? _categoryError : null,
//               ),
//             ),
//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// ✅ Custom Text Field Widget with Word Limit Validation
//   Widget _buildTextField(
//       String label,
//       TextEditingController controller,
//       double height, {
//         int maxLines = 1,
//         int? maxWords,
//         String errorMessage = "",
//         Function(String)? onChanged,
//       }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: height,
//             child: TextField(
//               controller: controller,
//               maxLines: maxLines,
//               onChanged: (value) {
//                 if (maxWords != null) {
//                   int wordCount = _countWords(value);
//                   if (wordCount > maxWords) {
//                     List<String> words = value.trim().split(RegExp(r'\s+')).take(maxWords).toList();
//                     controller.text = words.join(" ");
//                     controller.selection = TextSelection.collapsed(offset: controller.text.length);
//                   }
//                 }
//                 if (onChanged != null) onChanged(value);
//               },
//               decoration: InputDecoration(
//                 labelText: label,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//           if (errorMessage.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text(
//                 errorMessage,
//                 style: const TextStyle(color: Colors.red, fontSize: 12),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   /// ✅ Helper Function: Count Words
//   int _countWords(String text) {
//     return text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
//   }
//
//   /// ✅ Helper Function: Validate Word Limit
//   String _validateWordLimit(String text, int limit) {
//     return _countWords(text) > limit ? "Exceeded the limit" : "";
//   }
// }


import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';
import 'package:iit_marketing/views/newNewsConfirmation.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddNews extends StatefulWidget {
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _longDescriptionController = TextEditingController();

  String _titleError = "";
  String _descriptionError = "";
  String? _selectedCategory;
  String _categoryError = "";

  File? _thumbnailImage;
  List<File> _additionalImages = [];

  final List<String> _categories = [
    "Clothes", "Footwear", "Electronics", "Furniture", "Books",
    "Groceries", "Accessories", "Stationery", "Sports Equipment", "Others"
  ];

  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickThumbnailImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _thumbnailImage = File(pickedFile.path);
  //     });
  //   }
  // }

  Future<void> _pickAdditionalImages() async {
    // // final pickedFiles = await _picker.pickMultiImage();
    // if (pickedFiles.isNotEmpty) {
    //   setState(() {
    //     _additionalImages = pickedFiles.map((e) => File(e.path)).toList();
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 34),
                    const Center(
                      child: Text(
                        'Add A New Item to sell...',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        'Hi Naman, Add your item to sell...',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCategoryDropdown(),
                    _buildTextField('Product Name (20 words limit)', _titleController, maxWords: 20, errorMessage: _titleError, onChanged: (value) {
                      setState(() {
                        _titleError = _validateWordLimit(value, 20);
                      });
                    }),
                    _buildTextField('Description (80 words limit)', _descriptionController, maxLines: 5, maxWords: 80, errorMessage: _descriptionError, onChanged: (value) {
                      setState(() {
                        _descriptionError = _validateWordLimit(value, 80);
                      });
                    }),
                    _buildMultipleImagePicker('Thumbnail Image : ', _additionalImages, _pickAdditionalImages),
                    // _buildImagePicker('Thumbnail Image'),
                    _buildTextField('Give your long description here...', _longDescriptionController, maxLines: 10),
                    _buildMultipleImagePicker('Additional Images : ', _additionalImages, _pickAdditionalImages),
                    // const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.trim().isEmpty ||
                            _descriptionController.text.trim().isEmpty ||
                            _longDescriptionController.text.trim().isEmpty ||
                            _selectedCategory == null ||
                            _thumbnailImage == null ||
                            _additionalImages.isEmpty) {
                          setState(() {
                            _categoryError = _selectedCategory == null ? "Please select a category" : "";
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("All fields must be filled")),
                          );
                          return;
                        }
                        if (_titleError.isNotEmpty || _descriptionError.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please fix errors before proceeding")),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewNewsConfirmation(
                              title: _titleController.text.trim(),
                              description: _descriptionController.text.trim(),
                              longDescription: _longDescriptionController.text.trim(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterWidget(selectedIndex: 2),
    );
  }

  Widget _buildImagePicker(String label, File? image, VoidCallback onPick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        image != null
            ? Image.file(image, height: 100, width: 100, fit: BoxFit.cover)
            : ElevatedButton(onPressed: onPick, child: const Text('Pick Image')),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMultipleImagePicker(String label, List<File> images, VoidCallback onPick) {
    return Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Spacer(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: images.map((image) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(image, height: 80, width: 80, fit: BoxFit.cover),
              )).toList(),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: onPick,
                icon: const Icon(Icons.add_a_photo, size: 20, color: Colors.white,),
                label: const Text('Add Images'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
    );
  }
  Widget _buildTextField(
      String label,
      TextEditingController controller,
      {
        int maxLines = 1,
        int? maxWords,
        String errorMessage = "",
        Function(String)? onChanged,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              onChanged: (value) {
                if (maxWords != null) {
                  int wordCount = _countWords(value);
                  if (wordCount > maxWords) {
                    List<String> words = value.trim().split(RegExp(r'\s+')).take(maxWords).toList();
                    controller.text = words.join(" ");
                    controller.selection = TextSelection.collapsed(offset: controller.text.length);
                  }
                }
                if (onChanged != null) onChanged(value);
              },
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                  _categoryError = ""; // Reset error on selection
                });
              },
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                filled: true,
                fillColor: Colors.white,
                errorText: _categoryError.isNotEmpty ? _categoryError : null,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  /// ✅ Helper Function: Count Words
  int _countWords(String text) {
    return text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
  }

  /// ✅ Helper Function: Validate Word Limit
  String _validateWordLimit(String text, int limit) {
    return _countWords(text) > limit ? "Exceeded the limit" : "";
  }
}

