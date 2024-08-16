import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/diseases_model.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/diseases_endpoints.dart';
import 'package:flutter_templete/core/data/network/endpoints/medicine_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class DisRepository {
  Future<Either<String, List<DiseasesModel>>> getAll() async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: DiseasesEndpoints.getallDesiase,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      );

      // final dynamic responseData = response['body'];

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<DiseasesModel> result = [];

        commonResponse.data['diseases']!.forEach(
          (element) {
            result.add(DiseasesModel.fromJson(element));
          },
        );
        return Right(result);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
