import 'dart:io';

import 'package:bulletin/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:animated_check/animated_check.dart';
import 'package:provider/provider.dart';

class Candidate extends StatefulWidget {
  const Candidate(
      {Key? key, required this.logo, required this.text, required this.n})
      : super(key: key);

  final String logo;
  final String text;
  final int n;

  @override
  State<Candidate> createState() => _CandidateState();
}

class _CandidateState extends State<Candidate>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
  }

  Border getBorder(int n) {
    if (n == 15) {
      return const Border(
        top: BorderSide(width: 1.0, color: Colors.black),
        left: BorderSide(width: 1.0, color: Colors.black),
        right: BorderSide(width: 1.0, color: Colors.black),
        bottom: BorderSide(width: 1.0, color: Colors.black),
      );
    }
    return const Border(
      top: BorderSide(width: 1.0, color: Colors.black),
      left: BorderSide(width: 1.0, color: Colors.black),
      right: BorderSide(width: 1.0, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(
      builder: (context, checkProvider, child) {
        if (checkProvider.checkedNum == this.widget.n) {
          _animationController.forward();
        } else {
          _animationController.reset();
        }
        return GestureDetector(
          onTap: () {
            checkProvider.setChecked(this.widget.n);

            checkProvider.setFifth();
          },
          child: Card(
            margin: const EdgeInsets.all(0),
            shape: getBorder(widget.n),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.035,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: Text('${widget.n}'),
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
                              widget.logo,
                              height: MediaQuery.of(context).size.width * 0.065,
                            ),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.715,
                          child: Text(
                            widget.text,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.07,
                          height: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(border: Border.all()),
                          alignment: Alignment.center,
                          child: AnimatedCheck(
                            progress: _animation,
                            size: 400,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
