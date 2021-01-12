import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'tasks_controller.g.dart';

@Injectable()
class TasksController = _TasksControllerBase with _$TasksController;

abstract class _TasksControllerBase with Store {
  @observable
  int option = 0;

  @action
  void changeOption(int option) {
    this.option = option;
  }
}
