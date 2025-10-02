import 'dart:convert';

import '../model/song.dart';
import 'package:http/http.dart' as http;

abstract interface class DataSource{
  Future<List<Song>?> loadData();
}

class RemoteDataSource implements DataSource
{
  @override
  Future<List<Song>?> loadData() async {
    const url = "https://thantrieu.com/resources/braniumapis/songs.json";
    final uri = Uri.parse(url);
    final respone = await http.get(uri);
    if(respone.statusCode == 200){
      final bodyContent = utf8.decode(respone.bodyBytes);
      var songWrapper = jsonDecode(bodyContent) as Map;
      var songList = songWrapper['songs'] as List;
      List<Song> songs = songList.map((song) => Song.fromJson(song)).toList();
      return songs;
    }
    else
      return null;
  }

}


class LocalDataSource implements DataSource{
  @override
  Future<List<Song>?> loadData() async{
    // TODO: implement loadData
    throw UnimplementedError();
  }

}