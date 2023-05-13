import 'package:despesas_pessoais/app/shared/sqflite/sqflite_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqflite_ffi.sqfliteFfiInit();
  databaseFactory = sqflite_ffi.databaseFactoryFfi;

  await SqfliteHelper().getDb();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
