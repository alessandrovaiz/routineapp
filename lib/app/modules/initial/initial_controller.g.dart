// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InitialController = BindInject(
  (i) => InitialController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialController on _InitialControllerBase, Store {
  final _$optionAtom = Atom(name: '_InitialControllerBase.option');

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

  final _$_InitialControllerBaseActionController =
      ActionController(name: '_InitialControllerBase');

  @override
  void changeOption(int option) {
    final _$actionInfo = _$_InitialControllerBaseActionController.startAction(
        name: '_InitialControllerBase.changeOption');
    try {
      return super.changeOption(option);
    } finally {
      _$_InitialControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
option: ${option}
    ''';
  }
}
