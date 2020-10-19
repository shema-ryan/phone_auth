import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumericPad extends StatelessWidget {
  final Function(int value) addNumber;
  NumericPad({this.addNumber});
  Widget buildNumber({int number}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          addNumber(number);
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNumber(number: 1),
              buildNumber(number: 2),
              buildNumber(number: 3),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNumber(number: 4),
              buildNumber(number: 5),
              buildNumber(number: 6),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNumber(number: 7),
              buildNumber(number: 8),
              buildNumber(number: 9),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(),
              ),
              buildNumber(number: 0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    addNumber(-1);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.backspace_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
