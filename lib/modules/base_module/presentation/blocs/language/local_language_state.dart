part of 'local_language_bloc.dart';

abstract class LocalLanguageState {}

class LocalLanguageInitial extends LocalLanguageState {}

class LanguageLoaded extends LocalLanguageState {
  final Locale locale;
  LanguageLoaded(this.locale);
}
