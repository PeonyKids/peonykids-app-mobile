// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../Styles/colors.dart';
// import '../../Widgets/widgets.dart';
// import '../../stateManagement/providers.dart';
//
// class otp extends StatefulWidget {
//   const otp({super.key});
//
//   @override
//   State<otp> createState() => _otpState();
// }
//
// class _otpState extends State<otp> {
//   final List<TextEditingController> _controllers =
//   List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
//
//   Color getBorderColor(FocusNode node) {
//     return node.hasFocus ? primaryColor01 : Color(0xff737373);
//   }
//
//   double getBorderWidth(FocusNode node) {
//     return node.hasFocus ? 4 : 2;
//   }
//
//   InputDecoration getInputDecoration(FocusNode node) {
//     return InputDecoration(
//       counterText: '',
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: getBorderColor(node), width: getBorderWidth(node)),
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: getBorderColor(node), width: getBorderWidth(node)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<MainState>(
//         builder: (context, value, child) {
//           // value.LoggingIn(false);
//           return SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20),
//                   Text(
//                     'We sent an OTP',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 21,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'An OTP was sent to ${value.emailController}, please enter the code you found there',
//                     style: TextStyle(
//                       color: Color(0xff737373),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: List.generate(6, (index) {
//                       return SizedBox(
//                         width: 50,
//                         child: TextField(
//                           controller: _controllers[index],
//                           focusNode: _focusNodes[index],
//                           maxLength: 1,
//                           textAlign: TextAlign.center, // Center the text
//                           onTap: () => setState(() {}),
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 5) {
//                               FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
//                             } else if (value.isEmpty && index > 0) {
//                               _controllers[index].clear();
//                               FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
//                             }
//                           },
//                           decoration: getInputDecoration(_focusNodes[index]),
//                           keyboardType: TextInputType.number,
//                         ),
//                       );
//                     }),
//                   ),
//                   SizedBox(height: 30),
//                   Text(value.statusVerifyPhone, style: TextStyle(color: Colors.red)),
//                   SizedBox(height: 35),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: GestureDetector(
//                       onTap: () => value.resendLoginOTP(context),
//                       child: Text(
//                         "Didn't receive an email? Resend Email",
//                         style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   shadowButton(
//                     onTap: () {
//                       value.verifyPhone = _controllers.map((c) => c.text.trim()).join();
//                       value.verifyOtp(context);
//                     },
//                     text: value.OtpCheckState ? 'Continue...' : 'Continue',
//                       color: value.OtpCheckState ? primaryColor01.withOpacity(0.5): primaryColor01
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Text(
//                       'Back',
//                       style: TextStyle(
//                         color: primaryColor01,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // For clipboard monitoring

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';
import '../../stateManagement/providers.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  String? _clipboardOtp;

  @override
  void initState() {
    super.initState();
    // Add listeners to the focus nodes to check for clipboard content
    _focusNodes.forEach((focusNode) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          // When the user focuses on an OTP input, check the clipboard
          checkClipboardForOtp();
        }
      });
    });
  }

  Color getBorderColor(FocusNode node) {
    return node.hasFocus ? primaryColor01 : Color(0xff737373); // Use a defined color
  }

  double getBorderWidth(FocusNode node) {
    return node.hasFocus ? 4 : 2;
  }

  InputDecoration getInputDecoration(FocusNode node) {
    return InputDecoration(
      counterText: '',
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: getBorderColor(node), width: getBorderWidth(node)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: getBorderColor(node), width: getBorderWidth(node)),
      ),
    );
  }

  // Check the clipboard for a valid OTP
  void checkClipboardForOtp() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null && data.text!.length == 6) {
      // Assuming OTP is 6 digits
      setState(() {
        _clipboardOtp = data.text;
        fillOtpAutomatically(_clipboardOtp!);
      });
    }
  }

  // Fill OTP fields programmatically
  void fillOtpAutomatically(String otp) {
    for (int i = 0; i < otp.length; i++) {
      _controllers[i].text = otp[i];
    }
    FocusScope.of(context).unfocus(); // Unfocus all fields after autofill
  }

  @override
  void dispose() {
    // Dispose of the focus nodes
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Close keyboard on tap outside
      child: Scaffold(
        body: Consumer<MainState>(
          builder: (context, value, child) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'We sent an OTP',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'An OTP was sent to ${value.Gmail}, please enter the code you found there',
                      style: const TextStyle(
                        color: Color(0xff737373), // Use color from your styles
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 50,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            onTap: () => setState(() {}),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 5) {
                                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                              } else if (value.isEmpty && index > 0) {
                                _controllers[index].clear();
                                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                              }
                            },
                            decoration: getInputDecoration(_focusNodes[index]),
                            keyboardType: TextInputType.number,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    // Text(
                    //   value.statusVerifyPhone,
                    //   style: const TextStyle(color: Colors.red),
                    // ),
                    // const SizedBox(height: 35),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => value.resendLoginOTP(context),
                        child: const Text(
                          "Didn't receive an email? Resend Email",
                          style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    shadowButton(
                      onTap: value.OtpCheckState
                          ? () {
                        null;
                      } : () {
                        value.verifyPhone = _controllers.map((c) => c.text.trim()).join();
                        // value.verifyOtp(context);
                        value.verifyingEmail(context);
                      },
                      text: value.OtpCheckState ? 'Continue...' : 'Continue',
                      color: value.OtpCheckState
                          ? primaryColor01.withOpacity(0.5)
                          : primaryColor01,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: primaryColor01,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



