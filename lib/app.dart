import 'package:anwel/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/constants/app_constants.dart';
import 'core/cubit/theme/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NawelApp extends StatelessWidget {
  final AppRouter appRouter;
  const NawelApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // الحجم المرجعي (w, h)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.splashScreen,
              builder: (context, widget) {
                // هذا يساعد على تحجيم النصوص حسب التصميم
                ScreenUtil.init(context);
                return widget!;
              },
            );
          },
        );
      },
    );
  }
}
