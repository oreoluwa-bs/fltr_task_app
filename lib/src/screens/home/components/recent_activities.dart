import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';
import 'package:task_app/src/screens/activity_details/activity_details_screen.dart';

class RecentActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double activityCardHeight = 90.0;
    final double activityCardMargin = 10.0;
    // Containter height(90) + box shadow height(10)
    final double listHeight =
        (((activityCardHeight + 10.0) * activities.length) +
            (activityCardMargin * 2 * activities.length));
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(title: 'Activities'),
          Container(
            height: listHeight,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: activities.length > 10 ? 10 : activities.length,
              itemBuilder: (context, int index) {
                final Activity activity = activities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ActivityDetails(activity),
                      ),
                    );
                  },
                  child: Container(
                    height: activityCardHeight,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriorityIcon(priorityColor: activity.priorityColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              activity.title,
                              style: kBodyMainText,
                            ),
                            Text(
                              '${(activity.progress * 100).floor()}%',
                              style: kBodyMainText,
                            ),
                          ],
                        ),
                        ProgressBar(
                          progress: activity.progress,
                          progressBarColor: primaryColor,
                        ),
                      ],
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
