import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      Dio(
        BaseOptions(baseUrl: 'https://5f7cba02834b5c0016b058aa.mockapi.io/api'),
      ),
    );
  }
}
