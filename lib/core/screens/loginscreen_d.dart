import 'package:flutter/material.dart';

bool selected = false;
late TextEditingController phnum;

class LoginScreenD extends StatefulWidget {
  final bool choice; // true for doctor, false for patient

  const LoginScreenD({Key? key, required this.choice}) : super(key: key);

  @override
  _LoginScreenDState createState() => _LoginScreenDState();
}

class _LoginScreenDState extends State<LoginScreenD> {
  final _controllerd1 = TextEditingController();
  final _controllerd2 = TextEditingController();
  final _controllerDrID = TextEditingController();
  bool newAccount = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/gradient.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  if (selected == true) selected = false;
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTapCancel: () {
                  if (selected == true) selected = false;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 330),
                  curve: Curves.linear,
                  width: double.infinity,
                  height: selected ? screenHeight * 0.9 : screenHeight * 0.68,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            "ادخل رقم الهاتف",
                            style: TextStyle(
                              color: Color.fromRGBO(117, 121, 122, 1),
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            "سيتم استخدام الرقم لتسجيل الدخول",
                            style: TextStyle(
                              color: Color.fromRGBO(134, 138, 139, 1),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  '+20',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Color.fromRGBO(117, 121, 122, 1),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 50.0),
                                  child: TextField(
                                    style: const TextStyle(fontSize: 22),
                                    onTap:
                                        () => setState(() {
                                          selected = true;
                                        }),
                                    onEditingComplete:
                                        () => setState(() {
                                          selected = false;
                                          FocusScope.of(
                                            context,
                                          ).requestFocus(FocusNode());
                                        }),
                                    controller: _controllerd1,
                                    decoration: const InputDecoration(
                                      isCollapsed: true,
                                      hintText: "7XXXXXXXX",
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(
                                          117,
                                          121,
                                          122,
                                          .27,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                            189,
                                            208,
                                            201,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    maxLength: 9,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        newAccount == false
                            ? const Padding(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20),
                              child: Text(
                                "ادخل الرمز المميز للطبيب ",
                                style: TextStyle(
                                  color: Color.fromRGBO(117, 121, 122, 1),
                                  fontSize: 22,
                                ),
                              ),
                            )
                            : Container(),
                        newAccount == false
                            ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 150.0,
                              ),
                              child: TextField(
                                style: const TextStyle(fontSize: 22),
                                onTap:
                                    () => setState(() {
                                      selected = true;
                                    }),
                                onEditingComplete:
                                    () => setState(() {
                                      selected = false;
                                      FocusScope.of(
                                        context,
                                      ).requestFocus(FocusNode());
                                    }),
                                controller: _controllerDrID,
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  hintText: "ABC00",
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(117, 121, 122, .27),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(189, 208, 201, 1),
                                    ),
                                  ),
                                ),
                                maxLength: 5,
                                keyboardType: TextInputType.text,
                              ),
                            )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    newAccount = true;
                                  });
                                },
                                child: const Text("انشاء حساب جديد "),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    newAccount = false;
                                  });
                                },
                                child: const Text("لدي حساب قديم "),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(
                                189,
                                208,
                                201,
                                1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              minimumSize: const Size(274, 41),
                            ),
                            onPressed: () {
                              String phoneNumber = _controllerd1.text.trim();
                              if (phoneNumber.length == 9) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'تم تسجيل الدخول بنجاح',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder:
                                      (BuildContext context) => AlertDialog(
                                        title: const Text('خطأ'),
                                        content: const Text(
                                          'الرقم قصير، الرجاء إعادة إدخال الرقم',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(
                                                  context,
                                                  'حسناً',
                                                ),
                                            child: const Text('حسناً'),
                                          ),
                                        ],
                                      ),
                                );
                              }
                            },
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust for spacing
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
