import 'dart:convert';
import 'dart:io';

class ImageHelper {
  static Future<String> toBase64(String path) async {
    final fileImage = File(path);
    final imageByte = await fileImage.readAsBytes();
    final imageBase64 = base64.encode(imageByte);
    return imageBase64;
  }
}
