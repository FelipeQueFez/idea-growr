import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
 Future<File> getImageAsync() async {
   //TODO:implement set another types
   return await ImagePicker.pickImage(source: ImageSource.camera);
 }
}