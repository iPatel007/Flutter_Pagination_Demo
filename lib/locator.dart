import 'package:flutter_visitroof_test/Core/bloc/album_bloc.dart';
import 'package:flutter_visitroof_test/Core/service/album_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  _setupServices();
  _setupAppState();
}

Future _setupServices() async {
  locator.registerLazySingleton<AlbumService>(() => AlbumServiceImpl());
}

Future _setupAppState() async {
  locator.registerLazySingleton<AlbumState>(() => AlbumStateInitial());
}
