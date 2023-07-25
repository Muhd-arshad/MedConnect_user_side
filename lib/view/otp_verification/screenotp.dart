import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:user_side_flutter/services/otp_verification.dart';
import 'package:user_side_flutter/view/login_page/loginpage.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/padding.dart';
import '../../utils/constants/sizedbox.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';
 TextEditingController otpPinput = TextEditingController();
class ScreenOtpPage extends StatelessWidget {
  const ScreenOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: cwhite),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
   
    return Scaffold(
      body: PrimaryWidget(
        widget: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: horizontal10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height50,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Image(
                      image: AssetImage('assets/images/OTP 1.png'),
                    ),
                  ),
                  const TextWidget(
                    text: 'E-mail Verification',
                    size: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  height10,
                  const TextWidget(
                    text: 'We have send a code to your mail',
                    fontWeight: FontWeight.bold,
                    colorText: Colors.grey,
                  ),
                  height30,
                  Pinput(
                    validator: (value) {
                     if(value?.length!= 6 || value == null  ){
                      return 'please Enter the  6-digit otp';
                     }else{
                      return null;
                     }
                    },
                    controller: otpPinput,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    
                   
                  ),
                  height30,
                  ButtonWidget(
                    text: 'Verify',
                    onPressed: () async{
                     bool status= await otpInput(otpPinput.text ,context);
                      if(status == true){
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      }
                     
                    },
                    height: 50,
                    width: 140,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
