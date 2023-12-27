// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:clean_arc/features/auth/presentation/auth_container.dart'
    as _i1;
import 'package:clean_arc/features/auth/presentation/pages/otp.dart' as _i6;
import 'package:clean_arc/features/auth/presentation/pages/sign.dart' as _i8;
import 'package:clean_arc/features/home/presentation/home_container.dart'
    as _i3;
import 'package:clean_arc/features/home/presentation/home_page/home_page.dart'
    as _i4;
import 'package:clean_arc/features/home/presentation/pages/chats.dart' as _i2;
import 'package:clean_arc/features/home/presentation/pages/notification.dart'
    as _i5;
import 'package:clean_arc/features/home/presentation/pages/settings.dart'
    as _i7;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthContainer.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthContainer(),
      );
    },
    ChatsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatsPage(),
      );
    },
    HomeContainer.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeContainer(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NotificationPage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args =
          routeData.argsAs<OtpRouteArgs>(orElse: () => const OtpRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OtpPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsPage(),
      );
    },
    SignRoute.name: (routeData) {
      final args =
          routeData.argsAs<SignRouteArgs>(orElse: () => const SignRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SignPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthContainer]
class AuthContainer extends _i9.PageRouteInfo<void> {
  const AuthContainer({List<_i9.PageRouteInfo>? children})
      : super(
          AuthContainer.name,
          initialChildren: children,
        );

  static const String name = 'AuthContainer';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatsPage]
class ChatsRoute extends _i9.PageRouteInfo<void> {
  const ChatsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeContainer]
class HomeContainer extends _i9.PageRouteInfo<void> {
  const HomeContainer({List<_i9.PageRouteInfo>? children})
      : super(
          HomeContainer.name,
          initialChildren: children,
        );

  static const String name = 'HomeContainer';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NotificationPage]
class NotificationRoute extends _i9.PageRouteInfo<void> {
  const NotificationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OtpPage]
class OtpRoute extends _i9.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i10.Key? key,
    int? type,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i9.PageInfo<OtpRouteArgs> page =
      _i9.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    this.type,
  });

  final _i10.Key? key;

  final int? type;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignPage]
class SignRoute extends _i9.PageRouteInfo<SignRouteArgs> {
  SignRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SignRoute.name,
          args: SignRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignRoute';

  static const _i9.PageInfo<SignRouteArgs> page =
      _i9.PageInfo<SignRouteArgs>(name);
}

class SignRouteArgs {
  const SignRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignRouteArgs{key: $key}';
  }
}
