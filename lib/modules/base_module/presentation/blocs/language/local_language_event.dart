part of 'local_language_bloc.dart';

abstract class LocalLanguageEvent {}

class LoadCurrentLanguageEvent extends LocalLanguageEvent {
  LoadCurrentLanguageEvent();
}

class ChangeLanguageEvent extends LocalLanguageEvent {
  final Locale locale;
  ChangeLanguageEvent(this.locale);
}
