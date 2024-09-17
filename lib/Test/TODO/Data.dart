// List<Map> DataList2 = [
//   {
//     'taskType': "To Do",
//     'data': [
//       {
//         'task': "go to eat",
//         'time': "9AM",
//       },
//       {
//         'task': "go to school",
//         'time': "10AM",
//       },
//       {
//         'task': "play",
//         'time': "11AM",
//       },
//       {
//         'task': "go to eat",
//         'time': "9AM",
//       },
//       {
//         'task': "go to school",
//         'time': "10AM",
//       },
//       {
//         'task': "play",
//         'time': "11AM",
//       },
//     ]
//   },
//   {
//     'taskType': "Done",
//     'data': [
//       {
//         'task': "go to school",
//         'time': "10AM",
//       },
//       {
//         'task': "play",
//         'time': "11AM",
//       },
//     ]
//   }
// ];

class Task {
  String task;
  String time;

  Task({required this.task, required this.time});

  // Factory constructor to create a Task object from a Map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'],
      time: json['time'],
    );
  }

  // Method to convert a Task object to a Map
  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'time': time,
    };
  }
}

class TaskModel {
  String taskType;
  List<Task> data;

  TaskModel({required this.taskType, required this.data});

  // Factory constructor to create TaskModel from a Map
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskType: json['taskType'],
      data: List<Task>.from(json['data'].map((task) => Task.fromJson(task))),
    );
  }

  // Method to convert TaskModel object to a Map
  Map<String, dynamic> toJson() {
    return {
      'taskType': taskType,
      'data': data.map((task) => task.toJson()).toList(),
    };
  }
}

List<TaskModel> DataList = [
  TaskModel(taskType: "To Do", data: [
    Task(task: "Go to gem", time: "10 am"),
    Task(task: "Go to gem", time: "10 am"),
    Task(task: "Go to school", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
    Task(task: "Go to school", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
  ]),
  TaskModel(taskType: "Done", data: [
    Task(task: "Go to school", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
  ]),
  TaskModel(taskType: "Futre", data: [
    Task(task: "Go to school", time: "10 am"),
    Task(task: "Go to eat", time: "10 am"),
    Task(task: "Go to lanuch", time: "1 am"),
  ])
];
