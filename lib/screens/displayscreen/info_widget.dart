import 'package:flutter/material.dart';
import 'package:jbox/azuracast_provider/azuracast_provider.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/models/nowplaying.dart';

//TODO replace !s with ?s for null safety

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.data,
    required this.scale,
  });

  final Map<String, dynamic> data;
  final double scale;

  @override
  Widget build(BuildContext context) {
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
                      stream: AzuracastProvider.nowPlayingStream(
                          url: data['azuracastURL']),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
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
                                  return CircularProgressIndicator(
                                    color: Colors.black,
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
                                Text(
                                  snapshot.data!.nowPlaying!.song!.title
                                      .toString(),
                                  style: screenTextStyle,
                                ),
                                Text(
                                  snapshot.data!.nowPlaying!.song!.artist
                                      .toString(),
                                  style: screenTextStyle,
                                ),
                              ],
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
            SizedBox(
              height: maxWidth / 30,
            ),
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
                      stream: AzuracastProvider.nowPlayingStream(
                          url: data['azuracastURL']),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {}
                        if (snapshot.hasError) {}
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
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
                                  return CircularProgressIndicator(
                                    color: Colors.black,
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
                                Text(
                                  snapshot.data!.playingNext!.song!.title
                                      .toString(),
                                  style: screenTextStyle,
                                ),
                                Text(
                                  snapshot.data!.playingNext!.song!.artist
                                      .toString(),
                                  style: screenTextStyle,
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
