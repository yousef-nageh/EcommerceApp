import 'package:dio/dio.dart';
import 'package:shop_app/app/classes/api_endpoint.dart';

class ApiService{

  final Dio _dio;
  ApiService(this._dio){
    _dio.options.baseUrl=ApiEndpoint.baseUrl;
    _dio.options.headers={
      'lang':'en',
      'Content-Type':'application/json',




    };
  }

  Future<Response>getData({ required String endPoint, Map<String,dynamic> ?data,String ?token,String lang ="en"}) async{
    _dio.options.headers={
      "Authorization":token,
      "lang":lang,

    };
    return await _dio.get(endPoint,queryParameters:data );


  }
  Future<Response>postData({ required String endPoint, Map<String,dynamic>? data,String ?token,String? lang}) async{
    _dio.options.headers={
      "Authorization":token,
      "lang":lang,
    };
    return await _dio.post(endPoint,queryParameters:data );


  }
  Future<Response>putData({ required String endPoint, Map<String,dynamic>? data,String ?token,String? lang}) async{
    _dio.options.headers={
      "Authorization":token,
      "lang":lang,
    };
    return await _dio.put(endPoint,queryParameters:data );


  }
}