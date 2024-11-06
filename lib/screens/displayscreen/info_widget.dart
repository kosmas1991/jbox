import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:jbox/azuracast_provider/azuracast_provider.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/models/nowplaying.dart';

//TODO replace !s with ?s for null safety

class InfoWidget extends StatefulWidget {
  const InfoWidget({
    super.key,
    required this.data,
    required this.scale,
  });

  final Map<String, dynamic> data;
  final double scale;

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  late Future<NowPlaying> nowPlaying;
  @override
  void initState() {
    nowPlaying =
        AzuracastProvider.getNowPlaying(url: widget.data['azuracastURL']);
    nowPlaying.then(
      (value) => _assetsAudioPlayer.open(
        Audio.liveStream(value.station!.mounts!.first.url ?? ''),
        autoStart: false,
        playInBackground: PlayInBackground.enabled,
        volume: 1,
        showNotification: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataStream =
        AzuracastProvider.nowPlayingStream(url: widget.data['azuracastURL'])
            .asBroadcastStream();
    double width = MediaQuery.of(context).size.width;
    'width is ${width}'.printWhite();
    return LayoutBuilder(
      //! maxWidth is used to achieve responsiveness, every widget should use it as size parameter if possible
      builder: (context, constraints) {
        var maxHeight = constraints.maxHeight;
        var maxWidth = constraints.maxWidth;
        'maxwidth is ${maxWidth} and maxheight is ${maxHeight}'.printError();
        var screenTextStyle =
            TextStyle(fontSize: maxWidth / 40, color: Colors.white);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! playing now data
            Container(
              width: maxWidth * 2 / 3,
              padding: EdgeInsets.all(maxWidth / 40),
              decoration:
                  BoxDecoration(color: const Color.fromARGB(146, 0, 0, 0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Παίζει τώρα',
                    style: screenTextStyle,
                  ),
                  SizedBox(
                    height: maxWidth / 30,
                  ),
                  StreamBuilder<NowPlaying>(
                      stream: dataStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Container(
                              width: maxWidth / 30,
                              height: maxWidth / 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(
                            'Συνέβη κάποιο σφάλμα!',
                            style: screenTextStyle,
                          );
                        }

                        return Row(
                          children: [
                            Image.network(
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Container(
                                    width: maxWidth / 30,
                                    height: maxWidth / 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              },
                              snapshot.data!.nowPlaying!.song!.art!,
                              width: maxWidth / 8,
                              height: maxWidth / 8,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: maxWidth / 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: maxWidth * 1.3 / 3,
                                  child: Text(
                                    snapshot.data!.nowPlaying!.song!.title
                                        .toString(),
                                    style: screenTextStyle,
                                  ),
                                ),
                                Container(
                                  width: maxWidth * 1.3 / 3,
                                  child: Text(
                                    snapshot.data!.nowPlaying!.song!.artist
                                        .toString(),
                                    style: screenTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: maxWidth / 30,
                  ),
                  //! player and volume
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              _assetsAudioPlayer.playOrPause();
                            },
                            icon: PlayerBuilder.isPlaying(
                                player: _assetsAudioPlayer,
                                builder: (context, isPlaying) => isPlaying
                                    ? Icon(
                                        Icons.pause_circle_outline,
                                        size: maxWidth / 15,
                                        color: Colors.blue,
                                      )
                                    : Icon(
                                        Icons.play_circle_outline,
                                        size: maxWidth / 15,
                                        color: Colors.blue,
                                      ))),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Icon(
                                Icons.volume_mute,
                                color: Colors.grey,
                                size: maxWidth / 20,
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: PlayerBuilder.volume(
                                player: _assetsAudioPlayer,
                                builder: (context, volume) => Slider(
                                  activeColor: Colors.grey,
                                  value: volume,
                                  onChanged: (value) {
                                    _assetsAudioPlayer.setVolume(value);
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Icon(
                                Icons.volume_up,
                                color: Colors.grey,
                                size: maxWidth / 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: maxWidth / 30,
            ),
            //! next song data
            Container(
              width: maxWidth * 2 / 3,
              padding: EdgeInsets.all(maxWidth / 40),
              decoration:
                  BoxDecoration(color: const Color.fromARGB(146, 0, 0, 0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Επόμενο τραγούδι',
                    style: screenTextStyle,
                  ),
                  SizedBox(
                    height: maxWidth / 30,
                  ),
                  StreamBuilder<NowPlaying>(
                      stream: dataStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Container(
                              width: maxWidth / 30,
                              height: maxWidth / 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(
                            'Συνέβη κάποιο σφάλμα!',
                            style: screenTextStyle,
                          );
                        }
                        return Row(
                          children: [
                            Image.network(
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Container(
                                    width: maxWidth / 30,
                                    height: maxWidth / 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              },
                              snapshot.data!.playingNext!.song!.art!,
                              width: maxWidth / 8,
                              height: maxWidth / 8,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: maxWidth / 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: maxWidth * 1.3 / 3,
                                  child: Text(
                                    snapshot.data!.playingNext!.song!.title
                                        .toString(),
                                    style: screenTextStyle,
                                  ),
                                ),
                                Container(
                                  width: maxWidth * 1.3 / 3,
                                  child: Text(
                                    snapshot.data!.playingNext!.song!.artist
                                        .toString(),
                                    style: screenTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
