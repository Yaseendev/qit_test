import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';
import '../utils/locator.dart';
import '../utils/providers.dart';
import '../utils/services/network_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '', _password = '';
  final _passwordVisibleProvider = StateProvider<bool>((ref) => true);
  bool showLockIcon = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loginbttnEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ScopedReader watch, child) {
          final passwordVisible = watch(_passwordVisibleProvider);
          final networkHelper = watch(networkServiceProvider);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 60.sp,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Please login to your account.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) => _email = value.trim(),
                      validator: (value) {
                        return GetUtils.isEmail(value!)
                            ? null
                            : 'Please enter a valid email address';
                      },
                    ),
                    SizedBox(height: 2.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        suffixIcon: showLockIcon
                            ? Icon(Icons.lock_outline_rounded)
                            : passwordVisible.state
                                ? IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () => context
                                        .read(_passwordVisibleProvider)
                                        .state = false,
                                  )
                                : IconButton(
                                    onPressed: () => context
                                        .read(_passwordVisibleProvider)
                                        .state = true,
                                    icon: Icon(Icons.visibility_off)),
                      ),
                      onChanged: (pass) {
                        if (pass.isEmpty) {
                          setState(() {
                            showLockIcon = true;
                          });
                        } else {
                          setState(() {
                            showLockIcon = false;
                          });
                        }
                        _password = pass;
                      },
                      obscureText: passwordVisible.state,
                    ),
                    SizedBox(height: 4.h),
                    ElevatedButton(
                      child: loginbttnEnabled
                          ? const Text('LOGIN',
                              style: TextStyle(color: Colors.white))
                          : CircularProgressIndicator(),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF1A1A1A)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          )),
                          alignment: Alignment.center,
                          minimumSize: MaterialStateProperty.all(Size(
                            double.infinity,
                            15.w,
                          ))),
                      onPressed: loginbttnEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                loginUser(networkHelper);
                              }
                              // showDialog(
                              //     context: context,
                              //     barrierDismissible: true,
                              //     builder: (BuildContext context) =>
                              //         AlertDialog(
                              //           title: Text('Login failed'),
                              //           content: Text(
                              //               'Email or password is incorrect'),
                              //           actions: [
                              //             TextButton(
                              //                 onPressed: () =>
                              //                     Navigator.of(context).pop(),
                              //                 child: Text('Done'))
                              //           ],
                              //         ));
                              // setState(() {
                              //   loginbttnEnabled = true;
                              // });
                            }
                          : null,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 18),
                      child: Text(
                        'or login with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            child: SvgPicture.asset('assets/icons/google.svg',
                                semanticsLabel: 'Google logo'),
                            backgroundColor:
                                ThemeData.light().scaffoldBackgroundColor,
                          ),
                          backgroundColor: Colors.grey,
                          radius: 20.5,
                        ),
                        SizedBox(width: 25),
                        CircleAvatar(
                          child: CircleAvatar(
                            child: SvgPicture.asset('assets/icons/facebook.svg',
                                semanticsLabel: 'Facebook logo'),
                            backgroundColor:
                                ThemeData.light().scaffoldBackgroundColor,
                          ),
                          backgroundColor: Colors.grey,
                          radius: 20.5,
                        ),
                        SizedBox(width: 25),
                        CircleAvatar(
                          child: CircleAvatar(
                            child: SvgPicture.asset('assets/icons/twitter.svg',
                                semanticsLabel: 'Twitter logo'),
                            backgroundColor:
                                ThemeData.light().scaffoldBackgroundColor,
                          ),
                          backgroundColor: Colors.grey,
                          radius: 20.5,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Create new now!',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By signing up, you are agree with our',
                              style: TextStyle(
                                fontSize: 9.7.sp,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 9.7.sp,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void loginUser(
    NetworkService networkHelper,
  ) async {
    setState(() {
      loginbttnEnabled = false;
    });
    await networkHelper.loginUser(_email, _password).then((value) {
      print(value);
      if (value!['data'] != null) {
        locator.get<FluroRouter>().navigateTo(context, '/products',
            replace: true, transition: TransitionType.fadeIn);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value['message']),
        ));
      }
    }).onError((error, stackTrace) {
      print('Error' + NetworkService.getErrorMessage(error));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(NetworkService.getErrorMessage(error)),
      ));
    });
    setState(() {
      loginbttnEnabled = true;
    });
  }
}
