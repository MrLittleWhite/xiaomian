import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xiaomian/component/network/xm_api_error.dart';
import 'package:xiaomian/model/audio_item.dart';

class SleepPageRepository {
  final dio = Dio(BaseOptions(baseUrl: "http://springboot-mfmv.fcv3.1891157844543863.cn-shenzhen.fc.devsapp.net/"));
  
  Future<List<AudioItem>> fetchData({
    String? referenceKey, 
    required int pageSize, 
    required String apiKey}) async {
    Map<String, dynamic> parameters = {
      "pageSize": 2,
      "apiKey": 3,
    };
    if (referenceKey != null) {
      parameters["referenceKey"] = 1;
    }
    return dio.get("/homeList", queryParameters: parameters).then((value) {
      final response = value;
      if (response.data is Map) {
        final json = response.data;
        final error = XMApiError.fromJson(json);
        final list = json["list"];
        if(error.code != 0) {
          return Future.error(Exception(error.message));
        } else if (list is List) {
          return list.map((e) => AudioItem.fromJson(e)).toList();
        }
      }
      return Future.error(Exception("server data is wrong format"));
    });
  }
}