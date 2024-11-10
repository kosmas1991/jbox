// To parse this JSON data, do
//
//     final requestSongResponse = requestSongResponseFromJson(jsonString);

import 'dart:convert';

RequestSongResponse requestSongResponseFromJson(String str) => RequestSongResponse.fromJson(json.decode(str));

String requestSongResponseToJson(RequestSongResponse data) => json.encode(data.toJson());

class RequestSongResponse {
    final int? code;
    final String? type;
    final String? message;
    final String? formattedMessage;
    final ExtraData? extraData;
    final bool? success;

    RequestSongResponse({
        this.code,
        this.type,
        this.message,
        this.formattedMessage,
        this.extraData,
        this.success,
    });

    RequestSongResponse copyWith({
        int? code,
        String? type,
        String? message,
        String? formattedMessage,
        ExtraData? extraData,
        bool? success,
    }) => 
        RequestSongResponse(
            code: code ?? this.code,
            type: type ?? this.type,
            message: message ?? this.message,
            formattedMessage: formattedMessage ?? this.formattedMessage,
            extraData: extraData ?? this.extraData,
            success: success ?? this.success,
        );

    factory RequestSongResponse.fromJson(Map<String, dynamic> json) => RequestSongResponse(
        code: json["code"],
        type: json["type"],
        message: json["message"],
        formattedMessage: json["formatted_message"],
        extraData: json["extra_data"] == null ? null : ExtraData.fromJson(json["extra_data"]),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "type": type,
        "message": message,
        "formatted_message": formattedMessage,
        "extra_data": extraData?.toJson(),
        "success": success,
    };
}

class ExtraData {
    final String? extraDataClass;
    final String? file;
    final int? line;

    ExtraData({
        this.extraDataClass,
        this.file,
        this.line,
    });

    ExtraData copyWith({
        String? extraDataClass,
        String? file,
        int? line,
    }) => 
        ExtraData(
            extraDataClass: extraDataClass ?? this.extraDataClass,
            file: file ?? this.file,
            line: line ?? this.line,
        );

    factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        extraDataClass: json["class"],
        file: json["file"],
        line: json["line"],
    );

    Map<String, dynamic> toJson() => {
        "class": extraDataClass,
        "file": file,
        "line": line,
    };
}
