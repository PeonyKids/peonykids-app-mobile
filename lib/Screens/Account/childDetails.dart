import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Styles/colors.dart';
import 'addChild.dart';

class ChildrenList extends StatefulWidget {
  const ChildrenList({super.key});

  @override
  State<ChildrenList> createState() => _ChildrenListState();
}

class _ChildrenListState extends State<ChildrenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white04,
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
          'Child Details',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              childs(
                  image: 'assets/avatars/img.png',
                  name: 'Macdonald Anyanwu',
                  age: '12 months'),
              childs(
                  image: 'assets/avatars/img.png',
                  name: 'Ben Anyanwu',
                  age: '12 months'),
              childs(
                  image: 'assets/avatars/img.png',
                  name: 'Anne Anyanwu',
                  age: '12 months'),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddChild()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: transparent,
                      border: Border.all(
                          width: 1.0,
                          color: black,
                          style: BorderStyle.solid)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 25,
                          color: black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add a child',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding childs({required String image, required String name, required String age}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whitey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: black02.withOpacity(0.1), // Shadow color
              offset: Offset(0.0, 7.0), // Offset from right
              blurRadius: 12, // Spread of the shadow
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/avatars/img.png',
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Age: ${age}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: red, // color of the border
                    width: 1, // thickness of the border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Theme(
                            data: ThemeData(
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            child: AlertDialog(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(15.0),
                              // ),
                              // contentPadding: EdgeInsets.symmetric(
                              //     horizontal: 20, vertical: 20), // Adjust padding
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20), // Adjust content padding
                              backgroundColor: Colors.white,
                              title: Text(
                                'Remove Child?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: black,
                                    fontFamily: 'WorkSans'),
                              ),
                              content: Text(
                                'Are you sure you want to remove? This action cannot be undone',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: black,
                                    fontFamily: 'WorkSans'),
                              ),
                              actions: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // value.LogoutUser(context);
                                  },
                                  child: Container(
                                    // height: 40,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xffFFEBEB)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Text(
                                          'Proceed',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffCC0000),
                                              fontFamily: 'WorkSans'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    // height: 40,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: transparent),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: black,
                                              fontFamily: 'WorkSans'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Icon(
                        Icons.delete_outline_outlined,
                        size: 25,
                        color: red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
