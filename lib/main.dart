import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikon_app/models/getalltopcollection/getalltopcollection.dart';
import 'package:trikon_app/providers/collectionsProvider.dart';
import 'package:trikon_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CollectionsProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TrikonApplication(),
      ),
    ),
  );
}

class TrikonApplication extends StatefulWidget {
  const TrikonApplication({super.key});

  @override
  State<TrikonApplication> createState() => _TrikonApplicationState();
}

class _TrikonApplicationState extends State<TrikonApplication> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
