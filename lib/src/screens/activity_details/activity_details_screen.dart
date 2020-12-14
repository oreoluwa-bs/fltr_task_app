import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';
import 'package:task_app/src/screens/activity_details/components/acitivity_tasks.dart';
import 'package:task_app/src/screens/add_activity/edit_activity.dart';
import 'package:task_app/src/screens/home/components/components.dart';

class ActivityDetails extends StatelessWidget {
  final Activity activity;

  ActivityDetails(this.activity);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: BackIconButton(),
        title: Text(activity.title,
            style: kHeadingText.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditActivityScreen(activity: activity),
                ),
              );
            },
          ),
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: BodyContainer(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 35.0, right: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriorityIcon(priorityColor: activity.priorityColor),
                    SectionHeading(
                      padding: const EdgeInsets.only(left: 0),
                      title: 'Description',
                      actions: [
                        dueValue(activity.dueDate) == 'Expired'
                            ? DueIndicator(
                                priorityColor: criticalColor,
                                dueDate: activity.dueDate,
                              )
                            : Text('Due in ${dueValue(activity.dueDate)}'),
                      ],
                    ),
                    Text(
                      activity.description,
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              ActivityTasks(
                activity: activity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
