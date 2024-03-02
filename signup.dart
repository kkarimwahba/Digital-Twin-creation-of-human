import 'package:digi2/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController phonenumbercontroller = TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 13, 53),
        // appBar: AppBar(
        //   title: const Text(
        //     "EVENA",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   backgroundColor: Colors.black,
        // ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(0, 22, 13, 53),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 150.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.58,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: usernamecontroller,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusColor: Colors.black,
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: InkWell(
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: phonenumbercontroller,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Phone No.',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (value.length != 11) {
                                return 'Phone number should be 11 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 0.8 * MediaQuery.of(context).size.width,
                          height: 0.13 * MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              // if (_formKey.currentState!.validate()) {
                              //   User? user1 =
                              //       await registerWithEmailAndPassword(
                              //           emailController.text.trim(),
                              //           passwordController.text.trim(),
                              //           usernamecontroller.text.trim(),
                              //           phonenumbercontroller.text.trim());
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (c) {
                              //       return LoginPage();
                              //     },
                              //   ));
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent[700],
                            ),
                            child: const Text(
                              'Signup',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) {
                                return Login();
                              },
                            ));
                          },
                          child: const Text(
                            'If you dont have an account? Log in here!',
                            style:
                                TextStyle(fontSize: 12.25, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '-----------------------------',
                              style: TextStyle(color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Text(
                              '-----------------------------',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white, // Text color
                              ),
                              child: const Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/googlelogo.png'),
                                    size: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Google'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white, // Text color
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.apple,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text('iOS'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
