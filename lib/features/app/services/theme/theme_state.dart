import 'package:flutter/material.dart' show ThemeMode, ThemeData;

class ThemeState {
  final ThemeMode mode;
  final ThemeData light;
  final ThemeData dark;

  const ThemeState({this.mode = ThemeMode.dark, required this.light, required this.dark});

  ThemeState copyWith({ThemeMode? mode, ThemeData? light, ThemeData? dark}) {
    return ThemeState(
      mode: mode ?? this.mode,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }
}