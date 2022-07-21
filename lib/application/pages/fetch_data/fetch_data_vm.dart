// ignore_for_file: use_setters_to_change_properties, library_private_types_in_public_api

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'fetch_data_vm.g.dart';

@Injectable()
class FetchDataVM = _FetchDataVMBase with _$FetchDataVM;

abstract class _FetchDataVMBase with Store {
  _FetchDataVMBase();
}
