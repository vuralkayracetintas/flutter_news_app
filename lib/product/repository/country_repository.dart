import 'package:dio/dio.dart';
import '../../../api_constans.dart';
import 'package:news_app/product/model/country_model.dart';

class CountryNewsRepository {
  final String _baseUrl = ApiConstants.category;

  final Dio _dio = Dio();

  Future<CountryNewsModel> getCountryNews() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return CountryNewsModel.fromJson(response.data);
      } else {
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error occured: $error');
    }
  }
}
