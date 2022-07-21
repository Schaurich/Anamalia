import 'package:dowing_app/core/config/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void configureDependencies() => $initGetIt(GetIt.instance);
