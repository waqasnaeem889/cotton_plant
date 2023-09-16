import 'package:cotton_plant/model/dieases_model..dart';
import 'package:cotton_plant/views/disease_detail_screen.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(148, 28, 28, 0),
        elevation: 0,
        toolbarHeight: 150,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/pot.png",
            width: 300,
            height: 180,
          ),
          onPressed: () {
            print('App Icon Pressed');
          },
        ),
        actions: [
          // IconButton(
          //   icon: Image.asset(
          //     "assets/images/notification.png",
          //     width: 24,
          //     height: 24,
          //     color: Color.fromARGB(255, 32, 32, 32),
          //   ),
          //   onPressed: () {
          //     print('Notification Icon Pressed');
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              print('Settings Icon Pressed');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              '     Hi Dear!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(126, 123, 123, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Empowering Farmers, Protecting Crops',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 400,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.85,
                ),
                itemCount: diseaseList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: GestureDetector(
                      onTap: () {
                        print('Card $index Pressed');
                        // Navigate to a details page or perform other actions
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseaseDetailScreen(disease: diseaseList[index],),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                    image: AssetImage( diseaseList[index].diseaseImagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                         diseaseList[index].diseaseName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      padding: const  EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}