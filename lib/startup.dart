// ignore_for_file: avoid_dynamic_calls, depend_on_referenced_packages

import 'package:dowing_app/application/theme/main_theme.dart';
import 'package:dowing_app/core/config/di/injection.dart';
import 'package:dowing_app/core/config/routes/app_router.gr.dart';
import 'package:dowing_app/core/messengers/scaffold_messenger.dart';
import 'package:dowing_app/core/shared/widgets/loader/loader_widget.dart';
import 'package:dowing_app/data/gateways/http/network.dart';
import 'package:dowing_app/data/gateways/storage/data_base.dart';
import 'package:dowing_app/data/interceptors/base_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:resize/resize.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<AppRouter>(AppRouter());

  GetIt.instance.get<INetWork>().configureInterceptorAndGetInstance(BaseInterceptorImpl());
  GetIt.instance.get<IDataBase>().configureDataBaseAndGetInstance();

  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  Widget build(BuildContext context) => Resize(
        builder: () => LoaderWidget(
          child: MaterialApp.router(
            title: 'Dowing App',
            theme: getmainTheme(context),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            scaffoldMessengerKey: CustomScaffoldMessenger.globalKey,
            supportedLocales: const [
              Locale('pt'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              FormBuilderLocalizations.delegate,
            ],
          ),
        ),
      );
}
