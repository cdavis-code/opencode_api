import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

/// Represents a session in the opencode system
@JsonSerializable()
class Session {
  final String? id;
  final String? slug;
  final String? projectID;
  final String? directory;
  final String? title;
  final String? version;
  final String? parentID;
  final SessionSummary? summary;
  final List<SessionPermission>? permission;
  final SessionTime? time;

  Session({
    this.id,
    this.slug,
    this.projectID,
    this.directory,
    this.title,
    this.version,
    this.parentID,
    this.summary,
    this.permission,
    this.time,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

/// Summary of session changes
@JsonSerializable()
class SessionSummary {
  final int? additions;
  final int? deletions;
  final int? files;

  SessionSummary({this.additions, this.deletions, this.files});

  factory SessionSummary.fromJson(Map<String, dynamic> json) =>
      _$SessionSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SessionSummaryToJson(this);
}

/// Permission for a session
@JsonSerializable()
class SessionPermission {
  final String? permission;
  final String? action;
  final String? pattern;

  SessionPermission({this.permission, this.action, this.pattern});

  factory SessionPermission.fromJson(Map<String, dynamic> json) =>
      _$SessionPermissionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionPermissionToJson(this);
}

/// Time information for a session
@JsonSerializable()
class SessionTime {
  final int? created;
  final int? updated;

  SessionTime({this.created, this.updated});

  factory SessionTime.fromJson(Map<String, dynamic> json) =>
      _$SessionTimeFromJson(json);
  Map<String, dynamic> toJson() => _$SessionTimeToJson(this);
}
