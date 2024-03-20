import 'package:flutter_templete/core/data/network/network_config.dart';

class HomeEndpoints {
  static String getallMedicine = NetworkConfig.getFullApiRouteTow('/medicin');
  static String getallActivity = NetworkConfig.getFullApiRouteTow('/activity');
}
