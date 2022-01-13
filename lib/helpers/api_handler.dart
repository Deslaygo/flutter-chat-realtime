import 'package:dio/dio.dart';
import '../global/environment.dart';

final apiUrl = Environment.apiUrl;
const httpString = 'http://';

final options = BaseOptions(
  baseUrl: '$httpString$apiUrl',
  contentType: Headers.jsonContentType,
);
Dio dio = Dio(options);

class ApiHandler {
  static Future get(
      String modulo, String endPoint, Map<String, dynamic> filtros,
      {String token = ''}) async {
    try {
      final response = await dio.get(
        '/$modulo/$endPoint',
        queryParameters: filtros,
        options: Options(headers: {
          'x-token': token,
        }),
      );

      final extractedData = response.data;

      if (extractedData == null) return;

      if (response.statusCode == 200) {
        return extractedData['data'];
      } else {
        throw Exception('Error obteniendo información de $modulo/$endPoint');
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future post(
      String modulo, String endPoint, Map<String, dynamic> parametros,
      {bool isUpload = false}) async {
    try {
      final formData = isUpload ? FormData.fromMap(parametros) : parametros;

      final response = await dio.post(
        '/$modulo/$endPoint',
        data: formData,
      );

      final extractedData = response.data;

      if (extractedData == null) return;

      final codigo = int.parse(extractedData['codigo'].toString());
      if (codigo == 401) {
        throw Exception(extractedData['msg']);
      }
      if (codigo == 405) {
        throw Exception(extractedData['error']);
      }
      if (response.statusCode == 200) {
        return extractedData['data'];
      } else {
        throw Exception('Error realizando petición en $modulo/$endPoint');
      }
    } catch (e) {
      rethrow;
    }
  }
}
