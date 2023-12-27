// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_arc/features/auth/presentation/bloc/sign_cubit.dart'
    as _i6;
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart'
    as _i4;
import 'package:clean_arc/src/app/bloc/app_bloc.dart' as _i10;
import 'package:clean_arc/src/core/navigation/routes/AppRouter.dart' as _i3;
import 'package:clean_arc/src/core/network/access_token_interceptor.dart'
    as _i9;
import 'package:clean_arc/src/core/network/auth_interceptor.dart' as _i11;
import 'package:clean_arc/src/core/preferences/PreferencesHelper.dart' as _i7;
import 'package:clean_arc/src/core/preferences/Prefs.dart' as _i8;
import 'package:clean_arc/src/di/AppModule.dart' as _i13;
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppRouter>(appModule.appRouter);
    gh.factory<_i4.HomeCubit>(() => _i4.HomeCubit());
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i6.SignCubit>(() => _i6.SignCubit());
    gh.singleton<String>(
      appModule.currentPlatform,
      instanceName: 'currentPlatform',
    );
    gh.factory<_i7.PreferencesHelper>(
        () => appModule.getPreferencesHelper(gh<_i5.SharedPreferences>()));
    gh.factory<_i8.Prefs>(() => _i8.Prefs(gh<_i7.PreferencesHelper>()));
    await gh.singletonAsync<String>(
      () => appModule.getLanguageCode(gh<_i8.Prefs>()),
      instanceName: 'languageCode',
      preResolve: true,
    );
    gh.factory<_i9.AccessTokenInterceptor>(
        () => _i9.AccessTokenInterceptor(gh<_i8.Prefs>()));
    gh.factory<_i10.AppBloc>(() => _i10.AppBloc(
          prefs: gh<_i8.Prefs>(),
          languageCode: gh<String>(),
          modeThem: gh<String>(),
          hasOrder: gh<bool>(),
        ));
    gh.factory<_i11.AuthInterceptor>(() => _i11.AuthInterceptor(
          gh<_i8.Prefs>(),
          gh<_i3.AppRouter>(),
        ));
    await gh.factoryAsync<_i12.Dio>(
      () => appModule.dio(
        gh<String>(instanceName: 'languageCode'),
        gh<_i9.AccessTokenInterceptor>(),
        gh<_i11.AuthInterceptor>(),
      ),
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
