import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class particluaritem extends StatefulWidget {
  const particluaritem({super.key});

  @override
  State<particluaritem> createState() => _particluaritemState();
}

class _particluaritemState extends State<particluaritem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Icon(Icons.arrow_back_ios_new_outlined,size: 23,),
                    Row(
                      children: [
                       Image(image: AssetImage('lib/images/Frame 6.png')),
                        SizedBox(width: 10,),
                        Image(image: AssetImage('lib/images/Frame 7.png'))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(image: AssetImage('lib/images/image 6.png'),width: double.infinity,fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Danami Children's Zip Up Hoodie",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('N20,000',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Color(0xFF252525),),
                    SizedBox(width: 5,),
                    Text('Lekki Phase 2, Lagos. Nigeria',style: TextStyle(color: Color(0xFF252525)),)
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Row(
                  children: [
                    Icon(Icons.motorcycle_outlined,color: Color(0xFF252525),),
                    SizedBox(width: 5,),
                    Text('Pick up available',style: TextStyle(color: Color(0xFF252525)),)
                  ],
                             ),
               ),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Colors',style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold),),
                     SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey,),
                        SizedBox(width: 10,),
                          CircleAvatar(backgroundColor: Colors.grey,),
                           SizedBox(width: 10,),
                            CircleAvatar(backgroundColor: Colors.grey,),
                             SizedBox(width: 10,),
                              CircleAvatar(backgroundColor: Colors.grey,)
                      ],
                    )
                  ],
                 ),
               ),
                SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('About',style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold),)),
                     SizedBox(height: 10,),
                  Text('Suitable for kids from 2-12months')
                  ],
                 ),
               ),
               SizedBox(height: 10,),
                 Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF9D74AA), Color(0xffE36E9A)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
              ),
              borderRadius: BorderRadius.circular(25)
            ),
            alignment: Alignment.center,
            child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontFamily: 'WorkSans'),),
           ),
           SizedBox(height: 10,),
             Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
             border: Border.all(color: Color(0xffE36E9A)),
              borderRadius: BorderRadius.circular(25)
            ),
            alignment: Alignment.center,
            child: Text('Check out',style: TextStyle(color: Color(0xFF9D74AA),fontFamily: 'WorkSans',fontWeight: FontWeight.bold),),
           ),
           SizedBox(height: 10,)
          ],
                ),
        )),
    );
  }
}