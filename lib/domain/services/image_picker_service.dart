

import 'package:dowing_app/data/repositories/image_picker_repository.dart';
import 'package:injectable/injectable.dart';

abstract class IImagePickerServices {
  Future<String> getImageFromCamera();
  Future<String> getImageFromGallery();
}

@Injectable(as: IImagePickerServices)
class ImagePickerServicesImpl implements IImagePickerServices {
  ImagePickerServicesImpl({
    required this.onboardingImageRepository,
  });

  final IImagePickerRepository onboardingImageRepository;

  @override
  Future<String> getImageFromCamera() async {
    final onboardingImage = await onboardingImageRepository.getImageFromCamera();

    return onboardingImage;
  }

  @override
  Future<String> getImageFromGallery() async {
    final onboardingImage = await onboardingImageRepository.getImageFromGallery();

    return onboardingImage;
  }
}
