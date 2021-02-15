import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
//tao ham cho phep nhap du lieu vao co so du lieu
  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath(); //get duong dan noi luu tru CSDL ma chung ta tao ra
    return sql.openDatabase(
      path.join(dbPath, 'place.db'),
      // mở CSDL trong đường dẫn path lấy ở trên va co ten la place.db
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1, // tao tep neu khong tim thay tep place.db
    );
  }
  static Future<void> insert(String table, Map<String, Object> data) async {
    //doi so thu hai la du lieu ta muon ghi vao bang va do phai la Map
    final db = await DBHelper.database(); //truy cap vao CSDL
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    ); //neu co gang chen du lieu cho mot CSDL co san thi se ghi de(replace)
  }
  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db = await DBHelper.database(); //truy cap vao CSDL
    return db.query(table);
  }
}
