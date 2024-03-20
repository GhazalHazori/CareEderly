import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';

//ملف الاعدادادتى لكامل ال api
class NetworkConfig {
  static String BASE_API = '/api/auth';
  static String BASE_API2 = '/api';

  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static String getFullApiRouteTow(String apiroute2) {
    return BASE_API2 + apiroute2;
  }

  static Map<String, String>? getHeaders(
      {bool needAuth = true,
      RequestType? type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth) "token": "${storage.getTokenInfo()?.accessToken ?? ''}",
      if (type != RequestType.GET)
        "Content-Type": type == RequestType.MULTIPART
            ? "multipart/form-data"
            : "application/json",
      ...extraHeaders ?? {}
    };
  }
}
