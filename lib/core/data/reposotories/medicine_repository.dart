import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/medicine_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class MedicineRepository {
  Future<Either<String, List<MedicineModel>>> getAll(
      {required String id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: MedicineEndpoints.getall + id,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      );

      // final dynamic responseData = response['body'];

      CommonResponse<List<dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<MedicineModel> result = [];

        commonResponse.data!.forEach(
          (element) {
            result.add(MedicineModel.fromJson(element));
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
