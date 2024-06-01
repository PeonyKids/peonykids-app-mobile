import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peonyapp/Styles/colors.dart';
import 'package:peonyapp/widgets.dart';
import 'package:provider/provider.dart';

import '../stateManagement/providers.dart';
import 'congratulations.dart';

class securityquestions extends StatefulWidget {
  const securityquestions({super.key});

  @override
  State<securityquestions> createState() => _securityquestionsState();
}

class _securityquestionsState extends State<securityquestions> {
  final TextEditingController _answerController = TextEditingController();
  String dropdownvalue = 'Select Question';
  String verify = 'Verify';

  // List of items in our dropdown menu
  var items = [
    'Select Question',
    'What\'s your Mother\'s Maidens Name',
    'What\'s your Pet Name',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainState>(
        builder: (context, value, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Set security question',
                        style: TextStyle(
                          color: Color(0xff252525),
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please select a question you could easily remember',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff737373),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Questions",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEDEDED)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5, right: 5),
                        child: DropdownButton(
                            isExpanded: true,
                            itemHeight: 80,
                            isDense: true,
                            style: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            underline: Container(),
                            // Initial Value
                            value: dropdownvalue,
              
                            // Down Arrow Icon
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff252525),
                            ),
              
                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Answer',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _answerController,
                        decoration: InputDecoration(
                            hintText: 'Enter Answer',
                            hintStyle: TextStyle(color: Color(0xff737373)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEDEDED)),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(height: 10,),
              
                   Visibility(
                     visible: value.SignInError,
                      child:Text(value.error, style: TextStyle(
                        color: Colors.red
                      ),),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: const Text(
                              "This feature enables linking this account with another, allowing you to log in on two separate devices using the same child name.",
                              style: TextStyle(fontSize: 14),
                            ),
                            actions: <Widget>[
                              Center(
                                child: TextButton(
                                  onPressed: () {
              
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(color: Color(0xff252525)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                     'Why this?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    shadowButton(onTap: (){
                      value.securityQuestion= dropdownvalue;
                      value.securityAnswer = _answerController.text.trim();
              
              
              
              
                      print(value.securityQuestion);
                      value.signUpUser(context);
                   //   value.success == 'true' ? value.verifyEmail() : null;
              
              
                     // Navigator.push(
                      //  context,
                      //  MaterialPageRoute(builder: (context) => congratulations()),
                    //  );
                    }, text:   'Verify'),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text(
              
                          'Back',
                          style: TextStyle(
                              color: primaryColor01,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
