// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Movie`
  String get movie {
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Folder`
  String get folder {
    return Intl.message(
      'Folder',
      name: 'folder',
      desc: '',
      args: [],
    );
  }

  /// `Grant permissions to get video files in your phone`
  String get noPermissionToast {
    return Intl.message(
      'Grant permissions to get video files in your phone',
      name: 'noPermissionToast',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this video?`
  String get confirmDelete {
    return Intl.message(
      'Are you sure you want to delete this video?',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `{params} videos`
  String paramsVideos(Object params) {
    return Intl.message(
      '$params videos',
      name: 'paramsVideos',
      desc: '',
      args: [params],
    );
  }

  /// `Trim`
  String get trim {
    return Intl.message(
      'Trim',
      name: 'trim',
      desc: '',
      args: [],
    );
  }

  /// `Cover`
  String get cover {
    return Intl.message(
      'Cover',
      name: 'cover',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Export cover`
  String get exportCover {
    return Intl.message(
      'Export cover',
      name: 'exportCover',
      desc: '',
      args: [],
    );
  }

  /// `Export video`
  String get exportVideo {
    return Intl.message(
      'Export video',
      name: 'exportVideo',
      desc: '',
      args: [],
    );
  }

  /// `Save to gallery successfully`
  String get saveToGallerySuccess {
    return Intl.message(
      'Save to gallery successfully',
      name: 'saveToGallerySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save to gallery failed`
  String get saveToGalleryFailed {
    return Intl.message(
      'Save to gallery failed',
      name: 'saveToGalleryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `User Agreement`
  String get userAgreement {
    return Intl.message(
      'User Agreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Clear history`
  String get clearHistory {
    return Intl.message(
      'Clear history',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Delete Failed`
  String get deleteFailed {
    return Intl.message(
      'Delete Failed',
      name: 'deleteFailed',
      desc: '',
      args: [],
    );
  }

  /// `To grant permission, please grant manually then restart`
  String get noPermissionGrant {
    return Intl.message(
      'To grant permission, please grant manually then restart',
      name: 'noPermissionGrant',
      desc: '',
      args: [],
    );
  }

  /// `No song found`
  String get noDataAndroid {
    return Intl.message(
      'No song found',
      name: 'noDataAndroid',
      desc: '',
      args: [],
    );
  }

  /// `No song found, please check permission`
  String get noDataIOS {
    return Intl.message(
      'No song found, please check permission',
      name: 'noDataIOS',
      desc: '',
      args: [],
    );
  }

  /// `To authorize`
  String get toAuthorize {
    return Intl.message(
      'To authorize',
      name: 'toAuthorize',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `No recommended`
  String get noRecommended {
    return Intl.message(
      'No recommended',
      name: 'noRecommended',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
