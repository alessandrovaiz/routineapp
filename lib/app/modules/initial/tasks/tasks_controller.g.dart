// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TasksController = BindInject(
  (i) => TasksController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksController on _TasksControllerBase, Store {
  final _$optionAtom = Atom(name: '_TasksControllerBase.option');

  @override
  int get option {
    _$optionAtom.reportRead();
    return super.option;
  }

  @override
  set option(int value) {
    _$optionAtom.reportWrite(value, super.option, () {
      super.option = value;
    });
  }

  final _$_TasksControllerBaseActionController =
      ActionController(name: '_TasksControllerBase');

  @override
  void changeOption(int option) {
    final _$actionInfo = _$_TasksControllerBaseActionController.startAction(
        name: '_TasksControllerBase.changeOption');
    try {
      return super.changeOption(option);
    } finally {
      _$_TasksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
option: ${option}
    ''';
  }
}
