import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Models/childData.dart';
import '../../Styles/colors.dart';
import '../../stateManagement/providers.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({Key? key}) : super(key: key);

  @override
  State<Reportpage> createState() => _ReportpageState();
}





class _ReportpageState extends State<Reportpage> {

  late PageController _pageController;
  late int _currentIndex; // Track the current active page index

  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }


  Future<void> _initializeData() async {
    final childDataProvider = Provider.of<MainState>(context, listen: false);
    // Create an instance of DataHandler
    Children childDataHandler = Children(childDataProvider.childDetails);

    setState(() {
      items = childDataHandler.getProcessedData();
      _currentIndex = childDataProvider.activeChild!;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final childDataProvider = Provider.of<MainState>(context, listen: true);


    List<Widget> children = [];

    // List<Widget> children = [
    //   childSelector(active: true, name: 'Macdonald'),
    //   childSelector(active: false, name: 'Ben'),
    //   childSelector(active: false, name: 'Anne'),
    //   childSelector(active: false, name: 'John'),
    // ];

    // List<Widget> children = items.map((child) {
    //   return childSelector(
    //     active: child['active'],
    //     name: child['firstName'],
    //   );
    // }).toList();

    // List<Map<String, dynamic>> children = items;

    // List<Widget> children = [
    //   childSelector(active: _currentIndex == 0, name: 'Macdonald'),
    //   childSelector(active: _currentIndex == 1, name: 'Ben'),
    //   childSelector(active: _currentIndex == 2, name: 'Anne'),
    //   childSelector(active: _currentIndex == 3, name: 'John'),
    // ];

    for (int i = 0; i < items.length; i++) {
      children.add(
        childSelector(
          active: _currentIndex == i,
          name: items[i]['firstName'],
          id: items[i]['id'],
        ),
      );
    }

    print(children.length);

    void _updateChildData(int index) {
      final selectedChild = items[index];

      // Call the methods to update child ID and fetch reports
      childDataProvider.changeChildId(selectedChild['id']);
      childDataProvider.getChildReports(context);
      childDataProvider.changeActiveChild(index);
    }

    return Scaffold(
      backgroundColor: white04,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white04), // Set the icon color to white
        elevation: 0,
        backgroundColor: white,
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Icon(
              Icons.info_outline,
              color: black,
            ),
          ),
        ],
        title: Center(
          child: Text(
            'Child’s daily report',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: black),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: children.isEmpty
                      ? 0.0
                      : children.length.toDouble() * 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: children.length, // Number of items in the list
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Update selected child on tap and animate to corresponding page
                          // setState(() {
                          //   _currentIndex = index;
                          //   _pageController.animateToPage(_currentIndex,
                          //       duration: const Duration(milliseconds: 1000),
                          //       curve: Curves.easeIn
                          //   );
                          //
                          // });
                          //
                          // final selectedChild = items[index];
                          //
                          // // Call the methods to update child ID and fetch reports
                          // childDataProvider.changeChildId(selectedChild['id']);
                          // childDataProvider.getChildReports(context);
                          //
                          // childDataProvider.changeActiveChild(_currentIndex);


                          setState(() {
                            _currentIndex = index;
                            print("Screen changed to index: $index");
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                _currentIndex,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeIn,
                              );
                            }
                          });

                          _updateChildData(index);

                          // final selectedChild = items[index];
                          //
                          // // Call the methods to update child ID and fetch reports
                          // childDataProvider.changeChildId(selectedChild['id']);
                          // childDataProvider.getChildReports(context);
                          //
                          // childDataProvider.changeActiveChild(_currentIndex);


                        },
                        child: children[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: childDataProvider.isFetchingReports
                    ? const Center(child: CircularProgressIndicator()) : PageView.builder(
                    controller: _pageController,
                    itemCount: children.length, // Number of items in the list
                    onPageChanged: (index) {

                      print("Page changed to index: $index"); // Debugging

                      // Update the selected child index when page changes
                      setState(() {
                        _currentIndex = index; // Update active index
                      });

                      // print(_currentIndex);

                      _updateChildData(index);

                      // final selectedChild = items[index];
                      //
                      // // Call the methods to update child ID and fetch reports
                      // childDataProvider.changeChildId(selectedChild['id']);
                      // childDataProvider.getChildReports(context);
                      //
                      // childDataProvider.changeActiveChild(_currentIndex);


                    },
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Consumer<MainState>(
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 10, left: 15.w, right: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IntrinsicWidth(
                                        child: Container(
                                          height: 40,
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: black,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '23rd February, 2024',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 30,
                                                color: black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      value.latestMessage,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                          color: black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Mood',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600,
                                          color: black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      children: [
                                        moods(
                                          mood: value.latestMood == 'HAPPY',
                                          emoji: 'assets/icons/cil_happy.svg',
                                          text: 'Happy',
                                        ),
                                        moods(
                                          mood: value.latestMood == 'CRANKY',
                                          emoji: 'assets/icons/carbon_face-neutral.svg',
                                          text: 'Cranky',
                                        ),
                                        moods(
                                          mood: value.latestMood == 'SAD',
                                          emoji: 'assets/icons/formkit_sad.svg',
                                          text: 'Sad',
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        activity(
                                          acts: 'assets/icons/Frame 33.svg',
                                          text: 'Meals',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: white,
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
                                            padding: const EdgeInsets.only(
                                                top: 15, left: 15, right: 15, bottom: 30),
                                            child: Column(
                                              children: [
                                                order(
                                                    time: 'Time',
                                                    header1: 'Meal',
                                                    header2: 'Quantity'),
                                                Table(
                                                  children: buildMealReports(value.mealReports),
                                                ),
                                                // details(
                                                //     time: '10:38am',
                                                //     info: 'Cereal',
                                                //     info2: 'All'),
                                                // details(
                                                //     time: '12:40pm',
                                                //     info: 'Rice',
                                                //     info2: 'All'),
                                                // details(
                                                //     time: '02:50pm',
                                                //     info: 'Snack & Juice',
                                                //     info2: 'All'),
                                                // details(
                                                //     time: '04:00pm',
                                                //     info: 'Juice',
                                                //     info2: 'All'),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        activity(
                                          acts: 'assets/icons/Frame 32.svg',
                                          text: 'Nap Time',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: white,
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
                                            padding: EdgeInsets.only(
                                                top: 15, left: 15, right: 15, bottom: 30),
                                            child: Column(
                                              children: [
                                                order(
                                                    time: 'Time',
                                                    header1: 'Wake up Time',
                                                    header2: 'Comments'),
                                                Table(
                                                  children: [
                                                    details(
                                                        time: '01:35pm',
                                                        info: '02:30pm',
                                                        info2: '-'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        activity(
                                          acts: 'assets/icons/Frame 32-1.svg',
                                          text: 'Diaper Time',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: white,
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
                                            padding: EdgeInsets.only(
                                                top: 15, left: 15, right: 15, bottom: 30),
                                            child: Column(
                                              children: [
                                                order(
                                                    time: 'Time',
                                                    header1: 'Diaper',
                                                    header2: 'Potty'),
                                                Table(
                                                  children: buildDiaperReports(value.diaperReports),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: transparent,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: primaryColor01,
                                                  style: BorderStyle.solid)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
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
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: primaryColor01),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  // ...diaperReports.map((report) {
  // return ListTile(
  // title: Text('Diaper Condition: ${report.diaperCondition}'),
  // subtitle: Text('Potty: ${report.potty} at ${report.formattedLocalTime}'),
  // );
  // }).toList(),


  buildMealReports(List<MealReport> mealReports) {
    return mealReports.map((report) {
      return details(time: report.formattedTime, info: report.mealName, info2: report.quantity);
    }).toList();
  }

  buildDiaperReports(List<DiaperReport> diaperReports) {
    return diaperReports.map((report) {
      return details(time: report.formattedLocalTime, info: report.diaperCondition, info2: report.potty);
    }).toList();
  }


  TableRow details({
    required String time,
    required String info,
    required String info2,
  }) {
    return TableRow(
      children: [
        _buildCell(time),
        _buildCell(info),
        _buildCell(info2),
      ],
    );
  }

  Widget _buildCell(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }


  Row activity({required String acts, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(
          acts,
          semanticsLabel: 'My SVG Image',
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.w600, color: black),
        ),
      ],
    );
  }

  Container order(
      {required String time,
      required String header1,
      required String header2}) {
    return Container(
      // height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightest,
      ),
      child: Table(
        children: [
          TableRow(children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  header1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  header2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  // Container details(
  //     {required String time, required String info, required String info2}) {
  //   return Container(
  //     height: 50,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           color: black,
  //         ),
  //       ),
  //     ),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 15,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           time,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //         // Expanded(
  //         //   child: SizedBox(
  //         //     width: 15.0,
  //         //   ),
  //         // ),
  //         Text(
  //           info,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //         // Expanded(
  //         //   child: SizedBox(
  //         //     width: 15.0,
  //         //   ),
  //         // ),
  //         Text(
  //           info2,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  moods({required bool mood, required String emoji, required String text}) {
    return IntrinsicWidth(
      child: Container(
        height: 50,
        // width: mood ? 150 : 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: mood ? lightish : transparent,
            border: Border.all(
                width: 1.0,
                color: mood ? primaryColor01 : black,
                style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                emoji,
                semanticsLabel: 'My SVG Image',
                height: 23,
                width: 23,
                color: mood ? primaryColor01 : black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mood ? primaryColor01 : black),
              ),
              Visibility(
                visible: mood,
                child: Expanded(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
              ),
              Visibility(
                visible: mood,
                child: Icon(
                  Icons.check_circle,
                  size: 22,
                  color: primaryColor01,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  childSelector({required bool active, required String name,  required String id}) {

    return Container(
      height: 70,
      width: 120,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: active ? primaryColor01 : black,
        width: active ? 3.0 : 1.0,
      ))),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: active ? primaryColor01 : black
          ),
        ),
      ),
    );
  }

}
