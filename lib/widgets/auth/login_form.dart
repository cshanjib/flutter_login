import 'package:flutter/material.dart';
import 'package:login1/constants/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: CustomPaint(
              foregroundPainter: DemoPainter(),
              size: const Size(double.infinity, 200),
              // painter: DemoPainter(),
              // child: const SizedBox(
              //   width: double.infinity,
              //   height: 200,
              // ),
            ),
          ),
          // const CustomClips(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const TextField(
                      decoration: InputDecoration(
                          // labelText: "hell",
                          // isDense: true,
                          hintText: "Username",
                          prefixIcon: Icon(
                            Icons.person,
                            color: ThemeColorDarkest,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ThemeColorDarkest),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ThemeColorDarkest, width: 2),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )))),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                          // labelText: "hell",
                          // isDense: true,
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.key,
                            color: ThemeColorDarkest,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ThemeColorDarkest),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ThemeColorDarkest, width: 2),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(20.0),
                              )))),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        backgroundColor: ThemeColorDarkest,
                      ),
                      onPressed: () => {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Text("Forgot Password ?"),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account ? "),
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: ThemeColorDarkest,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomClips extends StatelessWidget {
  const CustomClips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.pink,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(size.width / 3, size.height / 3);

    // var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width / 1.3, size.height + 20);
    var endPoint = Offset(size.width, size.height - 5);

    Path path = Path()
      ..lineTo(0, size.height / 1.3) // Add line p1p2
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      // ..quadraticBezierTo(
      //     controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)// Add line p2p3
      ..lineTo(size.width, 0) // Add line p2p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()..color = ThemeColorLightest;

    var paint2 = Paint()..color = ThemeColorDarkest;
    // final paint2 = Paint()
    //   ..shader = const LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors:  [
    //       Colors.green,
    //       Colors.white,
    //
    //
    //     ],
    //   ).createShader(Offset.zero & size);

    var controlPoint1 = Offset(size.width / 2.5, size.height / 2);

    // var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width / 1.3, size.height * 1.05);
    var endPoint = Offset(size.width, size.height / 1.05);

    Path path1 = Path()
      ..lineTo(0, size.height / 1.3) // Add line p1p2
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0) // Add line p2p3
      ..close();

    var controlPoint3 = Offset(size.width / 2, size.height / 3);
    var controlPoint4 = Offset(size.width / 1.3, size.height * 1.01);
    var endPoint2 = Offset(size.width, size.height / 1.3);

    Path path2 = Path()
      ..lineTo(0, size.height / 1.35) // Add line p1p2
      ..cubicTo(controlPoint3.dx, controlPoint3.dy, controlPoint4.dx,
          controlPoint4.dy, endPoint2.dx, endPoint2.dy)
      // ..quadraticBezierTo(
      //     controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)// Add line p2p3
      ..lineTo(size.width, 0) // Add line p2p3
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
