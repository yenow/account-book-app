import 'package:account_book/common/log_config.dart';
import 'package:account_book/get/binding/init_binding.dart';
import 'package:account_book/route.dart';
import 'package:account_book/common/theme/theme.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'data/model/trade.dart';


// 보안 저장소
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
IOSOptions _getIOSOptions() => const IOSOptions();
AndroidOptions _getAndroidOptions() => const AndroidOptions(
  encryptedSharedPreferences: true,
);

// 구글 로그인
GoogleSignIn googleSignIn = GoogleSignIn();

// 캘린더
final EventController<Trade> eventController = EventController<Trade>();

void main() async {
  dlog.i('height : ${Get.height}, width : ${Get.width}');
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 화면 회전 방지
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(411, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'account book',
          builder: (context, child) {
            // 기기의 폰트 사이즈 무시하기
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(data: data.copyWith(textScaleFactor: 1.0), child: child!);
          },
          getPages: AppRoute.getRoutes(),
          initialBinding: InitBinding(),
          initialRoute: AppRoute.root,
          theme: theme(),
          // darkTheme: darkTheme(),
          // themeMode: ThemeMode.light,
          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
        );
      },
    );
  }
}
