import 'package:flutter/material.dart';
import 'package:jbox/azuracast_provider/azuracast_provider.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/models/nowplaying.dart';

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
      builder: (context, constraints) {
        var maxHeight = constraints.maxHeight;
        var maxWidth = constraints.maxWidth;
        'maxwidth is ${maxWidth} and maxheight is ${maxHeight}'.printError();
        var screenTextStyle =
            TextStyle(fontSize: maxWidth / 40, color: Colors.white);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.black54),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AZU URL: ${data['azuracastURL'] ?? ''}',
                    style: screenTextStyle,
                  ),
                  Text(
                    'terminal name: ${data['displayName'] ?? ''}',
                    style: screenTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.black54),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        return Text(
                          snapshot.data!.nowPlaying!.elapsed!.toString(),
                          style: screenTextStyle,
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
