// To parse this JSON data, do
//
//     final requestList = requestListFromJson(jsonString);

import 'dart:convert';

List<RequestSong> requestListFromJson(String str) => List<RequestSong>.from(
    json.decode(str).map((x) => RequestSong.fromJson(x)));

String requestListToJson(List<RequestSong> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestSong {
  final String? requestId;
  final String? requestUrl;
  final Song? song;

  RequestSong({
    this.requestId,
    this.requestUrl,
    this.song,
  });

  RequestSong copyWith({
    String? requestId,
    String? requestUrl,
    Song? song,
  }) =>
      RequestSong(
        requestId: requestId ?? this.requestId,
        requestUrl: requestUrl ?? this.requestUrl,
        song: song ?? this.song,
      );

  factory RequestSong.fromJson(Map<String, dynamic> json) => RequestSong(
        requestId: json["request_id"],
        requestUrl: json["request_url"],
        song: json["song"] == null ? null : Song.fromJson(json["song"]),
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "request_url": requestUrl,
        "song": song?.toJson(),
      };
}

class Song {
  final String? id;
  final String? art;
  final List<dynamic>? customFields;
  final String? text;
  final String? artist;
  final String? title;
  final String? album;
  final String? genre;
  final String? isrc;
  final String? lyrics;

  Song({
    this.id,
    this.art,
    this.customFields,
    this.text,
    this.artist,
    this.title,
    this.album,
    this.genre,
    this.isrc,
    this.lyrics,
  });

  Song copyWith({
    String? id,
    String? art,
    List<dynamic>? customFields,
    String? text,
    String? artist,
    String? title,
    String? album,
    String? genre,
    String? isrc,
    String? lyrics,
  }) =>
      Song(
        id: id ?? this.id,
        art: art ?? this.art,
        customFields: customFields ?? this.customFields,
        text: text ?? this.text,
        artist: artist ?? this.artist,
        title: title ?? this.title,
        album: album ?? this.album,
        genre: genre ?? this.genre,
        isrc: isrc ?? this.isrc,
        lyrics: lyrics ?? this.lyrics,
      );

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        art: json["art"],
        customFields: json["custom_fields"] == null
            ? []
            : List<dynamic>.from(json["custom_fields"]!.map((x) => x)),
        text: json["text"],
        artist: json["artist"],
        title: json["title"],
        album: json["album"],
        genre: json["genre"],
        isrc: json["isrc"],
        lyrics: json["lyrics"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "art": art,
        "custom_fields": customFields == null
            ? []
            : List<dynamic>.from(customFields!.map((x) => x)),
        "text": text,
        "artist": artist,
        "title": title,
        "album": album,
        "genre": genre,
        "isrc": isrc,
        "lyrics": lyrics,
      };
}
