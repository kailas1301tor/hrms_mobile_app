import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

import 'local_base_services.dart';

part 'sembast_services.g.dart';

@Riverpod(keepAlive: true)
Future<SembastServices> sembastServices(Ref ref) async {
  return SembastServices();
}

class SembastServices extends LocalBaseServices {
  String dbPath = 'sample_app.db';
  final _tokenStore = StoreRef<String, Map<String, dynamic>>('auth_tokens');
  final _userStatus = StoreRef<String, String>('user_status');
  final _onboardedStatus = StoreRef<String, bool>('onboarded_status');
  final _reminderStore = StoreRef<String, String>('reminder_shown');
  late Database db;

  @override
  Future<void> deleteUserData() async {}

  @override
  Future<void> getUserData() async {}

  @override
  Future<void> initialize() async {
    final appDir = await getApplicationDocumentsDirectory();
    db = await databaseFactoryIo.openDatabase('${appDir.path}/$dbPath');
  }

  @override
  Future<void> insertUserData() async {}

  @override
  Future<void> saveTokens({String? accessToken, String? refreshToken}) async {
    try {
      await _tokenStore.record('tokens').put(db, {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> saveUser({bool? isNewUser}) async {
    try {
      await _userStatus.record('isNewUser').put(db, isNewUser.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<bool> isNewUser() async {
    final status = await _userStatus.record('isNewUser').get(db);
    return status == 'true';
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      final token = await _tokenStore.record('tokens').get(db);
      return token?['accessToken'];
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      final token = await _tokenStore.record('tokens').get(db);
      return token?['refreshToken'];
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> clearSembastDb() async {
    try {
      await _userStatus.delete(db);
      await _tokenStore.delete(db);
      await _reminderStore.delete(db);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> updateOnboardedStatus(bool value) async {
    try {
      await _onboardedStatus.record('onboarded_status').put(db, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<bool> getOnboardedStatus() async {
    try {
      final onboardedStatus = await _onboardedStatus
          .record('onboarded_status')
          .get(db);
      return onboardedStatus ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setLastReminderShown(String mealLabel, DateTime time) async {
    try {
      await _reminderStore.record(mealLabel).put(db, time.toIso8601String());
    } catch (e) {
      debugPrint('setLastReminderShown error: $e');
    }
  }

  @override
  Future<DateTime?> getLastReminderShown(String mealLabel) async {
    try {
      final iso = await _reminderStore.record(mealLabel).get(db);
      if (iso == null) return null;
      return DateTime.tryParse(iso);
    } catch (e) {
      debugPrint('getLastReminderShown error: $e');
      return null;
    }
  }
}
