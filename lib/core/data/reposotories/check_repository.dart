import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/check_endpoints.dart';

import 'package:flutter_templete/core/data/network/endpoints/medicine_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class CheckRepository {
  Future<Either<String, String>> checkDia({
    required String disId,
    required String tokenn,
    required String value,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: CheckEndpoints.addDia + tokenn,
        body: {
          "disease": disId,
          "value": value,
        },
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data!['status'] ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> checkBre({
    required String disId,
    required String tokenn,
    required String value,
  }) async {
    try {
      // final formattedEndDate = endDate.toIso8601String();
      // final formattedStartDate = startdate?.toIso8601String();
      // final formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
      // final formattedDateS = DateFormat('yyyy-MM-dd').format(startDate);
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: CheckEndpoints.addBre + tokenn,
        body: {
          "disease": disId,
          "value": value,

          // "satrtdate": formattedStartDate
        },
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data!['status'] ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
