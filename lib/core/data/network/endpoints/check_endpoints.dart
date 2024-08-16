import 'package:flutter_templete/core/data/network/network_config.dart';

class CheckEndpoints {
  static String addDia =
      NetworkConfig.getFullApiRouteTow('/dailyHealth/addDiabetesValue/');
  static String addBre =
      NetworkConfig.getFullApiRouteTow('/dailyHealth/addBloodPressureValue/');
}
