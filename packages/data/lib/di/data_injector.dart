import 'package:data/repository/login/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/login/login_repositoy.dart';
import 'package:get_it/get_it.dart';

import '../dio/dio_builder.dart';

Future<void> initDataModule() async {
  _initRepositoryModule();
  _initApiModule();
}

void _initApiModule() {
  GetIt.I.registerFactory<CancelToken>(() => CancelToken());
  _initDioModule();
  _initServiceModule();
}

void _initRepositoryModule() {
  GetIt.I.registerFactory<LoginRepository>(
    () => NetworkRepository(
      GetIt.I.get<ApiService>(),
      GetIt.I.get<CancelToken>(),
    ),
  );
}

void _initDioModule() {
  GetIt.I.registerSingleton(
    dioBuilder('http://jenkins-mobile.moneyman.ru/api/json?pretty=true'),
    //instanceName: "plazo_url",
  );
}

void _initServiceModule() {
  GetIt.I.registerSingleton(
    ApiService(GetIt.I.get<Dio>(//instanceName: "plazo_url"
        )),
  );
}
