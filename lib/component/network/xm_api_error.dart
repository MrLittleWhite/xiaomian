import 'dart:convert';

class XMApiError {
    int? code;
    String? message;

    XMApiError({
        this.code,
        this.message,
    });

    factory XMApiError.fromRawJson(String str) => XMApiError.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory XMApiError.fromJson(Map<String, dynamic> json) => XMApiError(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}
