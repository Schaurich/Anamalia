import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class IDowingImageGateway {
  Future<XFile?> getImageFromCamera();
  Future<XFile?> getImageFromGallery();
}

@Singleton(as: IDowingImageGateway)
class DowingImageGatewayImpl implements IDowingImageGateway {
  DowingImageGatewayImpl() {
    imagePicker = ImagePicker();
  }

  late final ImagePicker imagePicker;
  XFile? imagePath;

  @override
  Future<XFile?> getImageFromCamera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      return image;
    } else {
      throw Exception('Falha ao selecionar imagem da camera!');
    }
  }

  @override
  Future<XFile?> getImageFromGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image;
    } else {
      throw Exception('Falha ao selecionar imagem da galeria!');
    }
  }
}
