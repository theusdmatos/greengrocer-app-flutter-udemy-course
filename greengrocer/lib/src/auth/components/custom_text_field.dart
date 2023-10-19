import 'package:flutter/material.dart';
// This class was stateless, but we changed it because of the button to see the password, we had to change it to statefull (class 6)
// Instead of creating the TextFormField several times, I created the components folder, the custom_text_field file and then I create a component and call it
class CustomTextField extends StatefulWidget {

// It was created to be able to pass variables into the method to be used X times
  final IconData icon;
  final String label;
  
  final bool isSecret;

// Constructor
 const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
  // By default it is false, then I only call it when I actually want to pass true, this way I don't need to keep passing the parameters
    this.isSecret = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  
  // Hide password variable
  bool isObscure = false; 

  // Method that starts even before the Widget is displayed on the screen, in this case the text field forms
  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
     // Spacing between buttons of 15
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscure,
        // Decorating the field by adding line to close and add border
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon:  widget.isSecret ? IconButton(
              onPressed: (){
              setState(() {
                 isObscure = !isObscure;
              });
              }, 
              icon:  Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            ): null,
            labelText: widget.label,
            // Internal field spacing using isDense
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
