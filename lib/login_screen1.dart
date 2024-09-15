// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobilenoController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 59, 58, 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: CircleAvatar(
                  radius: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 63, 60, 70),
                      radius: 46,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Go ahead and set up your account',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Sign in-up to enjoy the best managing experience',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    // Custom TabBar
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 200, 200, 200),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TabBar(
                        indicatorColor: Colors.transparent,
                        controller: tabController,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 40, color: Colors.white),
                          insets: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: "Login"),
                          Tab(text: "Register"),
                        ],
                      ),
                    ),

                    // Use Expanded in TabBarView
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          // Login Form
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: loginEmailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'E-mail ID',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: loginPasswordController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Password',
                                  ),
                                  obscureText: true,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue, width: 2),
                                          color: isChecked
                                              ? Colors.blue
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: isChecked
                                            ? Icon(Icons.check,
                                                size: 15, color: Colors.white)
                                            : null,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: 350,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      String email = loginEmailController.text;
                                      String password =
                                          loginPasswordController.text;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                            email: email,
                                            password: password,
                                            name: '',
                                            mobileno: '',
                                            confirmpassword: '',
                                          ),
                                        ),
                                      );

                                      // Perform login action
                                      print(
                                          "Login with Email: $email, Password: $password");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Or login with',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset('assets/google.svg'),
                                          SizedBox(width: 8),
                                          Text('Google')
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset('assets/apple.svg'),
                                          SizedBox(width: 8),
                                          Text('Apple')
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Register Form
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, right: 15, left: 15),
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_2,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Name',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextField(
                                    controller: mobilenoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Mobile no.',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextField(
                                    controller: registerEmailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Email',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextField(
                                    controller: registerPasswordController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Password',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    controller: confirmpasswordController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Confirm Password',
                                    ),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: 350,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        String name = nameController.text;
                                        String mobileno =
                                            mobilenoController.text;
                                        String email =
                                            registerEmailController.text;
                                        String password =
                                            registerPasswordController.text;
                                        String confirmpassword =
                                            confirmpasswordController.text;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                name: name,
                                                mobileno: mobileno,
                                                email: email,
                                                password: password,
                                                confirmpassword:
                                                    confirmpassword),
                                          ),
                                        );

                                        // Perform register action
                                        print(
                                            "Register with Email: $email, Password: $password");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void main() {
    runApp(const MaterialApp(
      home: AuthScreen(),
    ));
  }
}
