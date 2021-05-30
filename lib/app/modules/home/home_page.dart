import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/utils/lazy_load_scroll_view.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: Obx(() {
          if (!controller.isLastPage && controller.users.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return LazyLoadScrollView(
            onEndOfPage: controller.nextPage,
            isLoading: controller.isLastPage,
            child: ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(controller.users[index].id!),
                  title: Text(controller.users[index].username!),
                  subtitle: Text(controller.users[index].name!),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
