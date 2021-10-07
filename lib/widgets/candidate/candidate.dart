import 'package:flutter/material.dart';

class Candidate extends StatelessWidget {
  const Candidate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: Border(
        top: BorderSide(width: 1.0, color: Colors.black),
        left: BorderSide(width: 1.0, color: Colors.black),
        right: BorderSide(width: 1.0, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.03,
              child: const Text("1"),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * 0.065,
                height: MediaQuery.of(context).size.width * 0.065,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/kprf.png",
                      height: MediaQuery.of(context).size.width * 0.065,
                    ),
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'Политическая партия "КОММУНИСТИЧЕСКАЯ ПАРТИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ"',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.035,
                height: MediaQuery.of(context).size.width * 0.035,
                decoration: BoxDecoration(border: Border.all()),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
