import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(40),
            color: AppColors.current.primaryColor,
            child: const Text('Home')),
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is LogOut) {
              context.read<AppBloc>().isLogin = false;
              context.read<AppBloc>().login(false);
              context.router.push(const AuthContainer());
            }
          },
          child: ElevatedButton(
              onPressed: () {
                cubit.logout();
              },
              child: const Text('logout')),
        )
      ]),
    );
  }
}
