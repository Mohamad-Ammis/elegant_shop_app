import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Response> post(
      {required String url,
      required body,
      String? token,
      contentType,
      Map<String, String>? headers}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: headers ??
                {
                  'Authorization': "Bearer $token",
                }));
    return response;
  }

  Future<Response> get(
      {required String url,
      String? token,
      contentType,
      Map<String, String>? headers}) async {
    var response = await dio.get(url,
        options: Options(
            contentType: contentType,
            headers: headers ?? (token!=null?
                {
                  'Authorization': "Bearer $token",
                }:{})));
    return response;
  }

  Future<Response> postWithImage({
    required String url,
    required Map<String, dynamic> body,
    required String imagePath,
    String? token,
    contentType,
    Map<String, String>? headers,
  }) async {
    FormData formData = FormData.fromMap({
      ...body,
      'avatar': await MultipartFile.fromFile(imagePath,
          filename: imagePath.split('/').last),
    });

    var response = await dio.post(url,
        data: formData,
        options: Options(
          contentType: contentType ?? 'multipart/form-data',
          headers: headers ??
              {
                'Authorization': "Bearer $token",
              },
        ));
    return response;
  }
}
