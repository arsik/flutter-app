import 'package:flutter/material.dart';

Color colorOne = Color.fromRGBO(48, 48, 48, 1);
// #303030

class ProfileHeader extends StatelessWidget {

  // final String title;
  // final String user_photo;
  // ProfileHeader({ this.user_photo });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        // padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        // child: Image.asset('images/splash.png', width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
      ),
      painter: CurvePainter(),
    );
  }
}
class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Path path = Path();
  Paint paint = Paint();

  path = Path();
  path.lineTo(0, size.height);
  path.quadraticBezierTo(size.width*0.10, size.height*0.05, size.width*0.50, size.height*0.10);
  path.quadraticBezierTo(size.width*0.90, size.height*0.20, size.width, 0);
  path.lineTo(size.width, size.height);
  path.lineTo(0, size.height);
  path.close();

  paint.color = colorOne;
  canvas.drawPath(path, paint);

  // canvas.drawImage(image, p, paint)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}