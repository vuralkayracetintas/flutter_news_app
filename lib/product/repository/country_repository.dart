import 'package:dio/dio.dart';
import 'package:news_app/product/constants/api_constans.dart';
import 'package:news_app/product/model/country_model.dart';

class CountryNewsRepository {
  final String _baseUrl = ApiConstants.countryReq;

  final Dio _dio = Dio();

  Future<CountryNewsModel> getCountryNews() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return CountryNewsModel.fromMap(response.data);
      } else {
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error occured: $error');
    }
  }
}