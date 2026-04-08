import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

/// Represents a message in the opencode system
@JsonSerializable()
class Message {
  final String? id;
  final String? sessionId;
  final String? content;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<MessagePart>? parts;

  Message({
    this.id,
    this.sessionId,
    this.content,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.parts,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// Represents a part of a message
@JsonSerializable()
class MessagePart {
  final String? id;
  final String? type;
  final String? content;
  final String? text;
  final DateTime? createdAt;

  MessagePart({this.id, this.type, this.content, this.text, this.createdAt});

  factory MessagePart.fromJson(Map<String, dynamic> json) =>
      _$MessagePartFromJson(json);
  Map<String, dynamic> toJson() => _$MessagePartToJson(this);
}
