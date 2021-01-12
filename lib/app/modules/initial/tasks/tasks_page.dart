import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:routineapp/app/shared/models/user.dart';
import 'package:routineapp/app/widgets/utils/colors.dart';

class Tasks {
  Tasks({this.isExpanded: false, this.header, this.body});
  bool isExpanded;
  final String header;
  final String body;
}

class TasksPage extends StatefulWidget {
  final User user;
  final int option;

  const TasksPage({@required this.user, this.option});
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<TasksPage> {
  List<Tasks> _tasks = <Tasks>[
    Tasks(header: 'Segunda-feira', body: "Hello world"),
    Tasks(header: 'Terça-Feira', body: "Hello world"),
    Tasks(header: 'Quarta-Feira', body: "Hello world")
  ];

  AppColors colors = new AppColors();

  @override
  Widget build(BuildContext context) {
    if (widget.option == 0) {
      return _buildSeeAllTasks();
    } else if (widget.option == 1) {
      return _buildSeeTasksToday();
    }
  }

  _buildSeeAllTasks() {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _tasks[index].isExpanded = !_tasks[index].isExpanded;
                    print(_tasks[index].isExpanded);
                  });
                },
                children: _tasks.map((Tasks task) {
                  return ExpansionPanel(
                      isExpanded: task.isExpanded,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Text(task.header);
                      },
                      body: Container(
                        child: Text(task.body),
                      ));
                }).toList(),
              ),
            ],
          )),
    );
  }

  _buildSeeTasksToday() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        child: Text("Oi2"),
      ),
    );
  }
}
