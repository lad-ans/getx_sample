import 'package:dio/dio.dart';
import 'package:getx_example/app/shared/models/pagination_filter.dart';
import 'package:getx_example/app/shared/models/user.dart';

class Repository {
  Dio _dio;

  Repository(
    this._dio,
  );

  Future<List<UserModel>> findAll(PaginationFilter filter) {
    return _dio.get('/users', queryParameters: {
      'page': filter.page,
      'limit': filter.limit,
    }).then(
      (res) => res.data?.map<UserModel>((u) => UserModel.fromMap(u))?.toList(),
    );
  }
}
