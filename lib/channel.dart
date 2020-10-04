import 'package:dart_mssql/dart_mssql.dart';
import 'package:test_sql/test_sql.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class TestSqlChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        // SqlConnection connection = SqlConnection(host:"103.82.242.174", db:"medcare_web", user:"SQLRoot ", password:"This1sP4ssVVorD1");
        // String cmd = "select top 1 nm_agama from m_agama";
        //
        // SqlResult result = connection.execute(cmd,[4]);
        // result.rows.forEach((e) {
        //   print("${e.email}");
        // });
        // print("end of printing.");
        // connection.close();
        // stdin.readLineSync();

        return Response.ok({"key": "value"});
      });

    return router;
  }
}