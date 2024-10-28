import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../Models/childData.dart';
import '../../Styles/colors.dart';
import '../../stateManagement/providers.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

List<Map<String, dynamic>> items = [];

class _CheckInState extends State<CheckIn> {

  @override
  void initState() {
    super.initState();

    _initializeData();
  }


  Future<void> _initializeData() async {
    final childDataProvider = Provider.of<MainState>(context, listen: false);
    // Create an instance of DataHandler
    Children childDataHandler = Children(childDataProvider.childDetails);

    setState(() {
      items = childDataHandler.getProcessedData();
    });

    childDataProvider.generateQRCode();
  }

  @override
  Widget build(BuildContext context) {
    final childDataProvider = Provider.of<MainState>(context, listen: false);
    bool checkedIn = false;

    List<Widget> children = [];
    List<Widget> childs = [];

    for (int i = 0; i < items.length; i++) {
      children.add(
        checkIn(
          name: items[i]['firstName'],
          id: items[i]['id'],
        ),
      );
      childs.add(
        groupCheckIn(
          name: items[i]['firstName'],
          id: items[i]['id'],
          isChecked: checkedIn
        ),
      );
    }


    // Function to start QR code scanning
    Future<void> scanQRScanner() async {
      final String? scannedQRCode = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QRScannerScreen()), // Push to QR Scanner screen
      );

      print('This is the scanned QR-Code :- $scannedQRCode');

