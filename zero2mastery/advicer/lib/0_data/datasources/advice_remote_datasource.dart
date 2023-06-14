import 'dart:convert';
import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:advicer/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  /// request a random request from api
  /// return [AdviceModel] if success
  /// throws an error is encounter server-exception
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final http.Client client;
  AdviceRemoteDataSourceImpl({required this.client});

  // final client = http.Client();

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final url = Uri.parse('https://api.flutter-community.com/api/v1/advice');
    final response = await client.get(url, headers: {
      'content-type': 'application/json',
    });

    final responseBody = json.decode(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return AdviceModel.fromJson(responseBody);
    }
  }
}
