import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class LabelWithPassword extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final bool showReq;
  final bool passwordReq;
  final bool numberPassword;
  final bool upperCasePassowrd;
  final bool lowerCasePassword;
  final bool symbolPassword;
  final bool errorFound;
  final Function onChanged;
  final String errorMsg;
  final Function(String val) onClick;
  final TextEditingController controller;
  const LabelWithPassword(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.showReq,
      required this.onChanged,
      required this.obscureText,
      required this.passwordReq,
      required this.numberPassword,
      required this.upperCasePassowrd,
      required this.lowerCasePassword,
      required this.symbolPassword,
      required this.onClick,
      required this.errorFound,
      required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        Container(
          // alignment: Alignment.center,
          // height: 60,
          // width: double.infinity,
          child: TextField(
            controller: controller,
            onChanged: (e) => onChanged(),
            decoration: InputDecoration(
                hintText: hintText,
                errorText: errorFound ? errorMsg : null,
                suffixIcon: obscureText
                    ? GestureDetector(
                        onTap: () => WidgetsBinding.instance
                            .addPostFrameCallback((_) => onClick(
                                label)), // Schedule state change after build
                        child: const Icon(Icons.visibility_off))
                    : GestureDetector(
                        onTap: () => WidgetsBinding.instance
                            .addPostFrameCallback((_) => onClick(
                                label)), // Schedule state change after build
                        child: const Icon(Icons.visibility)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: .2))),
            obscureText: obscureText,
          ),
        ),
        passwordReq
            ? showReq
                ? Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 5,
                                color: upperCasePassowrd
                                    ? const Color.fromARGB(255, 56, 255, 159)
                                    : Colors.red,
                              ),
                              const FittedBox(
                                child: Text(
                                  "1 Uppercase",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(width: 8),
                      Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 5,
                                color: lowerCasePassword
                                    ? const Color.fromARGB(255, 56, 255, 159)
                                    : Colors.red,
                              ),
                              const FittedBox(
                                child: Text(
                                  "1 lowercase",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(width: 8),
                      Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                color: symbolPassword
                                    ? const Color.fromARGB(255, 56, 255, 159)
                                    : Colors.red,
                                height: 5,
                              ),
                              const FittedBox(
                                child: Text(
                                  "1 symbol",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(width: 8),
                      Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                color: numberPassword
                                    ? const Color.fromARGB(255, 56, 255, 159)
                                    : Colors.red,
                                height: 5,
                              ),
                              const FittedBox(
                                child: Text(
                                  "1 number",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )),
                    ],
                  )
                : const SizedBox()
            : const SizedBox()
      ],
    );
  }
}
