import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_binding.dart';
import 'app/modules/home/home_binding.dart';
import 'app/modules/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialBinding: AppBinding(),
        getPages: [
          GetPage(name: '/', page: () => HomePage(), binding: HomeBindings()),
        ],
      );
}
