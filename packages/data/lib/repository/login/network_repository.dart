import 'package:data/repository/login/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/api_login_respone.dart';
import 'package:domain/entities/login_response.dart';
import 'package:domain/repository/login/login_repositoy.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements LoginRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(this._service, this._cancelToken)
      : super(cancelToken: _cancelToken);

  @override
  Future<LoginResponse> getLogin() {
    return _service
        .get(
          path: 'mxcc-registration/gateway/REGISTRATION/',
          cancelToken: _cancelToken,
        )
        .then((value) => Future.value(ApiLoginResponse.fromJson(value.data)));
  }

  @override
  Future<LoginResponse> sendLogin(Map<String, dynamic> request) {
    return _service
        .post(
          data: request,
          path: 'mxcc-registration/gateway/REGISTRATION/',
          cancelToken: _cancelToken,
        )
        .then((value) => Future.value(ApiLoginResponse.fromJson(value.data)));
  }
}
