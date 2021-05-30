import 'package:get/get.dart';

import '../../shared/models/pagination_filter.dart';
import '../../shared/models/user.dart';
import '../../shared/repositories/repository.dart';

class HomeController extends GetxController {
  final Repository repository;

  HomeController({
    required this.repository,
  });

  final _users = <UserModel>[].obs;
  final _pagFilter = PaginationFilter().obs;
  final _isLastPage = false.obs;

  List<UserModel> get users => _users.toList();
  int? get limit => _pagFilter.value.limit;
  int? get _page => _pagFilter.value.page;
  bool get isLastPage => _isLastPage.value;

  @override
  void onInit() {
    ever(_pagFilter, (_) => _findUsers());
    _changePagFilter(1, 15);
    super.onInit();
  }

  void _findUsers() async {
    final data = await repository.findAll(_pagFilter.value);
    if (data.isEmpty) _isLastPage.value = true;
    _users.addAll(data);
  }

  void changeTotalPerPage(int limit) {
    _users.clear();
    _isLastPage.value = false;
    _changePagFilter(1, limit);
  }

  void _changePagFilter(int page, int? limit) {
    _pagFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void nextPage() {
    _changePagFilter(_page! + 1, limit);
  }
}
