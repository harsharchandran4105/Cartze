import 'package:cartze/data/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../data/product.dart';
import '../../models/product.dart';

class SellerUploadPage extends StatefulWidget {
  const SellerUploadPage({super.key});

  @override
  State<SellerUploadPage> createState() => _SellerUploadPageState();
}

class _SellerUploadPageState extends State<SellerUploadPage> {

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  /// CAMERA
  Future<void> pickImageFromCamera() async {

    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {

      setState(() {

        selectedImage = File(image.path);

      });

    }
  }

  /// GALLERY
  Future<void> pickImageFromGallery() async {

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {

      setState(() {

        selectedImage = File(image.path);

      });

    }
  }

  /// UPLOAD PRODUCT
  void uploadProduct() {

    if (selectedImage == null ||
        nameController.text.isEmpty ||
        priceController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Please complete all fields"),
        ),

      );

      return;
    }

    ProductData.addProduct(

      Product(
        name: nameController.text,
        category: "Custom",
        price: priceController.text,
        image: selectedImage!.path,
      ),

    );

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text("Product Uploaded Successfully"),
      ),

    );

    nameController.clear();
    priceController.clear();
    descController.clear();

    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Upload Product"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// IMAGE PREVIEW
              Center(

                child: selectedImage == null

                    ? Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Center(
                          child: Text("No Image Selected"),
                        ),
                      )

                    : Image.file(
                        selectedImage!,
                        height: 180,
                      ),

              ),

              const SizedBox(height: 15),

              /// CAMERA + GALLERY BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  ElevatedButton(

                    onPressed: pickImageFromCamera,

                    child: const Text("Camera"),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(

                    onPressed: pickImageFromGallery,

                    child: const Text("Gallery"),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              /// PRODUCT NAME
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                ),
              ),

              const SizedBox(height: 15),

              /// PRICE
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: "Price",
                ),
              ),

              const SizedBox(height: 15),

              /// DESCRIPTION
              TextField(
                controller: descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),

              const SizedBox(height: 30),

              /// UPLOAD BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),

                  onPressed: uploadProduct,

                  child: const Text("Upload Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}