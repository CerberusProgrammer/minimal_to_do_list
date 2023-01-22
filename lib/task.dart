class Task {
  String title;
  String content;
  bool isCompleted;

  Task(this.title, this.content, this.isCompleted);

  setTitle(String title) => this.title = title;
  String getTitle() => title;

  setContent(String content) => this.content = content;
  String getContent() => content;

  setIsCompleted(bool isCompleted) => this.isCompleted = isCompleted;
  bool getIsCompleted() => isCompleted;

  factory Task.fromJSON(dynamic json) {
    return Task(
      json['title'] as String,
      json['content'] as String,
      json['isCompleted'] as bool,
    );
  }

  Map<dynamic, dynamic> toJSON() => {
        'title': title,
        'content': content,
        'isCompleted': isCompleted,
      };

  @override
  String toString() {
    return '"title": $title, "content": $content, "isCompleted": $isCompleted';
  }
}
