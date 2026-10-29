import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/storage/local_storage.dart';
import '../../../../../../core/widgets/language_selector.dart';

part 'local_language_event.dart';
part 'local_language_state.dart';

class LocalLanguageBloc extends Bloc<LocalLanguageEvent, LocalLanguageState> {
  LocalLanguageBloc() : super(LocalLanguageInitial()) {
    on<LoadCurrentLanguageEvent>(_onLoad);
    on<ChangeLanguageEvent>(_onChange);
  }

  void _onLoad(
    LoadCurrentLanguageEvent event,
    Emitter<LocalLanguageState> emit,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final localStorage = LocalStorageImpl(sharedPreferences: pref);

    final languageType = await localStorage.getLanguageType();

    final locale = Locale(
      languageType,
      languageType == LanguageType.my.name
          ? LanguageValue.MM.name
          : LanguageValue.US.name,
    );

    emit(LanguageLoaded(locale));
  }

  void _onChange(
    ChangeLanguageEvent event,
    Emitter<LocalLanguageState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final localStorage = LocalStorageImpl(sharedPreferences: prefs);
    await localStorage.saveLanguageType(event.locale.languageCode);
    emit(LanguageLoaded(event.locale));
  }
}
