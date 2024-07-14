import 'package:aqardy/utils/label_with_input.dart';
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

  int currentPage = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    bool height = MediaQuery.of(context).size.height > 800;

    handlechangePage() {
      if (currentPage == 1 && !height) {
        setState(() {
          currentPage = currentPage + 1;
        });
      } else {
        setState(() {
          currentPage = currentPage + 1;
        });
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
          controller: enterpriseNameController,
          label: "Username",
          hintText: "",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          controller: enterpriseNameController,
          label: "Enterprise Name",
          hintText: "",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          controller: enterpriseEmailController,
          label: "Enterprise Email ID",
          hintText: "example@gmail.com",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          controller: enterprisePhoneController,
          label: "Enterprise Phone Number",
          hintText: "",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          controller: passwordController,
          label: "Password",
          showReq: true,
          hintText: "minimum 8 characters",
          obscureText: true),
      LabelWithInput(
          controller: confirmPasswordController,
          label: "Confirm Password",
          hintText: "",
          showReq: false,
          obscureText: true),
      LabelWithInput(
          controller: alternateEnterprisePhoneController,
          label: "Alternate Enterprise Phone Number",
          hintText: "",
          showReq: false,
          obscureText: false),
      LabelWithInput(
          controller: loginPinController,
          label: "Login Pin",
          showReq: false,
          hintText: "minimum 4 characters",
          obscureText: true),
      LabelWithInput(
          controller: confirmLoginPinController,
          label: "Confirm Login Pin",
          hintText: "",
          showReq: false,
          obscureText: true),
      LabelWithInput(
          controller: addressController,
          label: "Address",
          hintText: "",
          showReq: false,
          obscureText: false),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: LabelWithInput(
                controller: districtController,
                label: "District",
                hintText: "",
                showReq: false,
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
                hintText: "",
                showReq: false,
                obscureText: false),
          ),
        ],
      ),
      LabelWithInput(
          controller: stateController,
          label: "State",
          showReq: false,
          hintText: "",
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
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
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
                    Text("Login")
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