      if (scannedQRCode != null) {
        // Call checkIn method with scanned QR code
        childDataProvider.multipleCheckIn(scannedQRCode: scannedQRCode);
      }
    }

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Check In',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, left: 15.w, right: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Please select the child you want to check in. You will be required to scan the QR provided.',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: black),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: children,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              // height: 12,
              color: white03,
              thickness: 1.0,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 20), // Adjust padding
                          backgroundColor: white,
                          title: Text(
                            'Group Check In',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          content: Text('Choose the child you want to check in.'),
                          actions: <Widget>[
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: grey2,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Select all',
                                  ),
                                  Checkbox(value: checkedIn,
                                      onChanged: (value) {
                                    setState(() {
                                      checkedIn = !checkedIn; // Update the local isChecked state

                                    });
                                    print(checkedIn);
                                  },
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: childs,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                scanQRScanner();
                              },
                              child: Container(
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: primaryColor01),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Text(
                                      'Check In',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: white),
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
                                          color: black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: black02.withOpacity(0.1), // Shadow color
                        offset: Offset(0.0, 7.0), // Offset from right
                        blurRadius: 8, // Spread of the shadow
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Group check in',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tap to check in multiple kids at once',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: black),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                          color: primaryColor02,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

   groupCheckIn({required String name, required String id, required bool isChecked}) {
    return Consumer<MainState>(
      builder: (context, kvalue, child) {
        // Fetch check-in status from server
        // value.fetchAndSetCheckInStatus(id);
        // bool isChecked = false;
        // bool isChecked = value.getCheckInStatus(id);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: grey2,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: black),
                                    ),
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (check) {
                                        setState(() {
                                          isChecked = !isChecked; // Update the local isChecked state
                                        });
                                        isChecked == true ? kvalue.checkInChildren.add(id): kvalue.checkInChildren.remove(id);
                                      },
                                    )
                                  ],
                                ),
                              );
          }
        );
        });}

  checkIn({required String name,  required String id}) {
    final childDataProvider = Provider.of<MainState>(context, listen: false);

    // bool checkStatus = childDataProvider.getCheckInStatus(childId: id);

    Future<bool> _fetchCheckInStatus() async {
      return await childDataProvider.getCheckInStatus(childId: id);
    }

    // Function to start QR code scanning
    Future<void> _startQRScanner() async {
      final String? scannedQRCode = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QRScannerScreen()), // Push to QR Scanner screen
      );

      print('This is the scanned QR-Code :- $scannedQRCode');

      if (scannedQRCode != null) {
        // Call checkIn method with scanned QR code
        childDataProvider.checkIn(
          scannedQRCode: scannedQRCode,
          childId: id,
        );
      }
    }

    return FutureBuilder<bool>(
      future: _fetchCheckInStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(); // Show loading indicator while fetching data
        } else if (snapshot.hasData && snapshot.data == true) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: black02.withOpacity(0.1), // Shadow color
                    offset: Offset(0.0, 7.0), // Offset from right
                    blurRadius: 8, // Spread of the shadow
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tap to check in $name',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                      ],
                    ),
                    // checkStatus ? Icon(
                    //   Icons.check_circle,
                    //   size: 30,
                    //   color: primaryColor01,
                    // ) : Icon(
                    //   Icons.qr_code_scanner,
                    //   size: 30,
                    //   color: primaryColor02,
                    // ),
                    Icon(
                      Icons.check_circle,
                      size: 30,
                      color: primaryColor01, // Adjusted color for checked-in status
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: (){
              print('I was Pressed');
              // childDataProvider.checkIn(
              //     scannedQRCode: "",
              //     childId: idiVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAACZElEQVR4Xu2ZO5KEMAxERRFMOEfwUTgaPhpH4QiEBBRadcswLLXBhFvVKFiw9digSz97zL+xxe47f9qD3ezBbvbfscVgL5/5WGxwPmz0jZ5ODiuhzAZ/pWOIlb19GrvtBdEEsclyp7qv73nw3Q4M8sli81DpiEDq/VwJY6FUCGbFK3WLCJLFvGVWPNfIrArdEuNDDkOBjWpbMpeuD3rksGaovVRqGlF7o+J0F58aZsyluvcrHvmRd+hJbaWEcSfeZxuZUpOh1MRq75F19Yw3Gayw6FKiVCo/MhSe8tFNBotG7HwNa7r19HPKHQ7dhDCGzgsxY8isaWQldm+bkhj+oug6c8mYWblJ08NgJUowdcM018IKZUgPa5lVwu/EmGAMJPyLWwIqYLwQgL/VGKbUhNZ0zSwhDN15jcDhJIsHV0d06WEQzA7/G+1n461SqghTw2C5k6c+S3+jT91UsKWddWIHWBYePHBnYFxpYWEVuYS2zCOPRwTlGZBhJYehvkbttZLjikE+DvrIrIu8Uhj78TTioiS7EFbHphrGXMorI8e4knPKzJYN3eQwlBpWW85voNmawn8ekbUwGM6/DB3kUkU8UTDWH02MuiF0WGNwiYK7FLYmOQwxA//MzArFxviO9QcmiDXDGbDJx8zKwe13IGlg2Gk3Rxjj/BAMQx035bB4bb9nHd35k1IsyHJYvEIiHAWz/eRHUK9cphoxzOfMpSg1ewxu0A3ffjJLDnNGEFY8ChoFK+evFUoYMwtY9qQRjvDn8MIE08KQQQYMhz8rmOYMtTfvkc5AksG+sAe72YPdTAj7AZwLKKljzDlBAAAAAElFTkSuQmCC
              // );

              _startQRScanner(); // Trigger QR scanner on tap
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: black02.withOpacity(0.1), // Shadow color
                      offset: Offset(0.0, 7.0), // Offset from right
                      blurRadius: 8, // Spread of the shadow
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Tap to check in $name',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: black),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: primaryColor02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}




// class QRScannerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Scan QR Code')),
//       // body: MobileScanner(
//       //   onDetect: (capture) {
//       //     final List<Barcode> barcodes = capture.barcodes;
//       //     if (barcodes.isNotEmpty) {
//       //       String? scannedQRCode = barcodes.first.rawValue;
//       //       if (scannedQRCode != null) {
//       //         print('Scanned QR Code: $scannedQRCode');
//       //         Navigator.pop(context, scannedQRCode); // Return scanned QR code to previous screen
//       //       }
//       //     }
//       //   },
//       // ),
//     );
//   }
// }


class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code')),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300, // Adjust the size of the QR scanner overlay
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Scanned: ${result!.code}')
                  : Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Navigator.pop(context, result!.code); // Return scanned QR code

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
