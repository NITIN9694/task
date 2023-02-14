import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation/navigation.dart';
import 'navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home, //edit
      getPages: Nav.routes,
      builder: (context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.1),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,

    );

  }
}
