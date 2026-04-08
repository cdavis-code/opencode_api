import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Represents a project in the opencode system
@JsonSerializable()
class Project {
  final String? id;
  final String? worktree;
  final String? path;
  final String? description;
  final ProjectTime? time;
  final List<dynamic>? sandboxes;

  Project({
    this.id,
    this.worktree,
    this.path,
    this.description,
    this.time,
    this.sandboxes,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

/// Time information for a project
@JsonSerializable()
class ProjectTime {
  final int? created;
  final int? updated;

  ProjectTime({this.created, this.updated});

  factory ProjectTime.fromJson(Map<String, dynamic> json) =>
      _$ProjectTimeFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectTimeToJson(this);
}
