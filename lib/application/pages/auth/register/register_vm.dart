// ignore_for_file: library_private_types_in_public_api, avoid_void_async

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'register_vm.g.dart';

extension EitherX<L, R> on Either<L, R> {
  R value() => (this as Right).value as R;
  L asLeft() => (this as Left).value as L;
}

abstract class IRegisterVM {
  void onSubmit(Map<String, dynamic> form, BuildContext context);
}

@Injectable()
class RegisterVM = _RegisterVMBase with _$RegisterVM;

abstract class _RegisterVMBase with Store {
  _RegisterVMBase();
}
