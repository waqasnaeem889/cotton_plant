// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseModel {
  final String diseaseName;
  final String diseaseImagePath;
  final String diseaseDescription;
  final String diseaseControlMethod;
  final String diseaseFertilization;

  DiseaseModel(
    this.diseaseName,
    this.diseaseImagePath,
    this.diseaseDescription,
    this.diseaseControlMethod,
    this.diseaseFertilization,
  );
}

List<DiseaseModel> diseaseList = [
  DiseaseModel('Aphids', 'assets/images/white-cotton-boll.jpg', ''' 
Aphids are small insects that feed on cotton plants by piercing plant tissues and sucking sap.
They can damage cotton plants, reduce yield, and transmit diseases.''', ''' Biological control using natural predators like ladybugs.
Chemical control with insecticides.
Cultural practices like crop rotation.
Regular monitoring for early detection.
''', ''' Conduct soil tests to determine nutrient needs.
Provide essential nutrients like nitrogen, phosphorus, and potassium.
Consider micronutrients.
Enhance soil organic matter.
Apply fertilizers responsibly to minimize environmental impact.'''),
  DiseaseModel('Army worm', 'assets/images/white-cotton-boll.jpg', '''
Armyworms are caterpillar pests known for their marching behavior. They feed on cotton leaves and stems, often in groups, causing extensive damage.
 ''', '''Insecticides: When armyworm populations are high, insecticides can be effective, but use them judiciously and adhere to safety guidelines.
Integrated Pest Management (IPM): Regular monitoring of fields is essential for early detection. Consider natural predators for biological control.''', ''' Soil tests are vital for nutrient assessment. Provide essential nutrients like nitrogen, phosphorus, and potassium for cotton growth.
Bacterial Blight '''),
  DiseaseModel('Bacterial Blight', 'assets/images/white-cotton-boll.jpg', ''' 
 Bacterial blight is a disease caused by Xanthomonas axonopodis pv. malvacearum, affecting cotton leaves. It causes water-soaked lesions, leaf wilting, and defoliation.
''', '''
Resistant Varieties: Plant cotton varieties with resistance to bacterial blight.
Copper-Based Sprays: Apply copper-based bactericides preventively, especially during favorable conditions for the disease.
''', ''' Consider micronutrients like copper in your fertilization plan. Enhance soil organic matter to improve overall plant health and disease resistance.
  '''),
  DiseaseModel('Powdery Midew', 'assets/images/white-cotton-boll.jpg', ''' 
 Powdery mildew is a fungal disease characterized by white, powdery growth on cotton leaves, reducing photosynthesis and plant vigor.
''', '''
Fungicides: Use fungicides recommended by experts when powdery mildew is detected.
Pruning: Remove infected leaves to limit disease spread.
Spacing: Maintain proper plant spacing for improved airflow and reduced humidity.''',
      ''' Ensure a balanced nutrient supply, with a particular focus on calcium, which can enhance disease resistance.'''),
  DiseaseModel('Target spot', 'assets/images/white-cotton-boll.jpg',
      ''' Target spot is a fungal disease that manifests as circular lesions with concentric rings on cotton leaves. It can impact both cotton yield and quality.
''', '''Fungicides: Apply fungicides at the first signs of target spot based on expert recommendations.
Crop Rotation: Avoid consecutive cotton planting in the same area.
Spacing: Maintain suitable plant spacing to reduce humidity and disease spread.
''', '''Maintain nutrient balance, with an emphasis on organic matter addition to enhance soil health.
Your cotton plant app can provide region-specific advice on product recommendations and timing for pest and disease management and fertilizer application. Always follow recommended guidelines for responsible pesticide and fertilizer use to ensure a thriving cotton crop.'''),
];
