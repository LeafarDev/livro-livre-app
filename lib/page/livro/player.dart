import 'package:audioplayer/audioplayer.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/app_state.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/AudioUtil.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';

class Player extends StatefulWidget {
  @override
  PlayerState createState() {
    return PlayerState();
  }
}

class PlayerState extends State<Player> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escutar audiolivro"),
      ),
      body: SizedBox.expand(child: MyPageWithAudio()),
    );
  }
}

class MyPageWithAudio extends StatefulWidget {
  @override
  _MyPageWithAudioState createState() => _MyPageWithAudioState();
}

class _MyPageWithAudioState extends State<MyPageWithAudio> {
  String _currentPosition = "";
  AudioPlayer audioPlugin = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, AppState>(
          distinct: true,
          converter: (store) => store.state,
          rebuildOnChange: true,
          builder: (context, state) {
            if (store.state.livroSendoConsumido.audio_path == null ||
                store.state.livroSendoConsumido.audio_path == "") {
              callDownloadMp3();
              var itemDownload = YoutubeTaskDownload((b) => b
                ..id = ""
                ..progresso = 0
                ..ultimaAtualizacao = DateTime.now());
              for (var i = 0; i < state.downloadsYt.length; i++) {
                if (state.downloadsYt[i].id ==
                    store.state.livroSendoConsumido.ytCode) {
                  itemDownload = state.downloadsYt[i];
                }
              }
              return Center(child: Text("baixando ${itemDownload.progresso}%"));
            } else {
              print(store.state.livroSendoConsumido.audio_path);
              if (!store.state.isPlaying) {
                audioPlugin.play(store.state.livroSendoConsumido.audio_path);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(store.state.livroSendoConsumido.extractedTitle),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                      color: Theme.of(context).primaryColor,
                      child: Icon(
                        store.state.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          store.dispatch(
                              SetIsPlayingState(!store.state.isPlaying));
                          if (store.state.isPlaying == false) {
                            audioPlugin.play(
                                store.state.livroSendoConsumido.audio_path);
                          } else {
                            audioPlugin.stop();
                          }
                        });
                      },
                    ),
                  ),
                  Text(_currentPosition),
                ],
              );
            }
          }),
    );
  }

  callDownloadMp3() async {
    var downloadsYt = store.state.downloadsYt;
    for (var i = 0; i < downloadsYt.length; i++) {
      if (downloadsYt[i].id == store.state.livroSendoConsumido.ytCode) {
        return;
      }
    }
    await Flushbar(
      icon: Icon(
        Icons.cloud_download,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      title: "Fazendo download do audiolivro",
      backgroundColor: Colors.deepOrangeAccent,
      message:
          "Pode levar alguns minutos dependendo da conexão, reproduziremos assim que terminar de baixar",
      duration: Duration(seconds: 3),
    )
      ..show(locator<NavigationService>()
          .navigatorKey
          .currentState
          .overlay
          .context);
    await AudioUtil().callDownloadOrPath(store.state.livroSendoConsumido);
  }
}
