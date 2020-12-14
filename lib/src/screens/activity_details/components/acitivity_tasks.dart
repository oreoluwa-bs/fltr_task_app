import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';
import 'package:task_app/src/models/task.dart';

class ActivityTasks extends StatelessWidget {
  final Activity activity;

  const ActivityTasks({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = activity.tasks;

    final double taskCardHeight = 60.0;
    final double taskCardMargin = 10.0;
    final double listHeight = (((taskCardHeight + 10.0) * tasks.length) +
        (taskCardMargin * 2 * tasks.length));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            padding: const EdgeInsets.only(top: 30.0, left: 35.0, right: 35.0),
            title: 'Tasks',
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        contentPadding: EdgeInsets.all(20.0),
                        title: Text('New task'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        children: [
                          Form(
                              child: Column(
                            children: [
                              TextFormField(
                                // autofocus: true,
                                decoration: kTaskFormInputDecoration.copyWith(
                                    hintText: 'Title'),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                // autofocus: true,
                                decoration: kTaskFormInputDecoration.copyWith(
                                    hintText: 'Subtitle'),
                              ),
                              SizedBox(height: 30.0),
                              MaterialButton(
                                onPressed: () {
                                  // activity.addTask();
                                },
                                child: Text(
                                  'Add Task',
                                  style: TextStyle(letterSpacing: 1.1),
                                ),
                                color: primaryColor,
                                textColor: Colors.white,
                                focusElevation: 0.0,
                                highlightElevation: 0.0,
                                elevation: 0.0,
                                minWidth: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ))
                        ],
                      );
                    },
                  );
                },
                color: primaryColor,
                iconSize: 30.0,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35.0),
            height: listHeight,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: tasks.length,
              itemBuilder: (context, int index) {
                final Task task = tasks[index];
                return Dismissible(
                  key: Key(task.id),
                  onDismissed: (direction) {
                    activity.deleteTask(task.id);
                  },
                  child: GestureDetector(
                    onTap: () {
                      task.toggleComplete();
                    },
                    child: Opacity(
                      opacity: task.isComplete ? 0.7 : 1.0,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 3),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  task.title,
                                  style: kBodyMainText,
                                ),
                                Text(
                                  task.subtitle,
                                  style: kBodySubText,
                                ),
                              ],
                            ),
                            Spacer(),
                            task.isComplete
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: primaryColor,
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.check,
                                      size: 14.0,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Stack(
//                     children: [
//                       Container(
//                         height: taskCardHeight,
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.only(bottom: 20.0),
//                         padding: EdgeInsets.all(15.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               offset: Offset(0, 3),
//                               blurRadius: 10.0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // PriorityIcon(priorityColor: task.priorityColor),
//                             Text(
//                               task.title,
//                               style: kBodyMainText,
//                             ),
//                             Text(
//                               task.subtitle,
//                               style: kBodySubText,
//                             ),
//                           ],
//                         ),
//                       ),
//                       task.isComplete == true
//                           ? Positioned(
//                               top: 0.0,
//                               right: 14.0,
//                               child: Container(
//                                 // width: 15.0,
//                                 // height: 15.0,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: Colors.white, width: 2.0),
//                                   borderRadius: BorderRadius.circular(50.0),
//                                   color: primaryColor,
//                                 ),
//                                 padding: EdgeInsets.all(3.0),

//                                 // child: Icon(
//                                 //   Icons.check_circle,
//                                 //   color: primaryColor,
//                                 // ),
//                                 child: Icon(
//                                   Icons.check,
//                                   size: 14.0,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                     ],
//                   )
