// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: json['id'] as String?,
  worktree: json['worktree'] as String?,
  path: json['path'] as String?,
  description: json['description'] as String?,
  time: json['time'] == null
      ? null
      : ProjectTime.fromJson(json['time'] as Map<String, dynamic>),
  sandboxes: json['sandboxes'] as List<dynamic>?,
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'worktree': instance.worktree,
  'path': instance.path,
  'description': instance.description,
  'time': instance.time,
  'sandboxes': instance.sandboxes,
};

ProjectTime _$ProjectTimeFromJson(Map<String, dynamic> json) => ProjectTime(
  created: (json['created'] as num?)?.toInt(),
  updated: (json['updated'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProjectTimeToJson(ProjectTime instance) =>
    <String, dynamic>{'created': instance.created, 'updated': instance.updated};
