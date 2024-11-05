import 'package:http/http.dart';
import 'package:jbox/models/nowplaying.dart';
import 'package:http/http.dart' as http;

class AzuracastProvider {
  static Future<NowPlaying> getNowPlaying({required String url}) async {
    Future<Response> response = http.get(Uri.parse('$url/api/nowplaying'));
    NowPlaying nowPlaying = await response.then((value) {
      return nowPlayingFromJson(value.body)[0];
    });
    return nowPlaying;
  }

  //? stram that returns getNowPlaying() data every 10 seconds
  static Stream<NowPlaying> nowPlayingStream({required String url}) async* {
    // Emit the first NowPlaying data immediately
    yield await getNowPlaying(url: url);

    // Then, emit data every 5 seconds
    await for (final _ in Stream.periodic(Duration(seconds: 10))) {
      yield await getNowPlaying(url: url);
    }
  }
}
