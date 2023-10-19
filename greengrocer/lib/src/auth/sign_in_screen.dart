import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            // Container
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name of app
                  const Text.rich(TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: "Green",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: "Groocer",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText("Frutas"),
                          FadeAnimatedText("Verduras"),
                          FadeAnimatedText("Legumes"),
                          FadeAnimatedText("Carnes"),
                          FadeAnimatedText("Cereais"),
                          FadeAnimatedText("Laticíneos"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Forms login and create an account
            // Container of initial screen, forms, buttons and etc..
            Container(
              // Padding
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),

              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Column(
                  // This crossAxis says that all children of this column must be stretched so they are the same size, in the same width as the text fields
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                    ),
                    // Passw
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "Senha",
                      isSecret: true,
                    ),
                    // Button enter
                   // (){} <- anonymous function (size box allows you to define the button's height, etc.)
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        )),
                      ),
                    ),
                    // Forgot passw 
                    // It was wrapped inside the "Align" widget (control.) because otherwise it will inherit the button stretching characteristics and we want this on the right
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

                    /// DIVISOR
                    // By placing the "or" in the middle of the divider line, the divider was surrounded by an "expanded" widget (control.)
                    // Row was padded because the create account button was too close
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              //.grey.withAlpha(90) makes the color lighter
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          // The divider was wrapped by a padding(control.) to be able to put the space between the lines --- Or ---
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Ou"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Button new user
                    // Edge button "OutlineButton", was wrapped in the sizebox to increase the height
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            // Increase the edge
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            )),
                        onPressed: () {},
                        child: const Text(
                          "Criar conta",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
