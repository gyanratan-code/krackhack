import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';
import 'package:iit_marketing/views/newNewsConfirmation.dart';
import 'dart:io';
import 'package:iit_marketing/services/cloudinary_services.dart';
import 'package:iit_marketing/services/product_services.dart';

final CloudinaryService _cloudinaryService = CloudinaryService();
final ProductServices _productServices = ProductServices();

class AddNews extends StatefulWidget {
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  FilePickerResult? _filePickerResult;
  void _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["jpg", "jpeg", "png", "mp4"],
        type: FileType.custom,
      );

      if (result != null) {
        setState(() {
          _filePickerResult = result;
        });
        if (_filePickerResult != null) {}
      } else {
        print("User canceled file picker");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _longDescriptionController = TextEditingController();

  String _titleError = "";
  String _descriptionError = "";
  String _branderror = "";
  String _mrperror = "";
  String? _selectedCategory;
  String _categoryError = "";

  File? _thumbnailImage;
  List<File> _additionalImages = [];

  final List<String> _categories = [
    "Clothes",
    "Footwear",
    "Electronics",
    "Furniture",
    "Books",
    "Groceries",
    "Accessories",
    "Stationery",
    "Sports Equipment",
    "Others"
  ];

  Future<void> _pickAdditionalImages() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        allowedExtensions: ["jpg", "jpeg", "png"],
        type: FileType.custom,
      );

      if (result != null) {
        setState(() {
          _additionalImages.addAll(result.files
              .where((file) => file.path != null)
              .map((file) => File(file.path!))
              .toList());
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  void _pickThumbnailImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["jpg", "jpeg", "png"],
        type: FileType.custom,
      );

      if (result != null) {
        setState(() {
          _thumbnailImage = File(result.files.first.path!);
        });
      }
    } catch (e) {
      print("Error picking thumbnail image: $e");
    }
  }

  Future<void> _uploadImagesAndSaveToFirestore(BuildContext context,String product,String brand,double? mrp,String? categories,String description) async {
    List<String> imageUrlThumbnail = [];
    List<String> imageUrlsAdditional = [];

    // Upload Thumbnail Image
    if (_thumbnailImage != null) {
      String? thumbnailUrl =
          await _cloudinaryService.uploadImage(_thumbnailImage!.path);
      if (thumbnailUrl != null) {
        imageUrlThumbnail.add(thumbnailUrl);
      }
    }

    // Upload Additional Images
    for (File image in _additionalImages) {
      String? imageUrl = await _cloudinaryService.uploadImage(image.path);
      if (imageUrl != null) {
        imageUrlsAdditional.add(imageUrl);
      }
    }

    if (imageUrlThumbnail.isNotEmpty && imageUrlsAdditional.isNotEmpty) {
      // Now you have the uploaded image URLs as strings
      print("Uploaded Image URLs:");
      // Firestore upload function for collection
      _descriptionController.text;
      _productServices.addProduct(product, brand, mrp, "123", categories, imageUrlThumbnail[0], imageUrlsAdditional, description, false);
      // \implement
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload images. Try again!")),
      );
    }
  }

  void _showUploadConfirmationDialog(BuildContext context,String product,String brand,double? mrp,String? categories,String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Upload"),
          content: const Text("Are you sure you want to upload this news?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // upload to database
                Navigator.pop(context);
                _uploadImagesAndSaveToFirestore(context, product, brand, mrp, categories, description);
                print("done");
                Navigator.pushReplacementNamed(context, "/home");
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
                    _buildTextField(
                        'Product Name (20 words limit)', _titleController,
                        maxWords: 20,
                        errorMessage: _titleError, onChanged: (value) {
                      setState(() {
                        _titleError = _validateWordLimit(value, 20);
                      });
                    }),
                    _buildTextField(
                        'Description (80 words limit)', _descriptionController,
                        maxLines: 5,
                        maxWords: 80,
                        errorMessage: _descriptionError, onChanged: (value) {
                      setState(() {
                        _descriptionError = _validateWordLimit(value, 80);
                      });
                    }),
                    _buildTextField(
                        'Brand Name (Optional)', _brandController,
                        maxLines: 1,
                        maxWords: 80,
                        errorMessage: _descriptionError, onChanged: (value) {
                      setState(() {
                        _branderror = _validateWordLimit(value, 80);
                      });
                    }),
                    _buildTextField(
                        'Selling Price(Expected)', _mrpController,
                        maxLines: 1,
                        maxWords: 80,
                        errorMessage: _mrperror, onChanged: (value) {
                      setState(() {
                        _mrperror = _validateWordLimit(value, 80);
                      });
                    }, isNumeric: true),
                    _buildThumbnailPicker('Thumbnail Image:', _thumbnailImage,
                        _pickThumbnailImage),
                    _buildTextField('Give your long description here...',
                        _longDescriptionController,
                        maxLines: 10),
                    _buildMultipleImagePicker('Additional Images : ',
                        _additionalImages, _pickAdditionalImages),
                    SizedBox(
                      height: 10,
                    ),
                    // const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.trim().isEmpty ||
                            _descriptionController.text.trim().isEmpty ||
                            _longDescriptionController.text.trim().isEmpty ||
                            _mrpController == null ||
                            _selectedCategory == null ||
                            _thumbnailImage == null ||
                            _additionalImages.isEmpty) {
                          setState(() {
                            _categoryError = _selectedCategory == null
                                ? "Please select a category"
                                : "";
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("All fields must be filled")),
                          );
                          return;
                        }
                        if (_titleError.isNotEmpty ||
                            _descriptionError.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please fix errors before proceeding")),
                          );
                          return;
                        }
                        _showUploadConfirmationDialog(context,_titleController.text, _brandController.text, double.tryParse(_mrpController.text), _selectedCategory, _descriptionController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
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

  Widget _buildThumbnailPicker(String label, File? image, VoidCallback onPick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        image != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(image,
                        height: 100, width: 100, fit: BoxFit.cover),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _thumbnailImage = null;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.close, size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            : ElevatedButton.icon(
                onPressed: onPick,
                icon: const Icon(Icons.add_a_photo,
                    size: 20, color: Colors.white),
                label: const Text('Pick Thumbnail Image'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 4,
                ),
              ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMultipleImagePicker(
      String label, List<File> images, VoidCallback onPick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: images.asMap().entries.map((entry) {
            int index = entry.key;
            File image = entry.value;
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(image,
                      height: 80, width: 80, fit: BoxFit.cover),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        images.removeAt(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.close, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: onPick,
          icon: const Icon(Icons.add_a_photo, size: 20, color: Colors.white),
          label: const Text('Add Images'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    int? maxWords,
    String errorMessage = "",
    Function(String)? onChanged,
        isNumeric = false
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextField(
              keyboardType: isNumeric ? TextInputType.number : TextInputType.multiline,
              controller: controller,
              maxLines: maxLines,
              onChanged: (value) {
                if (maxWords != null) {
                  int wordCount = _countWords(value);
                  if (wordCount > maxWords) {
                    List<String> words = value
                        .trim()
                        .split(RegExp(r'\s+'))
                        .take(maxWords)
                        .toList();
                    controller.text = words.join(" ");
                    controller.selection =
                        TextSelection.collapsed(offset: controller.text.length);
                  }
                }
                if (onChanged != null) onChanged(value);
              },
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
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
