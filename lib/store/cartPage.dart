import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peonyapp/widgets.dart';

import '../Styles/colors.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}
List<String> values = ['Male', 'Female'];
class _cartPageState extends State<cartPage> {
  String selectedValue = values[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white04,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Your Cart',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: black03,width: 0.4), ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image(image: AssetImage('assets/images/image 6.png'),width: 100,),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Danami Children's Zip Up Hoodie",softWrap: true,maxLines: 2,),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('N10,000',style: TextStyle(fontWeight: FontWeight.bold),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: Color(0xFFD9D9D9),
                                                    child: Text('-',style: TextStyle(color: Colors.black),),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text('1',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: Color(0xFFD9D9D9),
                                                    child: Text('+',style: TextStyle(color: Colors.black),),
                                                  )
                                                ],
                                              ),
                                               SizedBox(width: 10,),

                                           Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xFFFFEBEB)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.delete_outline,color: Color(0xFFCC0000),),
                                                SizedBox(width: 5,),
                                                Text('Delete',style: TextStyle(color: Color(0xFFCC0000)),)
                                              ],
                                            ),
                                           ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                              SizedBox(height: 5,),
                          ],
                        ),
                      );
                    })),
                    SizedBox(height: 20,),
                    Text('Delivery Details',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: Card(
                                   elevation: 3.0,

                        margin: EdgeInsets.symmetric(horizontal: 1.0),

                        surfaceTintColor: Colors.white,
                        child:  Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('Use a dispatch',style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle: Text('Available only within Lagos'),
                                    trailing: Text('₦2,000',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                    leading: Radio(
                                      activeColor: primaryColor01,
                                      value: values[0],
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  ListTile(
                                    title: Text('Pick up at Peony',style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle: Text('12, The Rock Mews, Rock Drive (by IMAX Cinemas), Lekki Phase 1, Lagos Nigeria'),
                                    trailing: Text('Free',style: TextStyle(color: Color(0xFF737373),  fontSize: 16),),
                                    leading: Radio(
                                      activeColor: Color(0xff64436E),
                                      value: values[1],
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          print('hnht');
                                          selectedValue = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Subtotal(3 items)',style: TextStyle(color: Color(0xFF737373)),),
                    Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                     Text('Delivery',style: TextStyle(color: Color(0xFF737373)),),
                     Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                       ],
                     ),
                    SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                     Text('Total',style: TextStyle(color: Color(0xFF737373)),),
                     Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                       ],
                     ),
                    SizedBox(height: 30,),
                     shadowButton(onTap: (){

                     }, text: 'Proceed to Checkout', color: primaryColor01),
                 SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
