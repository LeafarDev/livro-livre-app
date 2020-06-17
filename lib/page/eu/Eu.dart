import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livro_livre_app/database/LivroDatabase.dart';
import 'package:livro_livre_app/util/AudioUtil.dart';
import 'package:livro_livre_app/util/LivroExtractor.dart';
import 'package:sqflite/sqflite.dart';

class Eu extends StatefulWidget {
  @override
  EuState createState() {
    return EuState();
  }
}

class EuState extends State<Eu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.red,
              child: Text('player'),
              onPressed: () async {
                var db = await openDatabase('projeto_livro_livre.db');
                // await db.execute('drop table book;');
                // LivroDatabase().createDatabase();
                // reload();
                // Get the stream info for the passed video
                // var dir = await getExternalStorageDirectory();
//          audioPlugin.stop();
                // audioPlugin.play("${dir.path}/85766db816f0c4b46aa5c38b7014f6740cac858825d368009b560008f97c6d63.mp3", isLocal: true);
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('extract'),
              onPressed: () async {
                var db = await openDatabase('projeto_livro_livre.db');
                await LivroDatabase().createDatabase();
                await db.execute('drop table book;');
                await LivroDatabase().createDatabase();
                await LivroExtractor().processarExtracaoLivro();
                // Get the stream info for the passed video
                // var dir = await getExternalStorageDirectory();
//          audioPlugin.stop();
                // audioPlugin.play("${dir.path}/85766db816f0c4b46aa5c38b7014f6740cac858825d368009b560008f97c6d63.mp3", isLocal: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
