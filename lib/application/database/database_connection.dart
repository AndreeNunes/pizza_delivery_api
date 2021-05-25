import 'package:injectable/injectable.dart';
import 'package:mysql1/src/single_connection.dart';
import 'package:pizza_delivery/application/config/database_connection_configuration.dart';

import './i_database_connection.dart';

@Injectable(as: IDatabaseConnection)
class DatabaseConnection implements IDatabaseConnection {
  final DatabaseConnectionConfiguration _configuration;

  DatabaseConnection(this._configuration);

  @override
  Future<MySqlConnection> openConnection() {
    print(_configuration.host);
    print(int.parse(_configuration.port));
    print(_configuration.user);
    print(_configuration.password);
    print(_configuration.databaseName);
    return MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'new_passowrd',
      db: 'pizza_delivery',
    ));
  }
}
