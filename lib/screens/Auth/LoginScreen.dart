import 'package:irone/screens/Auth/SignupScreen.dart';
import 'package:irone/screens/Dashboard/index.dart';
import 'package:irone/services/auth.dart';
import 'package:irone/widgets/atoms/Button.dart';
import 'package:irone/widgets/atoms/Input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  redirect() {
    // check if user has updated his profile for redirection

    Navigator.pushNamed(
      context,
      Dashlayout.routeName,
    );
  }

  loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    try {
      final provider = Provider.of<GoogleSignInProvider>(
        context,
        listen: false,
      );

      await provider.googleLogin(() => {
            setState(() {
              isLoading = false;
            }),
            redirect(),
          });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 114, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 52, vertical: 14),
                            color: const Color(0xffF9F6F4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Welcome back",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Log In to continue",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Form(
                            key: _formKey,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 43),
                              child: Column(
                                children: [
                                  Input(
                                    text: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    textController: emailController,
                                    validator: (val) {
                                      return RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(val!)
                                          ? null
                                          : "Please provide a valid Email";
                                    },
                                  ),
                                  const SizedBox(height: 29),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                    controller: passwordController,
                                    validator: (value) => value!.length < 6
                                        ? 'Password should be 6+ chars long'
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 36),
                          Button(
                            buttonText: 'Log In',
                            buttonClick: () => loginWithGoogle(),
                          ),
                          const SizedBox(height: 14),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, SignupScreen.routeName),
                            child: Text(
                              "create an Account",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
