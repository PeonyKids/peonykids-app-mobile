import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peonyapp/Screens/onboarding/securityQuestions.dart';
import 'package:peonyapp/Styles/colors.dart';
import 'package:peonyapp/Widgets/widgets.dart';

class childdetails extends StatefulWidget {
  const childdetails({super.key});

  @override
  State<childdetails> createState() => _childdetailsState();
}

List<String> values = ['Male', 'Female'];

class _childdetailsState extends State<childdetails> {
  String selectedValue = values[0];
  bool childVisibility = false;
  bool addchild = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter your child’s details',
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Please enter your correct details',
                  style: TextStyle(
                    color: Color(0xff737373),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Child's name",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Color(0xff252525),
                      ),
                      hintText: "Enter your child's name",
                      hintStyle: TextStyle(
                        color: Color(0xff737373),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffEDEDED)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffEDEDED)),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Gender?',
                style: TextStyle(
                  color: Color(0xff252525),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Male'),
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
                  ListTile(
                    title: Text('Female'),
                    leading: Radio(
                      activeColor: primaryColor01,
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
              Visibility(
                visible: addchild,
                child: SizedBox(
                  height: 10,
                ),
              ),

              Visibility(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      childVisibility = true;
                      addchild = false;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: primaryColor01,
                          size: 22,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add another child',
                          style: TextStyle(
                              color: primaryColor01,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                visible: addchild,
              ),

              Visibility(
                visible: addchild,
                child: SizedBox(
                  height: 15,
                ),
              ),

              Visibility(
                  visible: childVisibility,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.grey,
                        indent: 3.0,
                        endIndent: 3.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Child's name",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color(0xff252525),
                              ),
                              hintText: "Enter your child's name",
                              hintStyle: TextStyle(
                                color: Color(0xff737373),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffEDEDED)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Gender?',
                        style: TextStyle(
                          color: Color(0xff252525),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Male'),
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
                          ListTile(
                            title: Text('Female'),
                            leading: Radio(
                              activeColor: primaryColor01,
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
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: StadiumBorder(),
                              backgroundColor: Color(0xFFF6F2F7)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: black,
                            size: 23,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              childVisibility = true;
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor01,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Add another child',
                                  style: TextStyle(
                                      color: primaryColor01,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        visible: childVisibility,
                      ),
                    ],
                  )),
              SizedBox(
                height: 25,
              ),
              shadowButton(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => securityquestions()),
                );
              }, text: 'Continue', color: primaryColor01),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: primaryColor01,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal, fontSize: 16),
                  ),
                ),
              )

              // You can add more RadioListTiles for additional options
            ],
          ),
        ),
      )),
    );
  }
}
