class Task {
  Task({required this.name, this.isChecked = false});

  String name;
  bool isChecked;

  void taskChecked() {
    isChecked = !isChecked;
  }

  @override
  String toString() {
    return this.name;
  }
}

List<Task> tasks = [];
