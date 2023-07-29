
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/user_signup_controller.dart';
import 'package:user_side_flutter/view/otp_verification/screenotp.dart';
import '../../utils/constants/sizedbox.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';
import '../widgets/textformwidget.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
          widget: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Consumer<Usercontroller>(
                builder: (context, signupProvider, child) {
              return Form(
                key: signupProvider.formGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height20,
                    const TextWidget(
                      text: 'Welcome',
                      size: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    const TextWidget(
                      text: 'sign up for the app',
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    height20,
                    TextformFeildWidget(
                      controller: signupProvider.firstnamecontroller,
                      labelText: 'FirstName',
                      type: TextInputType.text,
                    ),
                    height15,
                    TextformFeildWidget(
                      controller: signupProvider.secondnamecontroller,
                      labelText: 'SecondName',
                      type: TextInputType.text,
                    ),
                    height15,
                    TextformFeildWidget(
                      controller: signupProvider.phonenumbercontroller,
                      labelText: 'PhoneNumber',
                      type: TextInputType.number,
                    ),
                    height15,
                    TextformFeildWidget(
                      controller: signupProvider.emailcontroller,
                      labelText: 'Email',
                      type: TextInputType.emailAddress,
                    ),
                    height15,
                    TextformFeildWidget(
                        controller: signupProvider.passwordcontroller,
                        labelText: 'Password'),
                    height15,
                    TextformFeildWidget(
                        controller: signupProvider.confirmpasswordcontroller,
                        labelText: 'Confirm Password'),
                    height20,
                    signupProvider.isloading == true ? const Center(child:  CircularProgressIndicator()):
                    ButtonWidget(
                        text: 'Sign Up',
                        onPressed: () async { 
                          signupProvider.isloading = true;
                          bool status =
                              await signupProvider.userSignup(context);
                        
                          if (status == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenOtpPage(),
                              ),
                            );
                          }
                        },
                        height: 50,
                        width: 150)
                  ],
                ),
              );
            }),
          ),
        ),
      )),
    );
  }
}
