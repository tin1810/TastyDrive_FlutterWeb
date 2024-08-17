import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadController extends GetxController {
  var selectedImageBase64 = Rx<String?>(null);
  var selectedImageName = Rx<String?>(null);
  Uint8List? selectedImageBytes;

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    if (kIsWeb) {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files!.isEmpty) return;

        final reader = html.FileReader();
        selectedImageName.value = files[0]!.name; // Get the file name
        reader.readAsArrayBuffer(files[0]!);
        reader.onLoadEnd.listen((e) async {
          selectedImageBytes = reader.result as Uint8List; // Get image bytes
          final base64String = base64Encode(selectedImageBytes!);
          selectedImageBase64.value = base64String;
        });
      });
    } else {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImageName.value = pickedFile.name; // Get the file name
        selectedImageBytes = await pickedFile.readAsBytes(); // Get image bytes
        final base64String = base64Encode(selectedImageBytes!);
        selectedImageBase64.value = base64String;
      } else {
        Get.snackbar('Error', 'No image selected');
      }
    }
  }
}
