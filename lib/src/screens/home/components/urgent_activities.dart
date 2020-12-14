import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';
import 'package:task_app/src/screens/activity_details/activity_details_screen.dart';
import 'package:task_app/src/screens/home/components/components.dart';

class Urgent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urgentActivities = activities
        .where((activity) =>
            ((DateTime.now().difference(activity.dueDate) * -1).inDays < 10) &&
            activity.incompleteTasks.length > 0)
        .toList();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(title: 'Urgent'),
          Container(
            height: 160.0,
            // alignment: Alignment.bottomLeft,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: urgentActivities.length,
              itemBuilder: (BuildContext context, int index) {
                final Activity activity = urgentActivities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ActivityDetails(activity),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.only(
                            right: 7.5, left: index == 0 ? 35.0 : 7.5),
                        width: 151.0,
                        height: 151.0,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PriorityIcon(priorityColor: activity.priorityColor),
                            Spacer(),
                            Text(
                              activity.title,
                              style: kBodyMainText,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${activity.incompleteTasks.length} task${activity.incompleteTasks.length > 1 ? 's' : ''} left',
                              style: kBodySubText,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            ProgressBar(
                              progress: activity.progress,
                              progressBarColor: primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: DueIndicator(
                          dueDate: activity.dueDate,
                          priorityColor: activity.priorityColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
