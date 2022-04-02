import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/modules/register_module/register_controller.dart';
import '../../routes/app_pages.dart';
import '../../services/ValidationService.dart';
import '../../theme/app_text_theme.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Container(
        child: Obx(
          () => Form(
            key: controller.registerFormKey,
            child:(controller.isShowloader.value == false) ? ListView(
              children: [
                //Full Name widget
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: controller.fullNameContoller,
                    validator: (val) => validateName(val!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
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
                        labelText: 'Full Name',
                        counterText: ""),
                    maxLength: 50,
                  ),
                ),
                //Email widget
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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
                  margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.passwordVisible.value,
                      validator: (val) => validatePassword(val!),
                      keyboardType: TextInputType.text,
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
                          suffixIcon: TextButton(
                            child: Text(
                              // Based on passwordVisible state choose the icon
                              !controller.passwordVisible.value ? "Show" : "Hide",
                              // color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () => controller.showPassword(),
                          )),
                      maxLength: 20,
                    ),
                  ),
                ),


                SizedBox(
                  height: 50,
                ),
                //Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RaisedButton(onPressed: () => controller.registerBtn(),
                      color: Colors.blue,
                      elevation: 0,
                      child: Text("Register",style: loginBtnStyle,)),
                ),

                TextButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                  child: Text("Have an Account? Login"),
                )
              ],
            ):Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }


}
