import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';

class CheckInvoice extends StatefulWidget {
  const CheckInvoice({Key? key}) : super(key: key);

  @override
  State<CheckInvoice> createState() => _CheckInvoiceState();
}

class _CheckInvoiceState extends State<CheckInvoice> {
  List<String> countryCode = [
    'A day',
    'One week (5% Discount)',
    'Two week (7% Discount)',
    'One Month (10% Discount)',
    'Three Months (15% Discount)'
    // Add more countries and codes as needed
  ];

  String code = 'One week (5% Discount)';

  Row androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String song in countryCode) {
      var newItem = DropdownMenuItem(
        value: song,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    song,
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.5,
                    ),
                  ),
                  if (code == song)
                    Icon(
                      Icons.check_circle,
                      color: primaryColor01,
                      size: 28,
                    ),
                ],
              ),
            ),
            Divider(
              // height: 12,
              color: grey,
              thickness: 1.0,
            ),
          ],
        ),
      );
      dropdownItems.add(newItem);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: code,
                elevation: 8,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 40,
                  color: black,
                ),
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w400, color: black),
                items: dropdownItems,
                onChanged: (value) {
                  setState(() {
                    code = value.toString();
                  });
                },
                borderRadius: BorderRadius.circular(15),
                dropdownColor: white,
                underline: Divider(
                  color: black,
                  thickness: 2.0,
                ),
                itemHeight: 60.0,
                iconSize: 30,
                selectedItemBuilder: (BuildContext context) {
                  return dropdownItems
                      .map<Widget>((DropdownMenuItem<String> item) {
                    return Row(
                      children: [
                        Text(
                          item.value!,
                          style: TextStyle(
                            color: black03,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

// List<DropdownMenuItem<String>> getDropdownCurrency() {
//
// }

  CupertinoPicker iOSPicker() {
    List<Widget> cupertinoDropdown = [];
    for (String song in countryCode) {
      Widget countryCodeList = Text(song);
      cupertinoDropdown.add(countryCodeList);
    }
    return CupertinoPicker(
        // IOS Selection
        backgroundColor: Colors.lightBlue,
        magnification: 1.0,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            code = countryCode[selectedIndex].toString();
          });
        },
        children: cupertinoDropdown);
  }

  Widget getPicker() {
    if (!kIsWeb && Platform.isIOS) {
      return iOSPicker();
    } else {
      return androidDropdown();
    }
  }

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
          'View Invoice',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: black01.withOpacity(0.1), // Shadow color
                      offset: Offset(0.0, 7.0), // Offset from right
                      blurRadius: 8, // Spread of the shadow
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        color: lightest,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: black),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    deets(num: '1', item: 'School Fees', amount: '₦8,000/day'),
                    deets(
                        num: '2', item: 'Daily Feedings', amount: '₦2,000/day'),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Duration',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, color: black),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 62,
                width: double.infinity,
                // padding: const EdgeInsets.symmetric(
                //     vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: grey2, width: 2.0, style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: getPicker(),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: lightest,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: primaryColor01,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'Kindly note that payment is not refundable',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: primaryColor01),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: black03),
                  ),
                  Text(
                    '₦100,000',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              reuseButton(onTap: () {}, text: 'Proceed to payment')
            ],
          ),
        ),
      ),
    );
  }
}

Container deets(
    {required String num, required String item, required String amount}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(color: white),
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: num,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: black03),
            children: [
              WidgetSpan(
                child: SizedBox(
                  width: 10.w,
                ),
              ),
              TextSpan(
                text: item,
                style: TextStyle(
                    fontSize: 18.5, fontWeight: FontWeight.w500, color: black),
              )
            ],
          ),
        ),
        Text(
          amount,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: black),
        ),
      ],
    ),
  );
}
