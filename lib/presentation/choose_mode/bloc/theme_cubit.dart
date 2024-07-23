// import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// class ThemeCubit extends HydratedCubit<ThemeMode> {
//   ThemeCubit():super(ThemeMode.system);

//   void updateTheme(ThemeMode themeMode) => emit(themeMode);

//   @override
//   ThemeMode? fromJson(Map<String, dynamic> json) {
//     // TODO: implement fromJson
//     throw UnimplementedError();
//   }

//   @override
//   Map<String, dynamic>? toJson(ThemeMode state) {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
// }

// 


import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeModeString = json['themeMode'] as String;
    return ThemeMode.values.firstWhere((mode) => mode.toString() == themeModeString, orElse: () => ThemeMode.system);
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'themeMode': state.toString()};
  }
}
