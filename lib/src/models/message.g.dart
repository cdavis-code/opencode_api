// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String?,
  sessionId: json['sessionId'] as String?,
  content: json['content'] as String?,
  role: json['role'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  parts: (json['parts'] as List<dynamic>?)
      ?.map((e) => MessagePart.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'content': instance.content,
  'role': instance.role,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'parts': instance.parts,
};

MessagePart _$MessagePartFromJson(Map<String, dynamic> json) => MessagePart(
  id: json['id'] as String?,
  type: json['type'] as String?,
  content: json['content'] as String?,
  text: json['text'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessagePartToJson(MessagePart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'text': instance.text,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
