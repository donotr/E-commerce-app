import 'package:e_commerce/screens/login/Screen_Login.dart';
import 'package:flutter/material.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenSignUp> {
  final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  FocusNode fieldUsername = FocusNode();
  FocusNode fieldEmail = FocusNode();
  FocusNode fieldPassword = FocusNode();
  FocusNode buttonFocus = FocusNode();
  final TextEditingController _usernamefieldController =
      TextEditingController();
  final TextEditingController _passwordfieldController =
      TextEditingController();
  final TextEditingController _emailfieldController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _usernamefieldController.clear();
      _passwordfieldController.clear();
      _emailfieldController.clear();
      _formKey.currentState!.deactivate();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Great!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 50,
            color: Color.fromARGB(255, 225, 190, 231),
          ),
          onPressed: () {},
        ),
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Sign Up",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 0.0, right: 50.0, left: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textForm(
                  "Username",
                  const Color.fromARGB(255, 141, 140, 140),
                  16.0,
                  "Ingrese su Username",
                  const Color.fromARGB(255, 121, 120, 120),
                  context,
                  icon: const Icon(Icons.person,
                      color: Color.fromARGB(216, 107, 45, 117)),
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                  filled: true,
                  colorsFill: const Color.fromARGB(255, 248, 237, 250),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No puede dejar este campo vacio";
                    }
                    return null;
                  },
                  focusNode: fieldUsername,
                  textEditingController: _usernamefieldController,
                  onfieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(fieldEmail);
                  }),
              const SizedBox(
                height: 16.0,
              ),
              textForm(
                  "Email",
                  const Color.fromARGB(255, 148, 131, 131),
                  16.0,
                  "Ingrese su Email",
                  const Color.fromARGB(255, 158, 158, 158),
                  context,
                  icon: const Icon(Icons.email,
                      color: Color.fromARGB(216, 107, 45, 117)),
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                  filled: true,
                  colorsFill: const Color.fromARGB(255, 248, 237, 250),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No puede dejar este campo vacio";
                    }
                    return null;
                  },
                  focusNode: fieldEmail,
                  textEditingController: _emailfieldController,
                  onfieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(fieldPassword);
                  }),
              const SizedBox(
                height: 16.0,
              ),
              textForm("Password", const Color.fromARGB(255, 141, 140, 140),
                  16.0, "Ingrese su Password", Colors.grey, context,
                  icon: const Icon(Icons.lock,
                      color: Color.fromARGB(216, 107, 45, 117)),
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                  filled: true,
                  colorsFill: const Color.fromARGB(255, 248, 237, 250),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No puede dejar este campo vacio";
                    }
                    if (value.length < 8) {
                      return "Contraseña debe ser mayor a 8 digitos";
                    }

                    return null;
                  },
                  suffixInkwell: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(216, 107, 45, 117)),
                  ),
                  isPassword: passToggle,
                  focusNode: fieldPassword,
                  textAction: TextInputAction.done,
                  textEditingController: _passwordfieldController,
                  onfieldSubmitted: (value) {
                    _submit();
                  }),
              const SizedBox(height: 40.0),
              ElevatedButton(
                  focusNode: buttonFocus,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280.0, 50.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  onPressed: () {
                    _submit();
                  },
                  child: const Text("Sign Up")),
              const SizedBox(
                height: 16.0,
              ),
              const Text(" Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenLogin()));
                },
                child: const Text("Log In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextFormField textForm(
  String labelText,
  Color colorsLabel,
  double fontSize,
  String hint,
  Color colorsHint,
  BuildContext context, {
  Icon? icon,
  FontStyle fontStyle = FontStyle.normal,
  BorderSide borderSide = const BorderSide(color: Colors.black),
  BorderRadius borderRadius = BorderRadius.zero,
  bool filled = false,
  Color colorsFill = Colors.white,
  bool isPassword = false,
  TextInputType textInputType = TextInputType.text,
  String? Function(String?)? validator,
  void Function(String)? onfieldSubmitted,
  TextInputAction? textAction,
  InkWell? suffixInkwell,
  FocusNode? focusNode,
  TextEditingController? textEditingController,
}) {
  return TextFormField(
    obscureText: isPassword,
    validator: validator,
    keyboardType: textInputType,
    focusNode: focusNode,
    controller: textEditingController,
    textInputAction: textAction,
    onFieldSubmitted: onfieldSubmitted,
    decoration: InputDecoration(
      suffix: suffixInkwell,
      prefixIcon: icon,
      labelText: labelText,
      labelStyle: TextStyle(
        color: colorsLabel,
        fontSize: fontSize,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      filled: filled,
      fillColor: colorsFill,
    ),
  );
}