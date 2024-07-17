import "package:flutter/material.dart";

class LabelWithInput extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final bool showReq;
  final bool errorFound;
  final String errorMsg;
  final TextEditingController controller;
  const LabelWithInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.showReq,
      required this.errorFound,
      required this.obscureText,
      required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorFound ? errorMsg : null,
            suffixIcon: obscureText ? const Icon(Icons.visibility) : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey, width: .2)),
          ),
          obscureText: obscureText,
        ),
        controller.text.isNotEmpty
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
                                margin: const EdgeInsets.only(top: 8),
                                height: 8,
                                color: const Color.fromARGB(255, 56, 255, 159),
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
                                margin: const EdgeInsets.only(top: 8),
                                height: 8,
                                color: const Color.fromARGB(255, 56, 255, 159),
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
                                margin: const EdgeInsets.only(top: 8),
                                color: const Color.fromARGB(255, 56, 255, 159),
                                height: 8,
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
                                margin: const EdgeInsets.only(top: 8),
                                color: const Color.fromARGB(255, 56, 255, 159),
                                height: 8,
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
