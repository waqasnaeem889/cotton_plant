import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class DiseaseController extends GetxController {
  String _disease = '';
  String get disease => _disease;

  Future<void> getDiseaseName(String url) async {
    _disease = await getDiseaseInfo(url);
    update();
  }

  Future<String> getDiseaseInfo(String url) async {
    String diseaseName = '';
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://whitelabel.nomad.africa:3001/predict_deases'));
    request.body = json.encode({"image": url});
    request.headers.addAll(headers);

    http.StreamedResponse steamResponse = await request.send();

    if (steamResponse.statusCode == 200) {
      var response = await steamResponse.stream.bytesToString();

      final result = jsonDecode(response) as Map<String, dynamic>;
      diseaseName = result['deases_name'];
      return diseaseName;
    } else {
      diseaseName = 'Disease Not Found!';
      return diseaseName;
    }
  }
}
