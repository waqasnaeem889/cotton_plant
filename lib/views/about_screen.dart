import 'package:cotton_plant/widgets/detail_container.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:   Scaffold(
      
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: const  DetailContainer(title: 'About', details:  '''At Cotton Plant Disease App, we are driven by a shared passion for sustainable agriculture and a deep-rooted commitment to the cotton farming community. Our journey began with a simple yet powerful idea: to harness technology for the betterment of cotton farmers worldwide. Founded by a team of agricultural enthusiasts and experts, we are on a mission to empower farmers with the knowledge and tools they need to cultivate healthier, more productive cotton crops. With a focus on sustainability and responsible farming practices, we believe in the potential of modern technology to transform the cotton farming landscape. Our user-friendly app is designed to simplify the complexities of cotton farming, offering expert guidance on pest management, disease control, and optimized fertilization. We take pride in being part of a global community of cotton growers, and we invite you to join us on this journey towards a more prosperous and sustainable future for cotton farming.
                  '''),
          ),
        )
      ),
    );
  }
}

