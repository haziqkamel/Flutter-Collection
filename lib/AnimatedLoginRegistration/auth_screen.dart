import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/constants.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/widgets/login_form.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/widgets/signup_form.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isSignIn = true;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: defaultDuration,
    );

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isSignIn = !_isSignIn;
      print("_isSignIn? = $_isSignIn");
    });
    _isSignIn ? _animationController.reverse() : _animationController.forward();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //provide screen height and width
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                // Login Form
                AnimatedPositioned(
                  duration: defaultDuration,
                  // 88% width for login
                  width: _size.width * 0.88, //88%
                  height: _size.height,
                  left: _isSignIn
                      ? 0
                      : -_size.width * 0.76, //left 0% from 88% width else 76%

                  child: Container(
                    color: login_bg,
                    child: LoginForm(),
                  ),
                ),

                // SignUp Form
                AnimatedPositioned(
                  duration: defaultDuration,
                  height: _size.height,
                  width: _size.width * 0.88,
                  left: _isSignIn
                      ? _size.width *
                          0.88 // signIn true? so its 88% away from left
                      : _size.width * 0.12,
                  child: Container(
                    color: signup_bg,
                    child: SignUpForm(),
                  ),
                ),

                // add logo
                AnimatedPositioned(
                  duration: defaultDuration,
                  top: _size.height * 0.1, //10%
                  left: 0,
                  right: _isSignIn ? _size.width * 0.09 : -_size.width * 0.09,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: AnimatedSwitcher(
                      duration: defaultDuration,
                      child: _isSignIn
                          ? SvgPicture.asset(
                              "assets/animation_logo.svg",
                              color: login_bg,
                            )
                          : SvgPicture.asset(
                              "assets/animation_logo.svg",
                              color: signup_bg,
                            ),
                    ),
                  ),
                ),
                // social button
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _size.height * 0.1, //10%
                  width: _size.width,
                  right: _isSignIn ? _size.width * 0.06 : -_size.width * 0.06,
                  child: SocialButton(),
                ),

                //Login Text
                // Login Text Animation
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom:
                      _isSignIn ? _size.height * 0.4 : _size.height / 2 - 80,
                  // 88% / 2 = 44% of login 88% width
                  // -80 as width of container is 160 so 160/2
                  left: _isSignIn ? _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _isSignIn ? 23 : 18,
                      fontWeight: FontWeight.bold,
                      color: _isSignIn ? Colors.white70 : Colors.white,
                    ),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: _isSignIn
                            ? () {
                                print("should sign in into the app");
                                // sign in
                              }
                            : updateView,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding * 0.75,
                          ),
                          width: 160,
                          // color: Colors.red,
                          child: Text(
                            "Login".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // SignUp Text
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom:
                      !_isSignIn ? _size.height * 0.4 : _size.height / 2 - 80,
                  // 88% / 2 = 44% of login 88% width
                  // -80 as width of container is 160 so 160/2
                  right: _isSignIn ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: !_isSignIn ? 23 : 18,
                      fontWeight: FontWeight.bold,
                      color: !_isSignIn ? Colors.white70 : Colors.white,
                    ),
                    child: Transform.rotate(
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: !_isSignIn
                            ? () {
                                print("should sign up and navigate to sign in");
                                //sign up
                                setState(() {
                                  updateView();
                                });
                              }
                            : updateView,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding * 0.75,
                          ),
                          width: 160,
                          // color: Colors.red,
                          child: Text(
                            "Sign me Up!".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
