import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peonyapp/Widgets/widgets.dart';

import '../../Styles/colors.dart';

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
                      Text('Payment Successful!', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'N30,000',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                                  color: grey,
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
                                    'Success',
                                    style: TextStyle(color: Color(0xFF23A26D), fontWeight: FontWeight.bold),
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

                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: pink.withOpacity(0.2),
                            child: Image(image: AssetImage('assets/images/contact-support.png'), height: 24, width: 24,)),
                        title: Text('Trouble With Your Payment?'),
                        subtitle: Text('Let us know on help center now!'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: transparent,
                        border: Border.all(
                            width: 0.3,
                            color: primaryColor01,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download_outlined,
                          size: 35,
                          color: primaryColor01,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Download PDF',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: primaryColor01),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  shadowButton(onTap: (){

                  }, text: 'Back to Home', color: primaryColor01),
                  SizedBox(height: 10,)

                ],
              ),
            ),
          )),
    );
  }
}
