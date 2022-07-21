import 'package:auto_route/auto_route.dart';

import 'package:dowing_app/application/pages/auth/login/login_page.dart';

import 'package:dowing_app/application/pages/auth/register/register_page.dart';

import 'package:dowing_app/application/pages/fetch_data/fetch_data_page.dart';
import 'package:dowing_app/application/pages/home/home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: FetchDataPage,
      initial: true,
    ),
    AutoRoute<dynamic>(page: LoginPage),
    AutoRoute<dynamic>(page: RegisterPage),
    AutoRoute<dynamic>(page: HomePage),
  ],
)
class $AppRouter {}
