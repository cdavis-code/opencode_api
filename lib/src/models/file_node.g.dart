// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileNode _$FileNodeFromJson(Map<String, dynamic> json) => FileNode(
  id: json['id'] as String,
  name: json['name'] as String,
  path: json['path'] as String,
  type: $enumDecode(_$FileTypeEnumMap, json['type']),
  size: (json['size'] as num?)?.toInt(),
  modifiedAt: json['modifiedAt'] == null
      ? null
      : DateTime.parse(json['modifiedAt'] as String),
  children: (json['children'] as List<dynamic>?)
      ?.map((e) => FileNode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FileNodeToJson(FileNode instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'path': instance.path,
  'type': _$FileTypeEnumMap[instance.type]!,
  'size': instance.size,
  'modifiedAt': instance.modifiedAt?.toIso8601String(),
  'children': instance.children,
};

const _$FileTypeEnumMap = {
  FileType.file: 'file',
  FileType.directory: 'directory',
};
