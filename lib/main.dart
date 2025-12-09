import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/cart.dart';
import 'provider/counter.dart';
import 'routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: const Size(750, 1334), // 设计稿尺寸
      minTextAdapt: true, // 开启最小文本适配
      splitScreenMode: true, // 开启分屏模式
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Counter()),
            ChangeNotifierProvider(create: (_) => Cart()),
          ],
          child: MaterialApp(
            //routes: routes, // 路由表
            onGenerateRoute: onGenerateRoute, // 路由生成器
            initialRoute: "/", // 初始路由
            theme: ThemeData(primaryColor: Colors.white),
          ),
        );
      },
    ),
  );
}
