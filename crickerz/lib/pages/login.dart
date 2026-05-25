import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  // DEMO LOGIN
  // CHANGE THIS LATER USING DATABASE/API
  final String correctMobile = "9876543210";
  final String correctPassword = "cricerz123";

  Future<void> loginUser() async {
    String mobile = mobileController.text.trim();
    String password = passwordController.text.trim();

    // MOBILE VALIDATION
    if (mobile.isEmpty || mobile.length != 10) {
      showMessage("Enter valid mobile number");
      return;
    }

    // PASSWORD VALIDATION
    if (password.isEmpty) {
      showMessage("Enter password");
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // CHECK LOGIN
    if (mobile == correctMobile && password == correctPassword) {
      showMessage("Login Successful");

      // NAVIGATE TO HOME PAGE
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      showMessage("Invalid mobile number or password");
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 40),

              // LOGO
              Center(
                child: Container(
                  height: 110,
                  width: 110,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.sports_cricket,
                    size: 55,
                    color: Color(0xff1565C0),
                  ),
                ),
              ),

              const SizedBox(height: 45),

              // TITLE
              const Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Login to continue to Cricerz",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 40),

              // MOBILE LABEL
              const Text(
                "Mobile Number",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),

              const SizedBox(height: 10),

              // MOBILE FIELD
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,

                  decoration: InputDecoration(
                    border: InputBorder.none,

                    contentPadding: const EdgeInsets.symmetric(vertical: 20),

                    prefixIcon: Container(
                      width: 80,
                      alignment: Alignment.center,

                      child: const Text(
                        "+91",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    hintText: "Enter mobile number",
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // PASSWORD LABEL
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),

              const SizedBox(height: 10),

              // PASSWORD FIELD
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,

                  decoration: InputDecoration(
                    border: InputBorder.none,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),

                    hintText: "Enter password",

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },

                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: isLoading ? null : loginUser,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1565C0),

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,

                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 35),

              // SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },

                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // TERMS
              Center(
                child: Text(
                  "By continuing you agree to our\nTerms & Privacy Policy",
                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cricerz"),
        backgroundColor: const Color(0xff1565C0),
      ),

      body: const Center(
        child: Text(
          "Welcome to Cricerz 🏏",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
