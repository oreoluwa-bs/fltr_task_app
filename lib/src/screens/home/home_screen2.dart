import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/screens/add_activity/add_activity.dart';
import 'package:task_app/src/screens/home/components/components.dart';
import 'package:task_app/src/globals/globals.dart';

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
        actions: [DarkModeIconButton()],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: BodyContainer(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Urgent(),
              RecentActivities(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddActivityScreen()),
        ),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
