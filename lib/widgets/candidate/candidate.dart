import 'package:flutter/material.dart';

class Candidate extends StatelessWidget {
  const Candidate(
      {Key? key, required this.logo, required this.text, required this.n})
      : super(key: key);

  final String logo;
  final String text;
  final int n;

  Border getBorder(int n) {
    if (n == 15) {
      return Border(
        top: BorderSide(width: 1.0, color: Colors.black),
        left: BorderSide(width: 1.0, color: Colors.black),
        right: BorderSide(width: 1.0, color: Colors.black),
        bottom: BorderSide(width: 1.0, color: Colors.black),
      );
    }
    return Border(
      top: BorderSide(width: 1.0, color: Colors.black),
      left: BorderSide(width: 1.0, color: Colors.black),
      right: BorderSide(width: 1.0, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: getBorder(n),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.035,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.05,
                child: Text('$n'),
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
                        logo,
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
                      // 'Политическая партия "КОММУНИСТИЧЕСКАЯ ПАРТИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ"',
                      text,
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
      ),
    );
  }
}
