import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/data/models/apis/user_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
    required String fcm,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {"email": email, "password": password, "fcmToken": fcm},
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            storage.SaveUser(UserModel.fromJson(commonResponse.data ?? {}));
            return Right(
              TokenInfo.fromJson(
                commonResponse.data ?? {},
              ),
            );
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> verfiy({
    required String email,
    required String otpnum,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.verify,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {"email": email, "otpnum": otpnum},
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String email,
    required String firstname,
    required List<String> diseses,
    required String lastname,
    required String phnumber,
    required int age,
    required String password,
    required String fcmm,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        body: {
          'diseases': diseses,
          'email': email,
          'firstname': firstname,
          'lastname': lastname,
          'phnumber': phnumber,
          'password': password,
          'fcmToken': fcmm,
          'age': age.toString()
        },
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
          extraHeaders: {
            // 'Host': 're-project-8pu1.onrender.com',
          },
        ),
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map>> create(
      {required String medicinName,
      required String description,
      required String endDate,
      required String id,
      required int repate,
      required bool EnableNotification}) async {
    try {
      // final formattedEndDate = endDate.toIso8601String();
      // final formattedStartDate = startdate?.toIso8601String();
      // final formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
      // final formattedDateS = DateFormat('yyyy-MM-dd').format(startDate);
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.add + id,
        body: {
          "medicinName": medicinName,
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

  Future<Either<String, Map>> delet({required String id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        url: UserEndpoints.delet + id,
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
      {String? medicinName,
      String? description,
      String? endDate,
      int? repate,
      bool? EnableNotification,
      required String id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.PUT,
        url: UserEndpoints.update + id,
        body: {
          "medicinName": medicinName,
          "description": description,
          "endDate": endDate,
          "repeat": repate,
          "EnableNotification": EnableNotification
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
}
