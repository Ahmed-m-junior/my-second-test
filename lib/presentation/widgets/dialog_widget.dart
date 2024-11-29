import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          backgroundColor: Colors.white70,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          content: const Padding(
            padding: EdgeInsets.all(5),
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 35),
                  height: 70,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color(0xffB39EDB),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/light.png'),
                          height: 50,
                          width: 50,
                          color: Color(0xff502B69),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "light",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 35),
                  height: 70,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color(0xffB39EDB),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/dark-mode.png'),
                          height: 40,
                          width: 50,
                          color: Color(0xff502B69),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "dark",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff502B69),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ],
        );
  }
}
