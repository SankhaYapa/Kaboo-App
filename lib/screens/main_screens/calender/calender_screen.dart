import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/model/calender_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late Map<DateTime, List<Event>> selectedEvents;

  TextEditingController _eventController = TextEditingController();
  DateTime selectdate = DateTime.now();
  DateTime focusdate = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    // TODO: implement initState
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              eventLoader: _getEventsfromDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectdate = selectedDay;
                  focusdate = focusedDay;
                  print(selectedDay.day);
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectdate, date);
              },
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusdate,
              calendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            ..._getEventsfromDay(selectdate).map((Event event) => ListTile(
                  title: Text(event.title),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Add Event"),
                content: TextFormField(
                  controller: _eventController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      return;
                    },
                    child: Text("Cencle"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_eventController.text.isEmpty) {
                      } else {
                        if (selectedEvents[selectdate] != null) {
                          selectedEvents[selectdate]
                              ?.add(Event(title: _eventController.text));
                        } else {
                          selectedEvents[selectdate] = [
                            Event(title: _eventController.text)
                          ];
                        }
                      }
                      Navigator.pop(context);
                      _eventController.clear();
                      setState(() {});
                      return;
                    },
                    child: Text("Ok"),
                  ),
                ],
              ),
            );
          },
          label: Text("Add Event")),
    );
  }
}
