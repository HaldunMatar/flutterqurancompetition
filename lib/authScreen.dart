import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurancompetition/main.dart';
import 'package:qurancompetition/provider.dart';
import 'package:qurancompetition/thems.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Prinarycolor, secondrycolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/Asset-300.png',
                    width: 200,
                    height: 200,
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),

                      // ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appbarcolor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'مسابقة القرآن الكريم ',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'اسم المستحدم': '',
    'كلمة السر': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    // _heightAnimation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    try {
      _formKey.currentState?.save();
      if (_authData['email'] == 'admin' && _authData['password'] == '789') {
        context.read<providerdata>().userId = 10;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      } else if (_authData['email'] == 'level0' &&
          _authData['password'] == '123') {
        context.read<providerdata>().userId = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      } else if (_authData['email'] == 'level1' &&
          _authData['password'] == '121') {
        context.read<providerdata>().userId = 1;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      } else if (_authData['email'] == 'level2' &&
          _authData['password'] == '131') {
        context.read<providerdata>().userId = 2;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      } else if (_authData['email'] == 'level3' &&
          _authData['password'] == '141') {
        context.read<providerdata>().userId = 3;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      }

      if (_authData['email'] == 'level4' && _authData['password'] == '151') {
        context.read<providerdata>().userId = 4;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'مسابقة القرآن الكريم ')),
        );
        //  MyHomePage(title: 'مسابقة القرآن الكريم ');
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: _authMode == AuthMode.Signup ? 320 : 260,
        // height: _heightAnimation.value.height,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'اسم المستخدم'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'كلمة السر'),
                  obscureText: true,
                  controller: _passwordController,
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                    maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: TextFormField(
                        enabled: _authMode == AuthMode.Signup,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup
                            ? (value) {
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match!';
                                }
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child: Text(_authMode == AuthMode.Login
                        ? 'تسجيل الدخول'
                        : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: Theme.of(context).primaryColor,
                    //  textColor: Theme.of(context).primaryTextTheme.button.color,
                  ),
                /*  FlatButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'تسجيل الدخول'} INSTEAD'),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
