import 'package:doit/Test/NewRep.dart';
import 'package:doit/Test/TODO/Data.dart';
import 'package:doit/Test/TODO/TaskContiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TheTodo extends StatefulWidget {
  const TheTodo({super.key});

  @override
  State<TheTodo> createState() => _TheTodoState();
}

class _TheTodoState extends State<TheTodo> {
  // final _timeContrall = TextEditingController();
  // final _taskContrall = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _selectedIndex == 0 ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            TaskDiolg(context);
          },
          backgroundColor: Color.fromARGB(255, 83, 161, 224),
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 246, 240, 240),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.abc_sharp),
          onPressed: () {
            GetAPiLink().getHttp();
          },
        ),
        backgroundColor: Color.fromARGB(255, 83, 161, 224),
        title: Text(
          "To Do",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < DataList.length; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                        });
                      },
                      child: Container(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
                        //  margin: EdgeInsets.only(left: 10),
                        height: 30,
                        width: 75,
                        decoration: BoxDecoration(
                          color: _selectedIndex == i
                              ? Color.fromARGB(255, 83, 161, 224)
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                          child: Text(
                            DataList[i].taskType,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  // SizedBox(
                  //   width: 12,
                  // ),
                  // Container(
                  //   height: 30,
                  //   width: 75,
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(255, 247, 250, 253),
                  //     borderRadius: BorderRadius.all(Radius.circular(12)),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "To DO",
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              for (int i = 0; i < DataList[_selectedIndex].data.length; i++)
                Slidable(
                  endActionPane: ActionPane(motion: ScrollMotion(), children: [
                    SlidableAction(
                        onPressed: (context) {
                          TaskDiolg(context, index: i);
                        },
                        backgroundColor: Color.fromARGB(255, 103, 100, 163),
                        foregroundColor: Colors.white,
                        icon: Icons.update,
                        label: 'Update',
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(18))),
                  ]),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    //  dismissible: DismissiblePane(onDismissed: () {}),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              DataList[0].data.removeAt(i);
                            });
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(18))),
                    ],
                  ),
                  child: TaskContianer(
                    Task: DataList[_selectedIndex].data[i].task,
                    Time: DataList[_selectedIndex].data[i].time,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> TaskDiolg(BuildContext context, {int? index}) {
    var _timeContrall = TextEditingController();
    var _taskContrall = TextEditingController();
    var _formKey = GlobalKey<FormState>();

    if (index != null) {
      _taskContrall.text = DataList[0].data[index].task;
      _timeContrall.text = DataList[0].data[index].time;
    }
    return showDialog(
      context: context,
      builder: (context) {
        //   modelBotem sheet
        return AlertDialog(
          title: Text(' ${index == null ? 'Add new' : 'update'} Task '),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _taskContrall,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "task must not be empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "Task"),
                ),
                InkWell(
                  onTap: () async {
                    var selectedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (selectedTime != null) {
                      _timeContrall.text = selectedTime.format(context);
                    }
                  },
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " time must not be empty";
                      }
                    },
                    controller: _timeContrall,
                    enabled: false,
                    decoration: InputDecoration(hintText: "thetime"),
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (index != null) {
                      setState(() {
                        DataList[0].data[index].task = _taskContrall.text;
                        DataList[0].data[index].time = _timeContrall.text;
                      });
                    } else {
                      setState(() {
                        DataList[0].data.add(
                              Task(
                                  task: _taskContrall.text,
                                  time: _timeContrall.text),
                            );
                      });
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text('${index == null ? 'svee ' : 'update'}')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancle"))
          ],
        );
      },
    );
  }
}
