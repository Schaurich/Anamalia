import 'package:dowing_app/data/gateways/image_picker/dowing_image_gateway.dart';
import 'package:injectable/injectable.dart';

abstract class IImagePickerRepository {
  Future<String> getImageFromCamera();
  Future<String> getImageFromGallery();
}

@Injectable(as: IImagePickerRepository)
class ImagePickerRepositoryImpl implements IImagePickerRepository {
  ImagePickerRepositoryImpl({
    required this.dowingImageGateway,
  });

  final IDowingImageGateway dowingImageGateway;

  @override
  Future<String> getImageFromCamera() async {
    final rawPath = await dowingImageGateway.getImageFromCamera();

    return rawPath?.path ?? '';
  }

  @override
  Future<String> getImageFromGallery() async {
    final rawPath = await dowingImageGateway.getImageFromGallery();

    return rawPath?.path ?? '';
  }
}
