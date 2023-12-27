import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/auth/presentation/bloc/sign_cubit.dart';
import 'package:clean_arc/generated/locale_keys.g.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:clean_arc/src/core/widget/loading/full_over_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignPage extends StatelessWidget {
  final singInFormKey = GlobalKey<FormState>();

  SignPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignCubit>(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(40),
            color: AppColors.current.primaryColor,
            child: const Text('data')),
        Hero(
          tag: 'test',
          child: BlocConsumer<SignCubit, SignState>(
            listener: (context, state) {
              if (state is OtpStep) {
                context.router.push(OtpRoute());
              }
            },
            buildWhen: (ps, cs) =>
                cs is SignLoading && (cs.type == 1 || cs.type == 0),
            builder: (context, state) {
              if (state is SignLoading && state.type == 1) {
                return const FullOverLoading(
                  isDialog: false,
                );
              } else {
                return ElevatedButton(
                  child: Text(LocaleKeys.hello.tr()),
                  onPressed: () {
                    // cubit.toOtp();
                    context.setLocale(const Locale('ar'));
                    context.read<AppBloc>().languageCode = 'ar';
                  },
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
