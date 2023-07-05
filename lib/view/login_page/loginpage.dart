
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/user_login_contoller.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/padding.dart';
import '../../utils/constants/sizedbox.dart';
import '../home_screen/screen_home.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';
import '../widgets/textformwidget.dart';
import '../sign_up_page/screen_sign_up.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PrimaryWidget(
          widget: Padding(
            padding: horizontal10,
            child: Form(
              key: Provider.of<UserloginProvider>(context).formGlobalKey,
              child: Consumer<UserloginProvider>(
                builder: (context, loginprovider,child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                          colorText: cBlack,
                          fontWeight: FontWeight.bold,
                          size: 40,
                          text: 'Welcome Back'),
                      const TextWidget(
                        // padding: 20,
                        text: 'Login into your Account',
                        fontWeight: FontWeight.bold,
                        size: 20,
                      ),
                      height50,
                      TextformFeildWidget(
                          controller: loginprovider.emailcontroller, labelText: 'Enter your Email'),
                      height30,
                      TextformFeildWidget(
                          controller: loginprovider.passwordcontroller,
                          labelText: 'Enter Your Password'),
                      height50,
                      ButtonWidget(text: 'Login',height: 60,width:250, onPressed: () async{
                       bool status= await loginprovider.userLogin(context);
                         if(status == true){
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenHome(),
                                ),
                              );
                         }
                       
                      },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(text: 'Do not have any account?',),
                          TextButton(onPressed: (){
                           
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  const ScreenSignUp(),),);
                          }, child:const TextWidget(text: 'Sign Up' , colorText: btcolor,))
                        ],
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
