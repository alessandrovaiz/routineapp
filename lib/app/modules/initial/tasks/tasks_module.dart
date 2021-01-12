import 'package:flutter_modular/flutter_modular.dart';

import 'tasks_page.dart';

class TasksModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => TasksPage(
                  user: args.data,
                  option: args.data,
                )),
      ];

  static Inject get to => Inject<TasksModule>.of();
}
