import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peonyapp/Styles/colors.dart';
import 'package:peonyapp/store/particluarStorePage.dart';

import 'cartPage.dart';

class storepage extends StatefulWidget {
  const storepage({super.key});

  @override
  State<storepage> createState() => _storepageState();
}

class _storepageState extends State<storepage> {
  List items = [
    {
      'name': "Danami Children's Zip Up Hoodie",
      'age': 'N10,000',
      'image': 'assets/images/image 6.png'
    },
    {
      'name': "Danami Children's Zip Up Hoodie",
      'age': 'N20,000',
      'image': 'assets/images/image 5.png'
    },
    {
      'name': "ADIDAS Sports Performance Slides",
      'age': 'N30,000',
      'image': 'assets/images/image 5.png'
    },
    {
      'name': "ADIDAS Sports Performance Slides",
      'age': 'N40,000',
      'image': 'assets/images/image 6.png'
    },
    {
      'name': "Danami Children's Zip Up Hoodie",
      'age': 'N10,000',
      'image': 'assets/images/image 6.png'
    },
    {
      'name': "Danami Children's Zip Up Hoodie",
      'age': 'N20,000',
      'image': 'assets/images/image 5.png'
    },
    {
      'name': "ADIDAS Sports Performance Slides",
      'age': 'N30,000',
      'image': 'assets/images/image 5.png'
    },
    {
      'name': "ADIDAS Sports Performance Slides",
      'age': 'N40,000',
      'image': 'assets/images/image 6.png'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kids Store',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Row(
                    children: [
                      Image(image: AssetImage('assets/images/Frame 6.png')),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => cartPage()),
                            );
                          },
                          child: Image(image: AssetImage('assets/images/Frame 7.png')))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 290,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 50),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8.0),
                          height: 150,
                          width: 150,
                          child: Image(image: AssetImage(items[index]['image'])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(items[index]['name'])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              items[index]['age'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.7,
                        ),
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: lightish,
                                  shape: StadiumBorder(),
                                  side: BorderSide(color: primaryColor01)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => particluaritem()),
                                );
                              },
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: primaryColor01,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: items.length,
              )
            ],
          ),
        ),
      )),
    );
  }
}
