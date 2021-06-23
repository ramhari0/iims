import 'package:flutter/material.dart';

class FacebookSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey[300],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey[300],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.blueAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Login with Facebook",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Forgot Password?",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
