import 'package:data/core/api_key.dart';
import 'package:data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';

import 'package:domain/model/auth/api_authorization_response.dart';
import 'package:domain/repository/login_network_repository.dart';
import 'package:domain/model/auth/authorization_exception.dart';

class LoginNetworkRepository extends ApiBaseRepositoryImpl
    implements ILoginNetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  LoginNetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<ApiAuthorizationResponse?> login() {
    return _service
        .get(
          path: ApiHelperCore.pathToken,
          cancelToken: _cancelToken,
        )
        .then(
          (value) => Future.value(
            ApiAuthorizationResponse.fromJson(value.data),
          ),
        )
        .onError(
      (error, stackTrace) {
        if (error is DioError && error.response?.statusCode == 401) {
          return Future.error(
            AuthException(
              "login invalid",
              "password invalid",
            ),
          );
        } else {
          return Future.error(error!);
        }
      },
    );
  }

  @override
  Future<ApiAuthorizationResponse?> getJobs(String url) {
    return _service
        .get(
          path: url + ApiHelperCore.pathToken,
        )
        .then(
          (response) => Future.value(
            ApiAuthorizationResponse.fromJson(response.data),
          ),
        );
  }
}
