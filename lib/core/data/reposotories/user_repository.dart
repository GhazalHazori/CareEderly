import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        headers: NetworkConfig.getHeaders(
          type: RequestType.POST,
          needAuth: false,
        ),
        body: {"email": email, "password": password},
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
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
}
