class TodoApp {
  final String content;
  final bool done;
  final DateTime timestamp;
  final String id;

//<editor-fold desc="Data Methods">

  TodoApp({
    required this.content,
    required this.done,
    required this.timestamp,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoApp &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          done == other.done &&
          timestamp == other.timestamp &&
          id == other.id);

  @override
  int get hashCode =>
      content.hashCode ^ done.hashCode ^ timestamp.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'Todo{' +
        ' content: $content,' +
        ' done: $done,' +
        ' timestamp: $timestamp,' +
        ' id: $id,' +
        '}';
  }

  TodoApp copyWith({
    String? content,
    bool? done,
    DateTime? timestamp,
    String? id,
  }) {
    return TodoApp(
      content: content ?? this.content,
      done: done ?? this.done,
      timestamp: timestamp ?? this.timestamp,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': this.content,
      'done': this.done,
      'timestamp': this.timestamp.toIso8601String(),
      'id': this.id,
    };
  }

  factory TodoApp.fromMap(Map<String, dynamic> map) {
    return TodoApp(
      content: map['content'] as String,
      done: map['done'] as bool,
      timestamp: DateTime.parse(map['timestamp']),
      id: map['id'] as String,
    );
  }

//</editor-fold>
}