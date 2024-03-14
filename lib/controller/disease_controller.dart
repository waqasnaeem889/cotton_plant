import 'dart:convert';

import 'package:cotton_plant/model/diseaes_detect_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class DiseaseController extends GetxController {
  DiseaseDetect _disease = DiseaseDetect(id: '' , name: '');
  DiseaseDetect get disease => _disease;

  Future<void> getDiseaseName(String url) async {
    _disease = await getDiseaseInfo(url);
    update();
  }

  Future<DiseaseDetect> getDiseaseInfo(String url) async {
    DiseaseDetect disease = DiseaseDetect(id: '', name: '');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://whitelabel.nomad.africa:3001/predict_deases'));
    request.body = json.encode({"image": url});
    request.headers.addAll(headers);

    http.StreamedResponse steamResponse = await request.send();

    if (steamResponse.statusCode == 200) {
      var response = await steamResponse.stream.bytesToString();

      final result = jsonDecode(response) as Map<String, dynamic>;
      disease.name = result['name'];
      disease.id = result['id'];

      return disease;
    } else {
      disease.name = 'Disease Not Found!';
      disease.id = '';
      return disease;
    }
  }
}
