import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../services/database_service.dart';

class DBHelper {
  static Database? _db;

  static _getInstance() async {
    _db = await DatabaseService.instance.database;
  }

  static FutureOr<int> insert({
    required String sql,
    List<dynamic>? arguments,
    Transaction? transaction,
    Batch? batch,
    bool showLog = false,
  }) async {
    try {
      if (_normalizeSQL(sql, arguments)) {
        return 0;
      }

      if (batch != null) {
        batch.rawInsert(sql, arguments);

        return 0;
      }

      int insertedId;
      if (transaction != null) {
        insertedId = await transaction.rawInsert(sql, arguments);
      } else {
        await _getInstance();

        insertedId = await _db!.rawInsert(sql, arguments);
      }

      if (showLog) {
        debugPrint('Inserted ID: $insertedId');
      }

      return insertedId;
    } catch (err) {
      rethrow;
    }
  }

  static Future<int> delete({
    required String sql,
    List<dynamic>? arguments,
    Transaction? transaction,
    bool showLog = false,
  }) async {
    try {
      if (_normalizeSQL(sql, arguments)) {
        return 0;
      }

      int rows;
      if (transaction != null) {
        rows = await transaction.rawDelete(sql, arguments);
      } else {
        await _getInstance();

        rows = await _db!.rawDelete(sql, arguments);
      }

      if (showLog) {
        debugPrint('Deleted rows: $rows');
      }

      return rows;
    } catch (err) {
      rethrow;
    }
  }

  static Future<int> update({
    required String sql,
    List<dynamic>? arguments,
    Transaction? transaction,
    bool ignoreReport = false,
    bool showLog = false,
  }) async {
    try {
      if (_normalizeSQL(sql, arguments)) {
        return 0;
      }

      int rows;
      if (transaction != null) {
        rows = await transaction.rawUpdate(sql, arguments);
      } else {
        await _getInstance();

        rows = await _db!.rawUpdate(sql, arguments);
      }

      if (showLog) {
        debugPrint('Updated rows: $rows');
      }

      return rows;
    } catch (err) {
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> select({
    required String sql,
    List<dynamic>? arguments,
    Transaction? transaction,
  }) async {
    try {
      if (transaction != null) {
        return await transaction.rawQuery(sql, arguments);
      } else {
        await _getInstance();

        return await _db!.rawQuery(sql, arguments);
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future<int> count({
    required String sql,
    List<dynamic>? arguments,
    Transaction? transaction,
  }) async {
    try {
      if (transaction != null) {
        return Sqflite.firstIntValue(
              await transaction.rawQuery(sql, arguments),
            ) ??
            0;
      } else {
        await _getInstance();

        return Sqflite.firstIntValue(await _db!.rawQuery(sql, arguments)) ?? 0;
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future<T> executeTransaction<T>(
    Future<T> Function(Transaction) transaction,
  ) async {
    try {
      await _getInstance();

      return await _db!.transaction<T>(<T>(txn) => transaction(txn));
    } catch (err) {
      rethrow;
    }
  }

  //Verifica se a quantidade de `Query Params` passado na SQL condiz com o número de argumentos informados
  static bool _normalizeSQL(String sql, List<dynamic>? arguments) {
    if (!kDebugMode || arguments == null) {
      return false;
    }

    final regex = RegExp(r"(\?+)");
    Iterable<RegExpMatch> matches = regex.allMatches(sql);

    bool hasDifference = matches.length != arguments.length;

    if (hasDifference) {
      debugPrint('\n-----Parâmetros inconsistentes-----\n\n$sql');
    }

    return hasDifference;
  }

  static Future<Batch> getBatch() async {
    await _getInstance();

    return _db!.batch();
  }
}
