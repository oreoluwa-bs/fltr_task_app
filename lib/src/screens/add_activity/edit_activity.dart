import 'package:flutter/material.dart';
import 'package:task_app/src/components/components.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/models/activity.dart';
import 'package:task_app/src/models/priority.dart';

class EditActivityScreen extends StatefulWidget {
  final Activity activity;

  const EditActivityScreen({Key key, @required this.activity})
      : super(key: key);

  @override
  _EditActivityScreenState createState() => _EditActivityScreenState();
}

class _EditActivityScreenState extends State<EditActivityScreen> {
  DateTime selectedDate;
  String selectedPriority;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      // initialEntryMode: DatePickerEntryMode.input,
      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData.light(),
      //     child: child,
      //   );
      // },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDate = widget.activity.dueDate ?? DateTime.now();
      selectedPriority = widget.activity.priority;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: BackIconButton(),
        title: Text('Edit Activity',
            style: kHeadingText.copyWith(color: Colors.white)),
        actions: [DarkModeIconButton()],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: BodyContainer(
        child: Container(
          // padding: EdgeInsets.all(20.0),
          child: Form(
              child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SectionHeading(title: 'Details'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    TextFormField(
                      // autofocus: true,
                      initialValue: widget.activity.title,
                      decoration: kTaskFormInputDecoration.copyWith(
                          hintText: 'New Activity...'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      initialValue: widget.activity.description,
                      decoration: kTaskFormInputDecoration.copyWith(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Description'),
                    ),
                  ],
                ),
              ),
              SectionHeading(title: 'Deadline & Priority'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlatButton(
                      child: Row(
                        children: [
                          Text(
                            '${getMonth(selectedDate.month)} ${selectedDate.day}, ${selectedDate.year}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(height: 15.0),
                    LayoutBuilder(
                      builder: (context, size) {
                        final width = size.maxWidth;
                        final containerWidth = (width / 3) - 10;
                        return Container(
                          height: 62.0,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: priorities.length,
                            itemBuilder: (context, int index) {
                              final priority = [];
                              priorities.forEach((key, value) {
                                priority.add(value);
                              });
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPriority = priority[index]['value'];
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(right: 15.0),
                                      height: 60.0,
                                      width: containerWidth,
                                      decoration: BoxDecoration(
                                        color: priority[index]['color'],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          priority[index]['label'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    selectedPriority == priority[index]['value']
                                        ? Positioned(
                                            top: -2.0,
                                            right: 14.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: primaryColor,
                                              ),
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.check,
                                                size: 14.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.0),
                    MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Save Changes',
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
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
