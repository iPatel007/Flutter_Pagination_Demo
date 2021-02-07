import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitroof_test/Core/service/album_service.dart';
import 'package:flutter_visitroof_test/Models/album.dart';
import 'package:flutter_visitroof_test/locator.dart';

class AlbumBloc extends Cubit<AlbumState> {
  final _albumService = locator<AlbumService>();

  AlbumBloc() : super(AlbumStateInitial()) {
    getAlbumList();
  }

  List<Album> _listAlbum;
  List<Album> get listAlbum => _listAlbum;

  int userID = 1;
  getAlbumList() async {
    if(userID > 10) return;
    try {
      if (_listAlbum == null) emit(AlbumStateLoading());
      List<Album> _result =
          await _albumService.getAlbumListBy(userID: userID.toString());
      if (_listAlbum == null) {
        _listAlbum = _result;
      } else {
        _listAlbum.addAll(_result);
      }
      emit(AlbumStateLoaded(_listAlbum));
    } catch (e) {
      emit(AlbumStateError(e));
    }
  }
}

abstract class AlbumState {
  const AlbumState();
}

class AlbumStateInitial extends AlbumState {
  const AlbumStateInitial();
}

class AlbumStateLoading extends AlbumState {
  const AlbumStateLoading();
}

class AlbumStateLoaded extends AlbumState {
  final List<Album> albumList;
  const AlbumStateLoaded(this.albumList);
}

class AlbumStateError extends AlbumState {
  final String message;
  const AlbumStateError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AlbumStateError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
