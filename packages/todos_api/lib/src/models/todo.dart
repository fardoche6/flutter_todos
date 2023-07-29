import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todos_api/src/models/json_map.dart';
import 'package:todos_api/todos_api.dart';
import 'package:uuid/uuid.dart';

// to update todo.g.dart file: dart run build_runner build
part 'todo.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: flutter_style_todos
@immutable
@JsonSerializable()
class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  // TODO (alex): to add int he future and (challenge) try to use the dataClass
  // final String userId;
  // final DateTime timeUsed;
  // final String photoUrl;
  // final String whoDidIt;

  Todo({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isCompleted.hashCode;
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  /// Deserializes the given [JsonMap] into a [Todo].
  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);

  /// Converts this [Todo] into a [JsonMap].
  JsonMap toJson() => _$TodoToJson(this);

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, isCompleted: $isCompleted)';
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
