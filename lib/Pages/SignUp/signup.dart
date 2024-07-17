import 'dart:math';

import 'package:aqardy/utils/label_with_input.dart';
import 'package:aqardy/utils/label_with_password.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController enterpriseNameController = TextEditingController();
  TextEditingController enterpriseEmailController = TextEditingController();
  TextEditingController enterprisePhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController alternateEnterprisePhoneController =
      TextEditingController();
  TextEditingController loginPinController = TextEditingController();
  TextEditingController confirmLoginPinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool usernameError = false;
  bool enterpriseNameError = false;
  bool enterpriseEmailError = false;
  bool enterprisePhoneError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;
  bool alternateEnterprisePhoneError = false;
  bool loginPinError = false;
  bool confirmLoginPinError = false;
  bool addressError = false;
  bool districtError = false;
  bool pincodeError = false;
  bool stateError = false;
  String errorMsg = "This field is required";

  int currentPage = 0;
  bool changed = false;

  bool numberPassword = false;
  bool upperCasePassowrd = false;
  bool lowerCasePassword = false;
  bool symbolPassword = false;

  bool viewPassword = true;
  bool viewConfirmPassword = true;

  PageController pageController = PageController(
    initialPage: 0,
  );

  handleChange(val) {
    if (val == "Password") {
      setState(() {
        viewPassword = !viewPassword;
      });
    } else {
      setState(() {
        viewConfirmPassword = !viewConfirmPassword;
      });
    }
  }

  handlePasswordChange() {
    setState(() {
      changed = true;
    });

    if (passwordController.text.isEmpty) {
      setState(() {
        changed = false;
      });
    }

    if (passwordController.text.contains(RegExp(r'[0-9]'))) {
      setState(() {
        numberPassword = true;
      });
    }

    if (passwordController.text.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        upperCasePassowrd = true;
      });
    }

    if (passwordController.text.contains(RegExp(r'[a-z]'))) {
      setState(() {
        lowerCasePassword = true;
      });
    }

    if (passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        symbolPassword = true;
      });
    }
  }

  handleLoginPin() {
    if (loginPinController.text != confirmLoginPinController.text) {
      setState(() {
        confirmPasswordError = true;
      });
      return;
    } else {
      setState(() {
        confirmPasswordError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool height = MediaQuery.of(context).size.height > 800;

    handlechangePage() {
      if (currentPage == 0) {
        if (usernameController.text.isEmpty) {
          setState(() {
            usernameError = true;
          });
          return;
        } else {
          setState(() {
            usernameError = false;
          });
        }

        if (enterpriseNameController.text.isEmpty) {
          setState(() {
            enterpriseNameError = true;
          });
          return;
        } else {
          setState(() {
            enterpriseNameError = false;
          });
        }

        if (enterpriseEmailController.text.isEmpty) {
          setState(() {
            enterpriseEmailError = true;
          });
          return;
        } else {
          setState(() {
            enterpriseEmailError = false;
          });
        }

        if (enterprisePhoneController.text.isEmpty) {
          setState(() {
            enterprisePhoneError = true;
          });
          return;
        } else {
          setState(() {
            enterprisePhoneError = false;
          });
        }

        if (passwordController.text.length < 8 ||
            !numberPassword ||
            !upperCasePassowrd ||
            !lowerCasePassword ||
            !symbolPassword) {
          setState(() {
            passwordError = true;
            errorMsg = "Password must contain atleast 8 characters";
          });
          return;
        } else {
          setState(() {
            passwordError = false;
          });
        }

        if (height) {
          if (confirmPasswordController.text.isEmpty ||
              confirmPasswordController.text != passwordController.text) {
            setState(() {
              confirmPasswordError = true;
              errorMsg = "Password does not match";
            });
            return;
          } else {
            setState(() {
              confirmPasswordError = false;
            });
          }
        }

        setState(() {
          currentPage = 1;
        });
      } else {
        if (!height) {
          if (confirmPasswordController.text.isEmpty ||
              confirmPasswordController.text != passwordController.text) {
            setState(() {
              confirmPasswordError = true;
              errorMsg = "Password does not match";
            });
            return;
          } else {
            setState(() {
              confirmPasswordError = false;
            });
          }
        }

        if (alternateEnterprisePhoneController.text.isEmpty) {
          setState(() {
            alternateEnterprisePhoneError = true;
            errorMsg = "This field is required";
          });
          return;
        } else {
          setState(() {
            alternateEnterprisePhoneError = false;
          });
        }

        if (loginPinController.text.length < 4) {
          setState(() {
            loginPinError = true;
            errorMsg = "Minimum 4 characters";
          });
          return;
        } else {
          setState(() {
            loginPinError = false;
          });
        }

        if (confirmLoginPinController.text.isEmpty ||
            confirmLoginPinController.text != loginPinController.text) {
          setState(() {
            confirmLoginPinError = true;
            errorMsg = "Pin does not match";
          });
          return;
        } else {
          setState(() {
            confirmLoginPinError = false;
          });
        }

        if (addressController.text.isEmpty) {
          setState(() {
            addressError = true;
            errorMsg = "This field is required";
          });
          return;
        } else {
          setState(() {
            addressError = false;
          });
        }

        if (districtController.text.isEmpty) {
          setState(() {
            districtError = true;
          });
          return;
        } else {
          setState(() {
            districtError = false;
          });
        }

        if (pincodeController.text.isEmpty) {
          setState(() {
            pincodeError = true;
          });
          return;
        } else {
          setState(() {
            pincodeError = false;
          });
        }

        if (stateController.text.isEmpty) {
          setState(() {
            stateError = true;
          });
          return;
        } else {
          setState(() {
            stateError = false;
          });
        }

        //FORM SUBMITTED
      }

      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 50), curve: Curves.easeIn);
    }

    handlePageView(int page) {
      setState(() {
        currentPage = page;
      });
    }

    List<Widget> listIT = [
      LabelWithInput(
          controller: usernameController,
          label: "Username",
          errorMsg: errorMsg,
          hintText: "",
          errorFound: usernameError,
          showReq: false,
          obscureText: false),
      LabelWithInput(
          errorMsg: errorMsg,
          controller: enterpriseNameController,
          label: "Enterprise Name",
          hintText: "",
          errorFound: enterpriseNameError,
          showReq: false,
          obscureText: false),
      LabelWithInput(
          errorMsg: errorMsg,
          controller: enterpriseEmailController,
          label: "Enterprise Email ID",
          hintText: "example@gmail.com",
          showReq: false,
          errorFound: enterpriseEmailError,
          obscureText: false),
      LabelWithInput(
          controller: enterprisePhoneController,
          errorMsg: errorMsg,
          label: "Enterprise Phone Number",
          hintText: "",
          showReq: false,
          errorFound: enterprisePhoneError,
          obscureText: false),
      LabelWithPassword(
          errorFound: passwordError,
          controller: passwordController,
          label: "Password",
          showReq: true,
          onChanged: handlePasswordChange,
          onClick: handleChange,
          errorMsg: errorMsg,
          passwordReq: changed,
          numberPassword: numberPassword,
          upperCasePassowrd: upperCasePassowrd,
          lowerCasePassword: lowerCasePassword,
          symbolPassword: symbolPassword,
          hintText: "minimum 8 characters",
          obscureText: viewPassword),
      LabelWithPassword(
          errorFound: confirmPasswordError,
          controller: confirmPasswordController,
          label: "Confirm Password",
          errorMsg: errorMsg,
          showReq: false,
          onChanged: () => print("dummy"),
          onClick: handleChange,
          passwordReq: changed,
          numberPassword: numberPassword,
          upperCasePassowrd: upperCasePassowrd,
          lowerCasePassword: lowerCasePassword,
          symbolPassword: symbolPassword,
          // onClick: handleChange,
          hintText: "",
          obscureText: viewConfirmPassword),
      LabelWithInput(
          errorMsg: errorMsg,
          errorFound: alternateEnterprisePhoneError,
          controller: alternateEnterprisePhoneController,
          label: "Alternate Enterprise Phone Number",
          hintText: "",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          errorFound: loginPinError,
          controller: loginPinController,
          label: "Login Pin",
          hintText: "minimum 4 characters",
          showReq: false,
          errorMsg: errorMsg,
          obscureText: false),
      LabelWithInput(
          controller: confirmLoginPinController,
          label: "Confirm Login Pin",
          hintText: "",
          showReq: false,
          errorFound: confirmLoginPinError,
          errorMsg: errorMsg,
          obscureText: false),
      LabelWithInput(
          controller: addressController,
          label: "Address",
          hintText: "",
          errorMsg: errorMsg,
          showReq: false,
          errorFound: addressError,
          obscureText: false),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: LabelWithInput(
                errorMsg: errorMsg,
                controller: districtController,
                label: "District",
                hintText: "",
                showReq: false,
                errorFound: districtError,
                obscureText: false),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            flex: 1,
            child: LabelWithInput(
                controller: pincodeController,
                label: "Pincode",
                errorMsg: errorMsg,
                hintText: "",
                showReq: false,
                errorFound: pincodeError,
                obscureText: false),
          ),
        ],
      ),
      LabelWithInput(
          controller: stateController,
          label: "State",
          errorMsg: errorMsg,
          showReq: false,
          hintText: "",
          errorFound: stateError,
          obscureText: false),
    ];

    handlePage<Widget>(String title, count, set) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(padding: EdgeInsets.only(top: 20)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 20,
                        decoration: BoxDecoration(
                          color: currentPage == 0
                              ? Colors.black
                              : Colors.purple[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 4,
                        width: 20,
                        decoration: BoxDecoration(
                          color: currentPage == 1
                              ? Colors.black
                              : Colors.purple[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      height
                          ? const SizedBox(width: 0)
                          : Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 4,
                              width: 20,
                              decoration: BoxDecoration(
                                color: currentPage == 2
                                    ? Colors.black
                                    : Colors.purple[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                      // }
                    ],
                  ),
                ),
                const Text("Enterprise Sign Up",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: set == 1 || set == 2
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.start,
                      children: [
                        for (var i = set == 1
                                ? 0
                                : set == 2
                                    ? height
                                        ? 6
                                        : 5
                                    : 10;
                            i < count && i < listIT.length;
                            i++)
                          listIT[i],
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                GestureDetector(
                  onTap: handlechangePage,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.purple[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      currentPage == 0
                          ? "Continue"
                          : currentPage == 1
                              ? height
                                  ? "Sign Up"
                                  : "Continue"
                              : "Sign Up",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 4),
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          ),
        ),
      );
    }

    List<Widget> pages = [
      handlePage("Enterprise Sign Up", height ? 6 : 5, 1),
      handlePage("Enterprise Sign Up", height ? 12 : 10, 2),
    ];

    if (!height) {
      pages.add(handlePage("Enterprise Sign Up", 12, 3));
    }

    return Scaffold(
        body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: handlePageView,
      controller: pageController,
      children: pages,
    ));
  }
}
