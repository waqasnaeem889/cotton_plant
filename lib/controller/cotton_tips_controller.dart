// ignore: file_names
import 'dart:developer';

import 'package:cotton_plant/utils/api.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CottonTipsController extends GetxController{
 
String _tip = '';
String get tip => _tip;

Future<String> getCottonTips() async {
 try {
   final model = GenerativeModel(model: 'gemini-pro', apiKey: ChatGPT.apiKey);
  final content = [Content.text('Give me some cotton planting tip, just tip nothing else, arround 5 to 6 lines')];
  final response = await model.generateContent(content);
  log('Response : $response');
  return response.text ?? 'No Text';
 } catch (e , s) {
   log(e.toString() , stackTrace: s);
   return 'No Tips Yet';
 }
}

bool isLoading = false;

void changeIsload(){
  isLoading = !isLoading;
  update();
}


@override
  Future<void> onReady()async  {
  await loadTips();
    super.onReady();
  }

  Future<void> loadTips ()async {
    changeIsload();
_tip =  await  getCottonTips();
  update();
changeIsload();

  }


}