import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imperointerview/Provider/DataProvider.dart';
import 'package:imperointerview/View/Home_Page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /// ScreenUtils will help us to create responsive design
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DataProvider())],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(350, 680),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Interview Task',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
