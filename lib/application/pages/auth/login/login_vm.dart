import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'login_vm.g.dart';

@Injectable()
class LoginVM = LoginVMBase with _$LoginVM;

abstract class LoginVMBase with Store {
  LoginVMBase();
}
