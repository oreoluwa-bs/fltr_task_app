import 'package:flutter/material.dart';
// import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/priority.dart';
import 'package:task_app/src/models/task.dart';

class Activity {
  final String title, description, priority;
  final DateTime dueDate;
  final List<Task> tasks;

  Activity({
    @required this.title,
    @required this.description,
    @required this.priority,
    @required this.dueDate,
    @required this.tasks,
  });

  Activity.fromJSON(parsedJSON)
      : title = parsedJSON['title'],
        description = parsedJSON['description'],
        priority = parsedJSON['priority'],
        dueDate = parsedJSON['dueDate'],
        tasks = parsedJSON['tasks'];

  Color get priorityColor {
    final priorityColor = priorities[priority]['color'];
    return priorityColor;
  }

  List<Task> get incompleteTasks =>
      tasks.where((task) => task.completed == false).toList();
  List<Task> get completeTasks =>
      tasks.where((task) => task.completed == true).toList();
  double get progress => (completeTasks.length / tasks.length) ?? 0;

  void addTask(parsedJSON) {
    tasks.add(Task.fromJSON(parsedJSON));
  }

  void deleteTask(id) {
    tasks.removeWhere((element) => element.id == id);
  }
}

// final List<Activity> urgentActivities = [
//   Activity.fromJSON({
//     "title": "Date with Maeve",
//     "description":
//         "Date with Mave on the 30th of October 2020. The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl…",
//     "priority": "critical",
//     "dueDate": DateTime.utc(2020, 9, 30),
//     "tasks": [
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12331',
//         "completed": false
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12332',
//         'completed': true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12333',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12333',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12333',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12333',
//         "completed": true
//       }),
//     ],
//   }),
//   Activity.fromJSON({
//     "title": "Flow-brow Hackathon",
//     "description": "Hackathon",
//     "priority": "important",
//     "dueDate": DateTime.utc(2020, 11, 2),
//     "tasks": [
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12334',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12335',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12336',
//         "completed": true
//       }),
//     ],
//   }),
//   Activity.fromJSON({
//     "title": "Grocery Shopping",
//     "description": "Get Grocery for the week",
//     "priority": "relaxed",
//     "dueDate": DateTime.utc(2020, 10, 30),
//     "tasks": [
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12337',
//         "completed": true
//       }),
//       Task.fromJSON({
//         "title": 'Hello',
//         "subtitle": "Hi",
//         "id": '12338',
//         "completed": true
//       }),
//     ],
//   })
// ];

final List<Activity> activities = [
  Activity.fromJSON({
    "title": "Date with Maeve",
    "description":
        "Date with Mave on the 30th of October 2020. The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl…",
    "priority": "critical",
    "dueDate": DateTime.utc(2020, 10, 30),
    "tasks": [
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12331',
        "completed": true
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12332',
        'completed': true
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": true
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": false
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": false
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": false
      }),
    ],
  }),
  Activity.fromJSON({
    "title": "Flow-brow Hackathon",
    "description": "Hackathon",
    "priority": "important",
    "dueDate": DateTime.utc(2020, 11, 2),
    "tasks": [
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12331',
        "completed": true
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12332',
        'completed': false
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": true
      }),
    ],
  }),
  Activity.fromJSON({
    "title": "Grocery Shopping",
    "description": "Get Grocery for the week",
    "priority": "relaxed",
    "dueDate": DateTime.utc(2020, 10, 30),
    "tasks": [
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12331',
        "completed": true
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12332',
        'completed': false
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": false
      }),
      Task.fromJSON({
        "title": 'Hello',
        "subtitle": "Hi",
        "id": '12333',
        "completed": false
      }),
    ],
  })
];
