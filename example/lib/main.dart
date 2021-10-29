import 'package:calendar_rangepicker/calendar_rangepicker.dart';
import 'package:example/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildLightTheme(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarRangePicker(
        preferredDateFormat: DateFormat.yMMMEd(),
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        maximumDate: DateTime(2099),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              color: Colors.white,
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // setState(() {
                  //   isDatePopupOpen = true;
                  // });
                  showDemoDialog(context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Choose date',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${DateFormat('dd MMMM ' 'yyyy').format(startDate)} - ${DateFormat('dd MMMM ' 'yyyy').format(endDate)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
