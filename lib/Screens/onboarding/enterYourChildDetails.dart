import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peonyapp/Screens/onboarding/securityQuestions.dart';
import 'package:peonyapp/Styles/colors.dart';
import 'package:peonyapp/Widgets/widgets.dart';

import '../../Models/childData.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({super.key});

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

List<String> values = ['Male', 'Female'];

class _ChildDetailsState extends State<ChildDetails> {
  List<GlobalKey<_ChildFormState>> childrenKeys = [];
  // List<Child> children = [];


  @override
  void initState() {
    super.initState();
    addChildForm();
  }

  @override
  void dispose() {
    for (var key in childrenKeys) {
      key.currentState?.dispose();
    }
    print('I ran');
    super.dispose();
  }

  void addChildForm() {
    setState(() {
      childrenKeys.add(GlobalKey<_ChildFormState>());
    });
  }

  void removeChildForm() {
    setState(() {
      if (childrenKeys.length > 1) {
        childrenKeys.removeLast();
      }
    });
  }

  void handleSubmit() {
    // List<Map<String, dynamic>> fullList = [];
    Child.children.clear();
    Child.Childs.clear();

    for (var key in childrenKeys) {
      var data = key.currentState?.getData();
      if (data != null) {
        Child.children.add(data);
      }
    }

    print('Ran first!');

    print(Child.children.map((child) => child.childInput()).toList());





    if (Child.children.isNotEmpty) {

      Child.Childs = Child.children.map((child) => child.childInput()).toList();

      for (var key in childrenKeys) {
        key.currentState?._clearTextFields();
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => securityquestions()),
      );
    } else {
      // Handle empty data case, e.g., show a message
      print("No valid child data entered.");
    }
  }

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
                SizedBox(height: 20),
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
                SizedBox(height: 10),
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
                SizedBox(height: 30),
                Column(
                  children: childrenKeys.map((key) => ChildForm(key: key)).toList(),
                ),
                Visibility(
                  visible: childrenKeys.length > 1,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: StadiumBorder(),
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: removeChildForm,
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.black,
                      size: 23,
                    ),
                    label: Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: addChildForm,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: primaryColor01,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Add another child',
                          style: TextStyle(
                            color: primaryColor01,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                shadowButton(
                  onTap: handleSubmit,
                  text: 'Continue',
                  color: primaryColor01,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: primaryColor01,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildForm extends StatefulWidget {
  const ChildForm({Key? key}) : super(key: key);

  @override
  _ChildFormState createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  String _selectedValue = '';

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  void _clearTextFields() {
    // print('ran');
    _firstnameController.clear();
    _lastnameController.clear();
    setState(() {
      _selectedValue = '';
    });
  }

  Child? getData() {
    String firstname = _firstnameController.text.trim();
    String lastname = _lastnameController.text.trim();

    print("First name: $firstname, Last name: $lastname, Gender: $_selectedValue");


    if (firstname.isNotEmpty && lastname.isNotEmpty && _selectedValue.isNotEmpty) {
      return Child(
        firstName: firstname,
        lastName: lastname,
        gender: _selectedValue,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Child's name",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60,
          child: TextField(
            controller: _firstnameController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: Color(0xff252525),
              ),
              hintText: "FirstName",
              hintStyle: TextStyle(
                color: Color(0xff737373),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60,
          child: TextField(
            controller: _lastnameController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: Color(0xff252525),
              ),
              hintText: "LastName",
              hintStyle: TextStyle(
                color: Color(0xff737373),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Gender?',
          style: TextStyle(
            color: Color(0xff252525),
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Radio(
              activeColor: primaryColor01,
              value: values[0],
              groupValue: _selectedValue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value.toString();
                });
                print('Selected Gender $_selectedValue');
              },
            ),
            const Text(
              'Male',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              activeColor: primaryColor01,
              value: values[1],
              groupValue: _selectedValue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value.toString();
                });
                print('Selected Gender $_selectedValue');
              },
            ),
            const Text(
              'Female',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Divider(
          color: black03,
          thickness: 0.3,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}



