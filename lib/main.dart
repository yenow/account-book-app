import 'package:account_book/constants.dart';
import 'package:account_book/common/theme/dark_theme.dart';
import 'package:account_book/get/binding/init_binding.dart';
import 'package:account_book/route.dart';
import 'package:account_book/screens/home/home_screen.dart';
import 'package:account_book/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  // Get.height
  log.d('height : ${Get.height}, width : ${Get.width}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) {     // build 의 역할은??
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(data: data.copyWith(textScaleFactor: 1.0), child: child!);
      },
      getPages: AppRoute.getRoutes(),
      initialBinding: InitBinding(),
      theme: theme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
