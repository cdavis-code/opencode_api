import 'package:json_annotation/json_annotation.dart';

part 'file_node.g.dart';

/// Represents a file or directory node in the opencode system
@JsonSerializable()
class FileNode {
  final String id;
  final String name;
  final String path;
  final FileType type;
  final int? size;
  final DateTime? modifiedAt;
  final List<FileNode>? children;

  FileNode({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    this.size,
    this.modifiedAt,
    this.children,
  });

  factory FileNode.fromJson(Map<String, dynamic> json) =>
      _$FileNodeFromJson(json);
  Map<String, dynamic> toJson() => _$FileNodeToJson(this);
}

/// Enumeration for file types
enum FileType {
  file('file'),
  directory('directory');

  const FileType(this.value);
  final String value;

  @override
  String toString() => value;
}
