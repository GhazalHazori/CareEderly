import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/activity_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/activity_endpoints.dart';
import 'package:flutter_templete/core/data/network/endpoints/medicine_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class ActivityRepository {
  Future<Either<String, List<ActivityModel>>> getAll(
      {required String id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ActivityEndpoints.getall + id,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      );

      // final dynamic responseData = response['body'];

      CommonResponse<List<dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<ActivityModel> result = [];

        commonResponse.data!.forEach(
          (element) {
            result.add(ActivityModel.fromJson(element));
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

  Future<Either<String, Map>> delet({required String id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        url: ActivityEndpoints.delet + id,
        body: {},
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.DELETE),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map>> update(
      {String? activityName,
      String? description,
      String? endDate,
      int? repate,
      bool? EnableNotification,
      required String id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.PUT,
        url: ActivityEndpoints.update + id,
        body: {
          "activityName": activityName,
          "description": description,
          "repeat": repate,
          "EnableNotification": EnableNotification,
          "endDate": endDate
        },
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.PUT),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map>> create(
      {required String activityName,
      required String description,
      required String endDate,
      required int repate,
      required bool EnableNotification,
      required String id}) async {
    try {
      // final formattedEndDate = endDate.toIso8601String();
      // final formattedStartDate = startdate?.toIso8601String();
      // final formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
      // final formattedDateS = DateFormat('yyyy-MM-dd').format(startDate);
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: ActivityEndpoints.add + id,
        body: {
          "activityName": activityName,
          "description": description,
          "endDate": endDate,
          "repeat": repate,
          "EnableNotification": EnableNotification

          // "satrtdate": formattedStartDate
        },
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data ?? {});
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
