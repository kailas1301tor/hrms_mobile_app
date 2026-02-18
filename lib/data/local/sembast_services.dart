import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import 'local_base_services.dart';

import '../../src/login/model/login_response.dart';

/// Synchronous provider so callers use [ref.read(sembastServicesProvider)] without .future.
final sembastServicesProvider = Provider<SembastServices>((ref) => SembastServices());

class SembastServices extends LocalBaseServices {
  String dbPath = 'sample_app.db';
  final _tokenStore = StoreRef<String, Map<String, dynamic>>('auth_tokens');
  final _userStatus = StoreRef<String, String>('user_status');
  final _userStore = StoreRef<String, Map<String, dynamic>>('user_data');
  Database? _db;

  Database get db {
    final d = _db;
    if (d == null) {
      throw StateError(
        'SembastServices not initialized. Call initialize() first.',
      );
    }
    return d;
  }

  @override
  Future<void> deleteUserData() async {
    try {
      if (_db != null) {
        await _userStatus.delete(_db!);
        await _userStore.delete(_db!);
      }
    } catch (e) {
      debugPrint('deleteUserData error: $e');
    }
  }

  @override
  Future<void> getUserData() async {}

  @override
  Future<void> initialize() async {
    final appDir = await getApplicationDocumentsDirectory();
    _db = await databaseFactoryIo.openDatabase('${appDir.path}/$dbPath');
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
      final d = _db;
      if (d == null) return false;
      await _userStatus.delete(d);
      await _tokenStore.delete(d);
      await _userStore.delete(d);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveLoginResponse(LoginResponse response) async {
    try {
      await _userStore.record('user_data').put(db, response.toJson());
    } catch (e) {
      debugPrint('saveLoginResponse error: $e');
    }
  }

  @override
  Future<LoginResponse?> getLoginResponse() async {
    try {
      final json = await _userStore.record('user_data').get(db);
      if (json != null) {
        return LoginResponse.fromJson(json);
      }
      return null;
    } catch (e) {
      debugPrint('getLoginResponse error: $e');
      return null;
    }
  }
}
