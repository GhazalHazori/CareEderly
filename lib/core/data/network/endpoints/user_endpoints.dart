// import 'package:flutter_templete/core/data/network/network_config.dart';

import 'package:flutter_templete/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiRoute('/login');
  static String register = NetworkConfig.getFullApiRoute('/register');
  static String verify = NetworkConfig.getFullApiRoute('/verification');
  static String add = NetworkConfig.getFullApiRouteTow('/medicin');
  static String update = NetworkConfig.getFullApiRouteTow('/medicin/');
  static String delet = NetworkConfig.getFullApiRouteTow('/medicin/');
}
