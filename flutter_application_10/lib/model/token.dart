import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: "accessToken")
  String accessToken;

  @JsonKey(name: "refreshToken")
  String refreshToken;

  @JsonKey(name: "username")
  String username;

  Token({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
