import 'package:clean_arc/generated/codegen_loader.g.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/resource/styles/app_themes.dart';

import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/local/locale_constants.dart';
import 'package:clean_arc/src/core/navigation/routes/AppRouter.dart';
import 'package:clean_arc/src/core/preferences/Prefs.dart';
import 'package:clean_arc/src/generated/l10n.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp();
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  await configureDependencies();
  var language = await GetIt.instance.get<Prefs>().languageString;
  var theme = await GetIt.instance.get<Prefs>().themString;
  var order = await GetIt.instance.get<Prefs>().userOrderString;
  // FirebaseNotificationUserClass.initFirebase();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
  ));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AppBloc>(
          create: (context) => AppBloc(
              prefs: getIt(),
              hasOrder: order.isNotEmpty,
              languageCode: language,
              // modeThem: theme.isEmpty ? "light" : theme
              modeThem: "light")),
    ],
    child: Builder(builder: (context) {
      return EasyLocalization(
        path: 'assets/langs/langs.csv',
        assetLoader: const CodegenLoader(),
        supportedLocales: const [Locale('en'), Locale('ar')],
        child: MyApp(),
      );
    }),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) =>
          BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.modeThem != current.modeThem ||
            previous.languageCode != current.languageCode,
        builder: (context, state) {
          AppColors.of(context);
          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          //   statusBarColor: AppColors.current.witheColor, // status bar color
          // ));
          if (state is AppInitial || state is ChangeSettings) {
            return MaterialApp.router(
              routerConfig: widget._appRouter.config(),
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) =>
                      supportedLocales.contains(locale)
                          ? locale
                          : const Locale(LocaleConstants.defaultLocale),
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,

              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              // bloc!.modeThem == "dark" ? ThemeMode.dark : ThemeMode.light,
              color: Colors.white,
              title: 'golden_host',
              //home: const Scaffold(body: Text('xxxx')),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // AppColors.of(context);
    bloc = context.read<AppBloc>();
    bloc?.add(InitEvent());
  }
}
