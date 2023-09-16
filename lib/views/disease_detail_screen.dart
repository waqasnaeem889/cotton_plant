import 'package:cotton_plant/model/dieases_model..dart';
import 'package:cotton_plant/widgets/detail_container.dart';
import 'package:cotton_plant/widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiseaseDetailScreen extends StatelessWidget {
  final DiseaseModel disease;
  const DiseaseDetailScreen({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          disease.diseaseName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF85C556),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            DetailContainer(title: 'Description:', details: disease.diseaseDescription,),
           const CustomDivider(),
             DetailContainer(title: 'Control Methods:', details: disease.diseaseControlMethod,),
              const CustomDivider(),
              DetailContainer(title: 'Fertilization:', details: disease.diseaseFertilization,),
          ],
        ),
      ),
    );
  }
}

