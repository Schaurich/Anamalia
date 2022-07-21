// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/pages/auth/login/login_vm.dart' as _i14;
import '../../../application/pages/auth/register/register_vm.dart' as _i15;
import '../../../application/pages/fetch_data/fetch_data_vm.dart' as _i3;
import '../../../application/pages/home/home_vm.dart' as _i4;
import '../../../data/gateways/http/network.dart' as _i11;
import '../../../data/gateways/image_picker/dowing_image_gateway.dart' as _i8;
import '../../../data/gateways/storage/data_base.dart' as _i7;
import '../../../data/interceptors/base_interceptor.dart' as _i6;
import '../../../data/interceptors/refresh_interceptor.dart' as _i12;
import '../../../data/repositories/auth_repository.dart' as _i16;
import '../../../data/repositories/image_picker_repository.dart' as _i9;
import '../../../domain/services/auth_service.dart' as _i17;
import '../../../domain/services/image_picker_service.dart' as _i10;
import '../../../domain/stores/auth_store.dart' as _i5;
import '../../helpers/loader_helper.dart' as _i18;
import '../../shared/widgets/loader/loader_vm.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FetchDataVM>(() => _i3.FetchDataVM());
  gh.factory<_i4.HomePageVM>(() => _i4.HomePageVM());
  gh.singleton<_i5.IAuthStore>(_i5.AuthStoreImpl());
  gh.factory<_i6.IBaseInterceptor>(() => _i6.BaseInterceptorImpl());
  gh.singleton<_i7.IDataBase>(_i7.DataBaseImpl());
  gh.singleton<_i8.IDowingImageGateway>(_i8.DowingImageGatewayImpl());
  gh.factory<_i9.IImagePickerRepository>(() => _i9.ImagePickerRepositoryImpl(
      dowingImageGateway: get<_i8.IDowingImageGateway>()));
  gh.factory<_i10.IImagePickerServices>(() => _i10.ImagePickerServicesImpl(
      onboardingImageRepository: get<_i9.IImagePickerRepository>()));
  gh.singleton<_i11.INetWork>(_i11.NetWorkImpl());
  gh.factory<_i12.IRefreshInterceptor>(() => _i12.RefreshInterceptorImpl());
  gh.singleton<_i13.LoaderVM>(_i13.LoaderVM());
  gh.factory<_i14.LoginVM>(() => _i14.LoginVM());
  gh.factory<_i15.RegisterVM>(() => _i15.RegisterVM());
  gh.factory<_i16.IAuthRepository>(() => _i16.AuthRepositoryImpl(
      http: get<_i11.INetWork>(), dataBase: get<_i7.IDataBase>()));
  gh.factory<_i17.IAuthServices>(() => _i17.AuthServicesImpl(
      get<_i16.IAuthRepository>(), get<_i5.IAuthStore>()));
  gh.singleton<_i18.LoaderHelper>(
      _i18.LoaderHelper(loaderVM: get<_i13.LoaderVM>()));
  return get;
}
