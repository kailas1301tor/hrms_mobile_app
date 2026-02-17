import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';
import '../../res/styles/app_theme.dart';
import '../../utils/routes/route_constants.dart';
import '../../utils/routes/route_generator.dart';

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => ToastificationWrapper(
        child: MaterialApp(
          title: 'SAMPLE ARCHITECTURE',
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery.withClampedTextScaling(
              minScaleFactor: 1,
              maxScaleFactor: 1,
              child: child ?? const SizedBox(),
            );
          },
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: RouteConstants.routeInitial,
          theme: AppTheme.themeData,
        ),
      ),
    );
  }
}
