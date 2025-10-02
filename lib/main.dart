import 'package:flutter/material.dart';
import 'package:music_app/data/repository/repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var repository = DefaultRepository();
  var songs = await repository.loadData();
  if(songs != null){
    for(var song in songs){
      debugPrint(song.toString());

    }

  }
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Ctrl Alt L => format code
