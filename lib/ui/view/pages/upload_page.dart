import 'dart:io';

import 'package:binamod/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final List<XFile?> _images = List<XFile?>.filled(6, null, growable: false);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _images[index] = pickedFile;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Resim seçilmedi."),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Resim seçilirken hata oluştu: $e"),
        ),
      );
    }
  }

  //save kontroola like Lebron James
  void _handleSave() {
    final bool allImagesSelected = _images.every((image) => image != null);

    if (!allImagesSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.deepPurple,
          content: Text("Plase Selecet Images"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Pictures Uploaded",
            style: TextStyle(fontSize: 15),
          ),
          backgroundColor: colorDeepPurple,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorDeepPurple,
        automaticallyImplyLeading: false,
        title: const Text(
          'Upload Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload images of the building and press save button",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 50),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 5,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Grid item $index tapped');
                      _pickImage(index);
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _images[index] != null
                            ? Image.file(
                                File(_images[index]!.path),
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.add_photo_alternate,
                                color: Colors.grey,
                                size: 50,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSave,
        child: Icon(
          Icons.save,
          color: colorDeepPurple,
        ),
      ),
    );
  }
}
