// import 'dart:io';
// //import 'package:dlicense_codemagic/src/models/employee_model.dart';
// import 'package:path/path.dart';
// import 'package:dlicence/src/models/masterdata.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DBProvider {
//   static Database _database;
//   static final DBProvider db = DBProvider._();

//   DBProvider._();

//   Future<Database> get database async {
//     // If database exists, return database
//     if (_database != null) return _database;

//     // If database don't exists, create one
//     _database = await initDB();

//     return _database;
//   }

//   // Create the database and the Employee table
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'dlicencedatabse_manager.db');

//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE Statedatatable('
//           'id INTEGER PRIMARY KEY,'
//           'countryId INTEGER NOT NULL,'
//           'stateName TEXT'
//           ')');
//        await db.execute('CREATE TABLE Airlinedatatable('
//           'id INTEGER PRIMARY KEY,'
//           'airlineName TEXT'
//           ')');
//             await db.execute('CREATE TABLE Country('
//           'countryCode TEXT,'
//           'countryName TEXT,'
//           'countryPhone INTEGER NOT NULL,'
//           'id INTEGER PRIMARY KEY'
//           ')');
//             await db.execute('CREATE TABLE Doctor('
//           'id INTEGER PRIMARY KEY,'
//           'doctorName TEXT'
//           ')');
//           await db.execute('CREATE TABLE Institution('
//           'id INTEGER PRIMARY KEY,'
//           'institutionName TEXT'
//           ')');
//             await db.execute('CREATE TABLE Language('
//           'id INTEGER PRIMARY KEY,'
//           'language TEXT'
//           ')');
//             await db.execute('CREATE TABLE Class('
//           'id INTEGER PRIMARY KEY,'
//           'className TEXT'
//           ')');
//             await db.execute('CREATE TABLE Code('
//           'id INTEGER PRIMARY KEY,'
//           'code TEXT'
//           ')');
//             await db.execute('CREATE TABLE Titleclass('
//           'id INTEGER PRIMARY KEY,'
//           'title TEXT'
//           ')');
//             await db.execute('CREATE TABLE Type('
//           'id INTEGER PRIMARY KEY,'
//           'typeName TEXT'
//           ')');
//             await db.execute('CREATE TABLE Limitation('
//           'id INTEGER PRIMARY KEY,'
//           'limitation TEXT,'
//           'medicalTypeId INTEGER NOT NULL'
//           ')');
//             await db.execute('CREATE TABLE Ministry('
//           'id INTEGER PRIMARY KEY,'
//           'ministryName TEXT'
//           ')');
//           await db.execute('CREATE TABLE Niveaulevel('
//           'id INTEGER PRIMARY KEY,'
//           'level TEXT'
//           ')');
//             await db.execute('CREATE TABLE School('
//           'id INTEGER PRIMARY KEY,'
//           'schoolName TEXT'
//           ')');

//     });
//   }
// int countryId;
//     int id;
//     String stateName;
//   // Insert employee on database
//   createstatedb(Stateclass newstatedata) async {
//     await deleteAllEmployees();
//     final db = await database;
//     final res = await db.insert('Statedatatable', newstatedata.toJson());
// return res;
//   }
//    airlinestatedb(Airline newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Airlinedatatable', newstatedata.toJson());
//     return res;}
//       countryNamedb(Country newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Country', newstatedata.toJson());
//     return res;}
//        doctorNamedb(Doctor newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Doctor', newstatedata.toJson());
//     return res;} 
//       institutionNamedb(Institution newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Institution', newstatedata.toJson());
//     return res;}
//        languagedb(Language newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Language', newstatedata.toJson());
//     return res;}
//        classNamedb(Class newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Class', newstatedata.toJson());
//     return res;}
//        codedb(Code newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Code', newstatedata.toJson());
//     return res;}
//        titledb(Titleclass newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Titleclass', newstatedata.toJson());
//     return res;}
//        typeNamedb(Type newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Type', newstatedata.toJson());
//     return res;}
//        limitationdb(Limitation newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Limitation', newstatedata.toJson());
//     return res;}
//     //    limitationsMedicaldb(Medicaltype newstatedata) async {
//     //  final db = await database;
//     // final res = await db.insert('Medicaltype', newstatedata.toJson());
//     // return res;}
//        ministryNamedb(Ministry newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Ministry', newstatedata.toJson());
//     return res;}
    
