import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String n) {
    state = User(name: n, age: state.age);
  }
}
