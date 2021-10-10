import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const Border(
        top: BorderSide(width: 1.0, color: Colors.black),
        left: BorderSide(width: 1.0, color: Colors.black),
        right: BorderSide(width: 1.0, color: Colors.black),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ИЗБИРАТЕЛЬНЫЙ БЮЛЛЕТЕНЬ",
                      style: TextStyle(
                          fontFamily: "Chicken",
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "для голосования по федеральному избирательному округу",
                      style: TextStyle(fontFamily: "Chicken", fontSize: 7),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "на выборах депутатов Государственной Думы Федерального Собрания Российской Федерации восьмого созыва",
                      style: TextStyle(fontFamily: "Chicken", fontSize: 7),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
