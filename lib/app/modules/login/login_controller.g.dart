// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<User> _$getuserComputed;

  @override
  User get getuser => (_$getuserComputed ??= Computed<User>(() => super.getuser,
          name: '_LoginControllerBase.getuser'))
      .value;

  final _$optionAtom = Atom(name: '_LoginControllerBase.option');

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

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loadAtom = Atom(name: '_LoginControllerBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$authenticateAsyncAction =
      AsyncAction('_LoginControllerBase.authenticate');

  @override
  Future<User> authenticate(String email, String password) {
    return _$authenticateAsyncAction
        .run(() => super.authenticate(email, password));
  }

  final _$registerAsyncAction = AsyncAction('_LoginControllerBase.register');

  @override
  Future<User> register(String name, String email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(name, email, password));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setOption(int option) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setOption');
    try {
      return super.setOption(option);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoad(bool status) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLoad');
    try {
      return super.setLoad(status);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeUser() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.disposeUser');
    try {
      return super.disposeUser();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
option: ${option},
user: ${user},
load: ${load},
getuser: ${getuser}
    ''';
  }
}
