import 'dart:convert';

import 'package:http/http.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/models/nowplaying.dart';
import 'package:http/http.dart' as http;
import 'package:jbox/models/requestlist.dart';
import 'package:jbox/models/requestsongresponse.dart';

class AzuracastProvider {
  static Future<NowPlaying> getNowPlaying({required String url}) async {
    Response response;
    try {
      response = await http.get(Uri.parse('$url/api/nowplaying'));
    } catch (e) {
      throw Exception(
          'Αδυναμία επικοινωνίας με τον server. Ελέγξτε την παράμετρο azuracast URL');
    }

    NowPlaying nowPlaying = nowPlayingFromJson(response.body).first;
    return nowPlaying;
  }

  // Stream that returns getNowPlaying() data every 10 seconds
  static Stream<NowPlaying> nowPlayingStream({required String url}) async* {
    try {
      // Emit the first NowPlaying data immediately
      yield await getNowPlaying(url: url);

      // Then, emit data every 10 seconds
      await for (final _ in Stream.periodic(Duration(seconds: 10))) {
        yield await getNowPlaying(url: url);
      }
    } catch (e) {
      // Yield an error to the stream if getNowPlaying fails
      yield* Stream.error(e);
    }
  }

  static Future<List<RequestSong>> getRequestList(
      {required String url, int stationID = 1}) async {
    // https://radioserver.gr/api/station/1/requests
    Response response;
    try {
      response =
          await http.get(Uri.parse('$url/api/station/$stationID/requests'));
    } catch (e) {
      throw Exception(
          'Αδυναμία επικοινωνίας με τον server. Ελέγξτε την παράμετρο azuracast URL ή το station ID');
    }

    List<RequestSong> requestList = requestListFromJson(response.body);
    return requestList;
  }

  // Stream that returns getRequestList() data every 10 seconds
  static Stream<List<RequestSong>> RequestListStream(
      {required String url, int stationID = 1}) async* {
    try {
      // Emit the first NowPlaying data immediately
      yield await getRequestList(url: url, stationID: stationID);

      // Then, emit data every 10 seconds
      await for (final _ in Stream.periodic(Duration(seconds: 10))) {
        yield await getRequestList(url: url, stationID: stationID);
      }
    } catch (e) {
      // Yield an error to the stream if getNowPlaying fails
      yield* Stream.error(e);
    }
  }

  static Future<RequestSongResponse> getRequestSongResponse(
      {required String url,
      required String requestID,
      int stationID = 1}) async {
    // https://radioserver.gr/api/station/1/request/7262ca68bf9f0f7590750ea3

    'url->${url}  requestID->${requestID} stationID-> ${stationID}'
        .printError();
    var urlData = '$url/api/station/$stationID/request/$requestID';
    Response response = Response.bytes([152, 8585], 200);
    try {
      response = await http.post(Uri.parse(urlData));
      if (response.statusCode == 500) {
        'hi'.printWarning();
      }
    } catch (e) {
      'erorrrrr and resp ->${response.bodyBytes}'.printGreen();
    }

    var requestSongResponse = requestSongResponseFromJson(response.body);
    return requestSongResponse;
  }
}
