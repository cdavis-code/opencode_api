// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
  id: json['id'] as String?,
  slug: json['slug'] as String?,
  projectID: json['projectID'] as String?,
  directory: json['directory'] as String?,
  title: json['title'] as String?,
  version: json['version'] as String?,
  parentID: json['parentID'] as String?,
  summary: json['summary'] == null
      ? null
      : SessionSummary.fromJson(json['summary'] as Map<String, dynamic>),
  permission: (json['permission'] as List<dynamic>?)
      ?.map((e) => SessionPermission.fromJson(e as Map<String, dynamic>))
      .toList(),
  time: json['time'] == null
      ? null
      : SessionTime.fromJson(json['time'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'projectID': instance.projectID,
  'directory': instance.directory,
  'title': instance.title,
  'version': instance.version,
  'parentID': instance.parentID,
  'summary': instance.summary,
  'permission': instance.permission,
  'time': instance.time,
};

SessionSummary _$SessionSummaryFromJson(Map<String, dynamic> json) =>
    SessionSummary(
      additions: (json['additions'] as num?)?.toInt(),
      deletions: (json['deletions'] as num?)?.toInt(),
      files: (json['files'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SessionSummaryToJson(SessionSummary instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'deletions': instance.deletions,
      'files': instance.files,
    };

SessionPermission _$SessionPermissionFromJson(Map<String, dynamic> json) =>
    SessionPermission(
      permission: json['permission'] as String?,
      action: json['action'] as String?,
      pattern: json['pattern'] as String?,
    );

Map<String, dynamic> _$SessionPermissionToJson(SessionPermission instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'action': instance.action,
      'pattern': instance.pattern,
    };

SessionTime _$SessionTimeFromJson(Map<String, dynamic> json) => SessionTime(
  created: (json['created'] as num?)?.toInt(),
  updated: (json['updated'] as num?)?.toInt(),
);

Map<String, dynamic> _$SessionTimeToJson(SessionTime instance) =>
    <String, dynamic>{'created': instance.created, 'updated': instance.updated};