//        niveauleveldb(Niveaulevel newstatedata) async {
//      final db = await database;
//     final res = await db.insert('Niveaulevel', newstatedata.toJson());
//     return res;}
//       schoolNamedb(School newstatedata) async {
//      final db = await database;
//     final res = await db.insert('School', newstatedata.toJson());
//     return res;}

//   // Delete all employees
//   Future<int> deleteAllEmployees() async {
//     final db = await database;
//     final resa = await db.rawDelete('DELETE FROM Statedatatable');
//     final resaa = await db.rawDelete('DELETE FROM Airlinedatatable');
//    final resas = await db.rawDelete('DELETE FROM Country');
//    final resaf = await db.rawDelete('DELETE FROM Doctor');
//    final resaq = await db.rawDelete('DELETE FROM Institution');
//    final resar = await db.rawDelete('DELETE FROM Language');
//    final resaw = await db.rawDelete('DELETE FROM Class');
//    final resay = await db.rawDelete('DELETE FROM Code');
//    final resaay= await db.rawDelete('DELETE FROM Titleclass');
//    final resap = await db.rawDelete('DELETE FROM Type');
//    final resai = await db.rawDelete('DELETE FROM Limitation');
//    final resau = await db.rawDelete('DELETE FROM Ministry');
//    final resafgh = await db.rawDelete('DELETE FROM Niveaulevel');
//     final res = await db.rawDelete('DELETE FROM School');
   
//     return res;
//   }
 

//   Future<List<Stateclass>> getAlldata() async {
//     final db = await database;
//      airlinedatalist = await db.rawQuery("SELECT * FROM AIRLINEDATATABLE");
//  print(airlinedatalist);
//  if(airlinedatalist.length>0){hasdata=1;}else{hasdata=0;}
//  airlinedatalist=airlinedatalist;
//  countriesdatalist = await db.rawQuery("SELECT * FROM COUNTRY");
//  print(countriesdatalist);
//      doctordatalist = await db.rawQuery("SELECT * FROM DOCTOR");
//  print(doctordatalist);
//   institutiondatalist = await db.rawQuery("SELECT * FROM INSTITUTION");
//  print(institutiondatalist);
//  languagedatalist = await db.rawQuery("SELECT * FROM LANGUAGE");
//  print(languagedatalist);
//  licenseclassdatalist = await db.rawQuery("SELECT * FROM CLASS");
//  print(licenseclassdatalist);
//  licensecodesdatalist = await db.rawQuery("SELECT * FROM CODE");
//  print(licensecodesdatalist);
//   licensetypedatalist = await db.rawQuery("SELECT * FROM TYPE");
//  print(licensetypedatalist);
//  licensetitlesdatalist = await db.rawQuery("SELECT * FROM TITLECLASS");
//  print(licensetitlesdatalist);
//   limitationdatalist = await db.rawQuery("SELECT * FROM LIMITATION");
//  print(limitationdatalist);
//   ministrydatalist = await db.rawQuery("SELECT * FROM MINISTRY");
//  print(ministrydatalist);
// niveauleveldatalist = await db.rawQuery("SELECT * FROM NIVEAULEVEL");
//  print(niveauleveldatalist);
//   schooldatalist = await db.rawQuery("SELECT * FROM SCHOOL");
//  print(schooldatalist);
//   statedatalist = await db.rawQuery("SELECT * FROM STATEDATATABLE");
//   print(statedatalist);
 
//  print(hasdata);
//     List<Stateclass> list =
//         statedatalist.isNotEmpty ? statedatalist.map((c) => Stateclass.fromJson(c)).toList() : [];
//     return list;
  
  
//   }
// }
