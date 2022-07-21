// ignore_for_file: library_private_types_in_public_api

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'loader_vm.g.dart';

@Singleton()
class LoaderVM = _LoaderVMBase with _$LoaderVM;

abstract class _LoaderVMBase with Store {
  _LoaderVMBase() {
    hideLoader();
  }
  @observable
  bool isShowLoader = false;

  @action
  void showLoader() {
    isShowLoader = true;
  }

  @action
  void hideLoader() {
    isShowLoader = false;
  }
}
