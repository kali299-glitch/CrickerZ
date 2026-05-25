import 'package:crickerz/pages/cricket_profile.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController dobController = TextEditingController();

  bool isLoading = false;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // DATE PICKER
  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime(2000),

      firstDate: DateTime(1950),

      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  // SIGNUP FUNCTION
  Future<void> signupUser() async {
    String userName = userNameController.text.trim();

    String mobile = mobileController.text.trim();

    String city = cityController.text.trim();

    String email = emailController.text.trim();

    String password = passwordController.text.trim();

    String confirmPassword = confirmPasswordController.text.trim();

    String dob = dobController.text.trim();

    // VALIDATIONS

    if (userName.isEmpty) {
      showMessage("Enter user name");
      return;
    }

    if (mobile.length != 10) {
      showMessage("Enter valid mobile number");
      return;
    }

    if (city.isEmpty) {
      showMessage("Enter city name");
      return;
    }

    if (email.isNotEmpty && !email.contains("@")) {
      showMessage("Enter valid email");
      return;
    }

    if (password.length < 6) {
      showMessage("Password must contain at least 6 characters");

      return;
    }

    if (password != confirmPassword) {
      showMessage("Passwords do not match");
      return;
    }

    if (dob.isEmpty) {
      showMessage("Select date of birth");
      return;
    }

    setState(() {
      isLoading = true;
    });

    // API CALL SIMULATION
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    showMessage("Account Created Successfully");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CricketProfilePage()),
    );
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
              const SizedBox(height: 20),

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

              const SizedBox(height: 35),

              // TITLE
              const Text(
                "Create Account 🏏",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Join Cricerz and build your cricket profile",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 35),

              // USER NAME
              buildLabel("User Name"),

              buildTextField(
                controller: userNameController,
                hint: "Enter user name",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              // MOBILE NUMBER
              buildLabel("Mobile Number"),

              Container(
                decoration: boxDecoration(),

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

              const SizedBox(height: 20),

              // CITY
              buildLabel("City"),

              buildTextField(
                controller: cityController,
                hint: "Enter city name",
                icon: Icons.location_city_outlined,
              ),

              const SizedBox(height: 20),

              // EMAIL
              buildLabel("Email ID (Optional)"),

              buildTextField(
                controller: emailController,
                hint: "Enter email address",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // DATE OF BIRTH
              buildLabel("Date of Birth"),

              GestureDetector(
                onTap: pickDate,

                child: AbsorbPointer(
                  child: buildTextField(
                    controller: dobController,
                    hint: "Select date of birth",
                    icon: Icons.calendar_month_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // PASSWORD
              buildLabel("Password"),

              buildPasswordField(
                controller: passwordController,
                hint: "Enter password",
                visible: isPasswordVisible,

                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),

              const SizedBox(height: 20),

              // CONFIRM PASSWORD
              buildLabel("Confirm Password"),

              buildPasswordField(
                controller: confirmPasswordController,

                hint: "Confirm password",

                visible: isConfirmPasswordVisible,

                onTap: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),

              const SizedBox(height: 35),

              // SIGNUP BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: isLoading ? null : signupUser,

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
                          "Create Account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 25),

              // LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),

                  TextButton(
                    onPressed: () {},

                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

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

  // LABEL
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  // NORMAL TEXT FIELD
  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,

    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: boxDecoration(),

      child: TextField(
        controller: controller,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          prefixIcon: Icon(icon),

          hintText: hint,
        ),
      ),
    );
  }

  // PASSWORD FIELD
  Widget buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool visible,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: boxDecoration(),

      child: TextField(
        controller: controller,
        obscureText: !visible,

        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          prefixIcon: const Icon(Icons.lock_outline),

          hintText: hint,

          suffixIcon: IconButton(
            onPressed: onTap,

            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  // COMMON BOX DECORATION
  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(18),

      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8),
      ],
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
        backgroundColor: const Color(0xff1565C0),

        title: const Text("Cricerz"),
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
