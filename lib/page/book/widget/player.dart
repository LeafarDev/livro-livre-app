import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:livro_livre_app/database/BookDatabase.dart';
import 'package:livro_livre_app/model/YoutubeTaskDownload.dart';
import 'package:livro_livre_app/redux/actions.dart';
import 'package:livro_livre_app/redux/app_state.dart';
import 'package:livro_livre_app/redux/store.dart';
import 'package:livro_livre_app/util/AudioUtil.dart';
import 'package:livro_livre_app/util/NavigationService.dart';
import 'package:livro_livre_app/util/SetupLocator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../util/assetAudioPlayer.dart';
import 'package:intl/intl.dart';

class Player extends StatefulWidget {
  @override
  PlayerState createState() {
    return PlayerState();
  }
}

class PlayerState extends State<Player> {
  double _currentPositionSlider = 0;

  @override
  Widget build(BuildContext context) {
    assetsAudioPlayer.playlistAudioFinished.listen((Playing playing) {
      store.dispatch(SetIsPlayingState(false));
      assetsAudioPlayer.stop();
      BookDatabase().updateCurrentPositionAudio(
          Duration(hours: 0, minutes: 0, seconds: 0).toString(),
          store.state.currentConsumingBook.id);
    });
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Escutar"),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
            distinct: true,
            converter: (store) => store.state,
            rebuildOnChange: true,
            builder: (context, state) {
              if (store.state.currentConsumingBook.audio_path == null ||
                  store.state.currentConsumingBook.audio_path == "") {
                _callDownloadMp3();
                var itemDownload = YoutubeTaskDownload((b) => b
                  ..id = ""
                  ..progress = 0
                  ..lastUpdate = DateTime.now());
                for (var i = 0; i < state.downloadsYt.length; i++) {
                  if (state.downloadsYt[i].id ==
                      store.state.currentConsumingBook.ytCode) {
                    itemDownload = state.downloadsYt[i];
                  }
                }
                return Center(
                  child: CircularPercentIndicator(
                    radius: 150.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: itemDownload.progress / 100,
                    center: Text(
                      "${itemDownload.progress}%",
                      style: TextStyle(color: Colors.white),
                    ),
                    footer: Text(
                      "Baixando: \"${store.state.currentConsumingBook.extractedTitle}\"",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
                  ),
                );
              } else {
                print(
                    store.state.currentConsumingBook.currentPositionAsObject());
                return Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        CachedNetworkImage(
                            imageUrl: store.state.currentConsumingBook.volumeInfo
                                        .imageLinks !=
                                    null
                                ? store.state.currentConsumingBook.volumeInfo
                                    .imageLinks.thumbnail
                                : 'https://text2image.com/user_images/202006/text2image_B9421546_20200613_190803.png'),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Text(
                            store.state.currentConsumingBook.extractedTitle
                                .replaceAll('\n', ' '),
                            style: const TextStyle(
                                fontSize: 17.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(14),
                            color: Colors.deepOrangeAccent,
                            child: Icon(
                              store.state.isPlaying == true
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              if (store.state.isPlaying == false) {
                                await assetsAudioPlayer.open(
                                  Audio.file(
                                    store.state.currentConsumingBook.audio_path,
                                    metas: Metas(
                                      title: store.state.currentConsumingBook
                                          .extractedTitle,
                                      artist: store.state.currentConsumingBook
                                          .extractedAuthor
                                          .trim(),
                                      image: MetasImage.network(store
                                                  .state
                                                  .currentConsumingBook
                                                  .volumeInfo
                                                  .imageLinks !=
                                              null
                                          ? store.state.currentConsumingBook
                                              .volumeInfo.imageLinks.thumbnail
                                          : 'https://text2image.com/user_images/202006/text2image_B9421546_20200613_190803.png'),
                                    ),
                                  ),
                                  seek: store.state.currentConsumingBook
                                      .currentPositionAsObject(),
                                  showNotification: true,
                                  notificationSettings: NotificationSettings(
                                      prevEnabled: false,
                                      nextEnabled: false,
                                      seekBarEnabled: true,
                                      customPlayPauseAction: (player) {
                                        if (store.state.isPlaying) {
                                          player.pause();
                                          store.dispatch(
                                              SetIsPlayingState(false));
                                        } else {
                                          player.play();
                                          store.dispatch(
                                              SetIsPlayingState(true));
                                        }
                                      },
                                      customStopAction: (player) {
                                        store
                                            .dispatch(SetIsPlayingState(false));
                                        player.stop();
                                      }),
                                  respectSilentMode: true,
                                );
                                store.dispatch(SetIsPlayingState(true));
                              } else {
                                //audioPlugin.stop();
                                await assetsAudioPlayer.stop();
                                store.dispatch(SetIsPlayingState(false));
                              }
                            },
                          ),
                        ),
                        if (store.state.isPlaying &&
                            assetsAudioPlayer.current.value != null)
                          PlayerBuilder.currentPosition(
                              player: assetsAudioPlayer,
                              builder: (context, duration) {
                                _currentPositionSlider =
                                    duration.inMilliseconds.toDouble();
                                if (store.state.isPlaying) {
                                  BookDatabase().updateCurrentPositionAudio(
                                      duration.toString(),
                                      store.state.currentConsumingBook.id);
                                }
                                final formatDuration =
                                    new DateFormat('hh:mm:ss');
                                return Column(
                                  children: <Widget>[
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.red[700],
                                        inactiveTrackColor: Colors.red[100],
                                        trackShape:
                                            RoundedRectSliderTrackShape(),
                                        trackHeight: 4.0,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 12.0),
                                        thumbColor: Colors.redAccent,
                                        overlayColor: Colors.red.withAlpha(32),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 28.0),
                                        tickMarkShape:
                                            RoundSliderTickMarkShape(),
                                        activeTickMarkColor: Colors.red[700],
                                        inactiveTickMarkColor: Colors.red[100],
                                        valueIndicatorShape:
                                            PaddleSliderValueIndicatorShape(),
                                        valueIndicatorColor: Colors.redAccent,
                                        valueIndicatorTextStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Slider(
                                        value: _currentPositionSlider,
                                        min: 0,
                                        max: assetsAudioPlayer.current.value
                                            .audio.duration.inMilliseconds
                                            .toDouble(),
                                        divisions: 120,
                                        label: formatDuration.format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                _currentPositionSlider.toInt(),
                                                isUtc: true)),
                                        onChanged: (value) {
                                          var dttime = DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  _currentPositionSlider
                                                      .toInt(),
                                                  isUtc: true);
                                          assetsAudioPlayer.seek(Duration(
                                              hours: dttime.hour,
                                              minutes: dttime.minute,
                                              seconds: dttime.second));
                                          setState(() {
                                            _currentPositionSlider = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          formatDuration.format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  _currentPositionSlider
                                                      .toInt(),
                                                  isUtc: true)),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Spacer(),
                                        Text(
                                          formatDuration.format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  assetsAudioPlayer
                                                      .current
                                                      .value
                                                      .audio
                                                      .duration
                                                      .inMilliseconds
                                                      .toInt(),
                                                  isUtc: true)),
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  _callDownloadMp3() async {
    var downloadsYt = store.state.downloadsYt;
    for (var i = 0; i < downloadsYt.length; i++) {
      if (downloadsYt[i].id == store.state.currentConsumingBook.ytCode) {
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
      backgroundColor: Colors.orangeAccent,
      message:
          "Pode levar alguns minutos dependendo da conexão, reproduziremos assim que terminar de baixar",
      duration: Duration(seconds: 9),
    )
      ..show(locator<NavigationService>()
          .navigatorKey
          .currentState
          .overlay
          .context);
    await AudioUtil().callDownloadOrPath(store.state.currentConsumingBook);
  }
}
