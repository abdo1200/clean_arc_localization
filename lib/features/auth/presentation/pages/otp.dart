import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/auth/presentation/bloc/sign_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';

import 'package:clean_arc/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:clean_arc/src/core/widget/loading/full_over_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  OtpPage({Key? key, this.type}) : super(key: key);
  final pinFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  double otpHeight = 48.w;
  double optRadius = 8.w;
  final int? type;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SignCubit>(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(40),
            color: AppColors.current.secondaryColor,
            child: const Text('otp')),
        SizedBox(
          height: 16.h,
        ),
        Hero(
            tag: 'test',
            child: BlocConsumer<SignCubit, SignState>(
              listener: (context, state) async {
                if (state is SignInitial) {
                  context.router.push(SignRoute());
                } else if (state is SignLoaded) {
                  context.read<AppBloc>().isLogin = true;
                  context.read<AppBloc>().login(true);
                  context.router.push(const HomeContainer());
                }
              },
              buildWhen: (ps, cs) =>
                  cs is SignLoading && (cs.type == 3 || cs.type == 0),
              builder: (context, state) {
                if (state is SignLoading && state.type == 3) {
                  return const FullOverLoading(
                    isDialog: false,
                  );
                } else {
                  return ElevatedButton(
                    child: const Text('check'),
                    onPressed: () {
                      bloc.toLogin();
                    },
                  );
                }
              },
            ))
      ]),
    );
  }
}
