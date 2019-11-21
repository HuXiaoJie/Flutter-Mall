import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mall/http/config.dart';
import 'package:mall/http/result_data_entity.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

  factory DioUtil() {
    return _instance;
  }

  DioUtil._init() {
    _dio = new Dio();
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/x-www-form-urlencoded';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;

    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
  }

  Future<dynamic> get(String path,
      {pathParams, data, Function errorCallback}) {
    return request(path,
        method: Method.get,
        pathParams: pathParams,
        data: data,
        errorCallback: errorCallback);
  }

  Future<dynamic> post(String path,
      {pathParams, data, Function errorCallback}) {
    return request(path,
        method: Method.post,
        pathParams: pathParams,
        data: data,
        errorCallback: errorCallback);
  }

  Future<dynamic> request(String path,
      {String method, Map pathParams, data, Function errorCallback}) async {
    ///restful请求处理
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    print("请求参数====" + data.toString());
    Response response = await _dio.request(path,
        queryParameters: data, options: Options(method: method));
    print("请求结果====" + response.toString());
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          ResultDataEntity entity = ResultDataEntity.fromJson(response.data);
          if (entity.res == Config.RESPONSE_OK) {
            if (entity.info == null) {
              if (errorCallback != null) {
                errorCallback(entity.res, entity.msg);
              }
            } else {
              return entity.info;
            }
          } else {
            if (errorCallback != null) {
              errorCallback(entity.res, entity.msg);
            }
          }
        } else {
//          ResultDataEntity entity = ResultDataEntity.fromJson(response.data);
//          if (entity.res == Config.RESPONSE_OK) {
//            return json.decode(entity.info.toString());
//          }
        }
      } catch (e) {
        if (errorCallback != null) {
          errorCallback(response.statusCode, "");
        }
      }
    } else {
      _handleHttpError(response.statusCode);
      if (errorCallback != null) {
        errorCallback(response.statusCode, "");
      }
    }
  }

  ///处理Http错误码
  void _handleHttpError(int errorCode) {}
}
