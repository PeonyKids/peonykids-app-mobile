import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_back_ios),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontFamily: 'WorkSans'),
                  )
                ],
              ),
                SizedBox(height: 25,),
              ListView.builder(
                itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Image(image: AssetImage('lib/images/image 6.png'),width: 100,),
                                SizedBox(width: 10,),
                                Expanded(
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
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Divider(color:  Color(0xFF737373),indent: 10,endIndent: 10,),
                              SizedBox(height: 5,),
                          ],
                        ),
                      ),
                    );
                  })),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10),
                    child: Text('Delivery Details',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: Card(
                                 elevation: 3.0,

                      margin: EdgeInsets.symmetric(horizontal: 20),

                      surfaceTintColor: Colors.white,
                      child:  Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text('Use a dispatch',style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text('Available only within Lagos'),
                                  trailing: Text('N2,000',style: TextStyle(fontWeight: FontWeight.bold),),
                                  leading: Radio(
                                    activeColor: Color(0xff64436E),
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
                                  trailing: Text('Free',style: TextStyle(color: Color(0xFF737373)),),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Subtotal(3 items)',style: TextStyle(color: Color(0xFF737373)),),
                    Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                   SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Delivery',style: TextStyle(color: Color(0xFF737373)),),
                    Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Total',style: TextStyle(color: Color(0xFF737373)),),
                    Text('N30,000',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
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
                child: Text('Proceed to Checkout',style: TextStyle(color: Colors.white,fontFamily: 'WorkSans'),),
               ),
               SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
