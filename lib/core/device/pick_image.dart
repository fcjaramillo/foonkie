import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickImage {
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    return File(image.path);
  }
}