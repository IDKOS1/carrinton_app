import 'package:carrinton_app/di/di.dart';
import 'package:carrinton_app/presentation/ui/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 화면 세로 고정
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 화면 상단 상태바 보여주기 (배터리 잔량, 시간)
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  // Talker 초기화
  final talker = TalkerFlutter.init();

  // Dio 설정
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printRequestData: true,
        printResponseData: true,
      ),
    ),
  );

  // Riverpod Observer 설정
  final riverpodObserver = TalkerRiverpodObserver(
    talker: talker, // Talker 인스턴스 전달
    settings: const TalkerRiverpodLoggerSettings(
      enabled: true,
      printStateFullData: false,    // 전체 상태 데이터를 출력하지 않음
      printProviderAdded: true,     // Provider 추가 로그 활성화
      printProviderUpdated: true,   // Provider 업데이트 로그 활성화
      printProviderDisposed: true,  // Provider 제거 로그 활성화
      printProviderFailed: true,    // Provider 실패 로그 활성화
    ),
  );

  // DI 초기화
  setupDependencies();

  runApp(
    ProviderScope(
      observers: [riverpodObserver],
      // ProviderScope로 감싸고 그 안에서 ScreenUtilInit 초기화
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // 기준 해상도
        minTextAdapt: true, // 텍스트 자동 조정
        splitScreenMode: true, // 여러 화면 지원
        builder: (context, child) {
          return MyApp(talker: talker, dio: dio); // 초기화 이후 MyApp 실행
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Talker talker;
  final Dio dio;

  const MyApp({Key? key, required this.talker, required this.dio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        TalkerRouteObserver(talker),
      ],
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
