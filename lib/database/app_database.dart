import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
  /*
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    // Open database
    return openDatabase(
      path,
      onCreate: (db, version) {
        // Creating table to store data
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');
      },
      /**
       * To delete all database, simply update version to version + 1 > hot RESTART 
       * > back to version > HOT RESTART
       */
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
  */
}
