import 'package:dowing_app/core/shared/widgets/loader/loader_vm.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoaderHelper {
  LoaderHelper({required this.loaderVM});

  late LoaderVM loaderVM;

  void showLoader() => loaderVM.showLoader();

  void hideLoader() => loaderVM.hideLoader();

  Future<dynamic> listenAction(Future<dynamic> Function() exec) async {
    try {
      dynamic result;
      showLoader();
      // ignore: avoid_types_on_closure_parameters
      result = await exec().catchError((Object _) => hideLoader());
      hideLoader();
      return result;
    } on Exception catch (_) {
      hideLoader();
    }
  }
}
