import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:clean_arc/src/core/widget/dialogs/call_dialog.dart';
import 'package:clean_arc/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().prefs.setUserModeString("user");
    if (!context.read<AppBloc>().isLogin) {
      context.router.push(const AuthContainer());
    }
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              CallDialog.showErrorDialog(context, state.message);
            }
          },
          child: const Scaffold(body: AutoRouter()),
        );
      }),
    );
  }
}
