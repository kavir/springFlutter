import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/features/Authentication/Screen/registerScreen.dart';
import 'package:spring_roll_flutter/BottomNavigation/bottomNavigation.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';
import 'package:spring_roll_flutter/Utils/loadingIndicator.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    ref.listen(loginProvider, (prev, next) {
      next.maybeWhen(
        orElse: () {
          print("orelse ma gayo___________");
        },
        loading: (loading) {
          if (loading!) {
            print("loading ma gayo___________");
            CustomLoadingIndicator().show(context);
          } else {
            CustomLoadingIndicator().hide();
          }
        },
        success: (data) {
          print("sucess ma gayo___________");
          ToastUtils().showSuccessToast(context, data!.message);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationMenu(),
            ),
          );
        },
        generalError: (e) {
          print("error ma gayo___________$e");
          print("Error iuoiuy______________: ${e}");
          ToastUtils().showErrorToast(context, e??"Something went wrong");
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
        backgroundColor:AppColors.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Welcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _numberController,
                        style: const TextStyle(color:AppColors.primary,),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color:AppColors.primary,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color:AppColors.primary,),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: AppColors.primary,),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: AppColors.primary,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.primary,),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Login',
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to the registration screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterScreen(), // The screen you want to navigate to
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Logging in...');
      print('number: ${_numberController.text}');
      print('Password: ${_passwordController.text}');
      ref
          .read(loginProvider.notifier)
          .login(_numberController.text, _passwordController.text);
    }
  }
}
