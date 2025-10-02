import 'package:music_app/data/source/source.dart';

import '../model/song.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository{

  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();
  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];
    final remoteSong = await _remoteDataSource.loadData();
    if (remoteSong != null && remoteSong.isNotEmpty) {
      songs.addAll(remoteSong);
    } else {
      final localSong = await _localDataSource.loadData();
      if (localSong != null && localSong.isNotEmpty) {
        songs.addAll(localSong);
      }
    }

    return songs;
    }

  }

