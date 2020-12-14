import 'package:flutter/material.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Home', style: kHeadingText.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_high),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 42.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Urgent(),
              SizedBox(height: 30.0),
              Activities(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: null,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class Urgent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urgentActivities = activities
        .where((activity) =>
            (DateTime.now().difference(activity.dueDate) * -1).inDays < 10)
        .toList();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.5),
            child: Text('Urgent', style: kHeadingText),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 155.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: urgentActivities.length,
              itemBuilder: (context, int index) {
                final Activity activity = urgentActivities[index];
                final priorities = {
                  'critical': criticalColor,
                  'important': importantColor,
                  'relaxed': relaxedColor,
                };
                final priorityColor = priorities[activity.priority];

                final incompleteTasks = activity.tasks
                    .where((task) => task.completed == false)
                    .length;
                final completeTask = activity.tasks.length - incompleteTasks;
                final progress = (completeTask / activity.tasks.length) ?? 0;
                return Container(
                  height: 155.0,
                  width: 155.0,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 35.5 : 7.0,
                    right: 7.0,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 5),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 151.0,
                          height: 151.0,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: altColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildPriorityIcon(priorityColor),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.title,
                                    style: kBodyMainText,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text('$incompleteTasks tasks left',
                                      style: kBodySubText),
                                ],
                              ),
                              LayoutBuilder(
                                builder: (context, BoxConstraints constraints) {
                                  final progressWidth = constraints.maxWidth;
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 10.0,
                                        width: progressWidth * progress,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        height: 10.0,
                                        width: progressWidth,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white.withOpacity(0.75),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildDueIndicator(
                        dueDate: activity.dueDate,
                        priorityColor: priorityColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDueIndicator({dueDate, priorityColor}) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: priorityColor,
        ),
        child: Row(
          children: [
            Icon(
              Icons.alarm,
              size: 15.0,
              color: Colors.white,
            ),
            SizedBox(width: 5.0),
            Text(
              dueValue(dueDate),
              style: kBodySubText.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPriorityIcon(priorityColor) {
  return Row(
    children: [
      Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: priorityColor,
        ),
      ),
      SizedBox(width: 5.0),
      Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: priorityColor,
        ),
      ),
      SizedBox(width: 5.0),
      Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: priorityColor,
        ),
      ),
    ],
  );
}

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Activities', style: kHeadingText),
          SizedBox(height: 5.0),
          Container(
            height: 300.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: activities.length,
              itemBuilder: (context, int index) {
                final Activity activity = activities[index];
                final priorities = {
                  'critical': criticalColor,
                  'important': importantColor,
                  'relaxed': relaxedColor,
                };
                final priorityColor = priorities[activity.priority];

                final incompleteTasks = activity.tasks
                    .where((task) => task.completed == false)
                    .length;
                final completeTask = activity.tasks.length - incompleteTasks;
                final progress = (completeTask / activity.tasks.length) ?? 0;
                return Container(
                  height: 90.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: altColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPriorityIcon(priorityColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            activity.title,
                            style: kBodyMainText,
                          ),
                          Text(
                            '${(progress * 100).floor()}%',
                            style: kBodyMainText,
                          ),
                        ],
                      ),
                      LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                          final progressWidth = constraints.maxWidth;
                          return Stack(
                            children: [
                              Container(
                                height: 10.0,
                                width: progressWidth * progress,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 10.0,
                                width: progressWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
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
