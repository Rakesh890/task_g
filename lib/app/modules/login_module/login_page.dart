import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/routes/app_pages.dart';
import '../../services/ValidationService.dart';
import '../../theme/app_text_theme.dart';
import 'login_controller.dart';


class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: SafeArea(
        child: Obx(
            () => Container(
            child:(controller.isShowLoader.value == false) ? Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        //Email widget
                        Container(
                          margin:
                              EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            controller: controller.emailControoler,
                            validator: (val) => validateEmail(val!),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintStyle: inputStyle,
                                labelText: 'Email',
                                counterText: ""),
                            maxLength: 50,
                          ),
                        ),

                        //Password widget
                        Container(
                          margin:
                              EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                              controller: controller.passwordController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              obscureText: controller.passwordVisible.value,
                              validator: (val) => validatePassword(val!),
                              keyboardType: TextInputType.text,
                            maxLength: 20,
                              decoration: new InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintStyle: inputStyle,
                                  labelText: 'Password',
                                  counterText: "",

                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        //Login Button
                        RaisedButton(
                            onPressed: () => controller.loginButton(),
                            color: Colors.blue,
                            elevation: 0,
                            child: Text(
                              "Login",
                              style: loginBtnStyle,
                            )),

                        TextButton(
                          onPressed: () => Get.toNamed(Routes.REGISTER),
                          child: Text("Create New Account"),
                        )
                      ],
                    ),
                  ):Center(child: CircularProgressIndicator(),)
          ),
        ),
      ),
    );
  }
}
