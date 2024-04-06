import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class payments extends StatefulWidget {
  const payments({super.key});

  @override
  State<payments> createState() => _paymentsState();
}

// ignore: camel_case_types
class _paymentsState extends State<payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.close),
                      Icon(Icons.file_upload_outlined)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                       'assets/icons/Success Icon.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 100,
                        width: 70,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text('Payment Successful!'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'N30,000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 320,
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Payment Details'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                Text('000085752257')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                Text('000085752257')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                Text('000085752257')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                Text('000085752257')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 2,
                              color: Color(0xFFEDEDED),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                Text('000085752257')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ref Number'),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: StadiumBorder(),
                                      backgroundColor: Color(0xFFEEFBF6)),
                                  onPressed: () {},
                                  child: Text(
                                    'success',
                                    style: TextStyle(color: Color(0xFF23A26D)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFF6F2F7),
                            child: Image(image: AssetImage('assets/images/material-symbols_contact-support-rounded.png'))),
                        title: Text('Trouble With Your Payment?'),
                        subtitle: Text('Let us know on help center now!'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/tabler_download.png')),
                        SizedBox(width: 5,),
                        Text('Download PDF',style: TextStyle(color: Color(0xFF9D74AA),fontFamily: 'WorkSans',fontWeight: FontWeight.bold),),
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
                    child: Text('Back to Home',style: TextStyle(color: Colors.white,fontFamily: 'WorkSans'),),
                  ),

                  SizedBox(height: 10,)

                ],
              ),
            ),
          )),
    );
  }
}
