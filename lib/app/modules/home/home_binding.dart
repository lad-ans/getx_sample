import 'package:get/get.dart';

import '../../shared/repositories/repository.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Repository(Get.find()));
    Get.put(HomeController(repository: Get.find()));
  }
}
