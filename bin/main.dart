import 'package:test_sql/test_sql.dart';

Future main() async {
  final app = Application<TestSqlChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}