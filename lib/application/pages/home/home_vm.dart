// ignore_for_file: use_setters_to_change_properties, library_private_types_in_public_api

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'home_vm.g.dart';

@Injectable()
class HomePageVM = _HomePageVMBase with _$HomePageVM;

abstract class _HomePageVMBase with Store {
  _HomePageVMBase();
}
