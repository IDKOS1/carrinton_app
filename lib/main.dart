import 'package:carrinton_app/di/di.dart';
import 'package:carrinton_app/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  // DI 초기화
  setupDependencies();

  runApp(
    ProviderScope(
      // ProviderScope로 감싸고 그 안에서 ScreenUtilInit 초기화
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // 기준 해상도
        minTextAdapt: true, // 텍스트 자동 조정
        splitScreenMode: true, // 여러 화면 지원
        builder: (context, child) {
          return const MyApp(); // 초기화 이후 MyApp 실행
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
