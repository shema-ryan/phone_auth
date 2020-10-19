import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth/numeric.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'phone auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.brown,
        accentColor: Colors.brown[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(
          Icons.close,
          color: Colors.white70,
        ),
        title: Text(
          'Continue with phone',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/holding-phone.png',
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'you will receive a 4 digit \n to verify',
                  style:
                      GoogleFonts.aBeeZee(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5.0),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Enter phone number',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      phoneNumber ?? '',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    print(phoneNumber);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VerifyPhoneNumber(
                            phoneNumber:
                                phoneNumber ?? 'Phone number please !')));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      'Continue',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NumericPad(
            addNumber: (int number) {
              setState(() {
                if (number != -1 && phoneNumber.length < 10) {
                  phoneNumber = phoneNumber + number.toString();
                } else if (number == -1 && phoneNumber.length > 0) {
                  phoneNumber =
                      phoneNumber.substring(0, phoneNumber.length - 1);
                } else {
                  return;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class VerifyPhoneNumber extends StatefulWidget {
  final String phoneNumber;
  VerifyPhoneNumber({@required this.phoneNumber});
  @override
  _VerifyPhoneNumberState createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  String phoneNum = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Verify Phone number',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\n a 4 code digit code was sent to \n ${widget.phoneNumber}',
            style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.black54),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              numberBox(
                  number: phoneNum.length > 0
                      ? int.parse(
                          phoneNum.substring(0, 1),
                        )
                      : 10),
              numberBox(
                  number: phoneNum.length > 1
                      ? int.parse(
                          phoneNum.substring(1, 2),
                        )
                      : 10),
              numberBox(
                  number: phoneNum.length > 2
                      ? int.parse(
                          phoneNum.substring(2, 3),
                        )
                      : 10),
              numberBox(
                  number: phoneNum.length > 3
                      ? int.parse(
                          phoneNum.substring(3),
                        )
                      : 10)
            ],
          ),
          GestureDetector(
            onTap: () {
              print(
                  'we have come to an end ... thanks for challenging yourself');
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.07,
              alignment: Alignment.center,
              child: Text(
                'Verify and create an account',
                style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          NumericPad(
            addNumber: (int value) {
              setState(() {
                if (value == -1 && phoneNum.length > 0) {
                  phoneNum = phoneNum.substring(0, phoneNum.length - 1);
                } else if (phoneNum.length < 4 && value != -1) {
                  phoneNum = phoneNum + value.toString();
                } else {
                  return;
                }
              });
            },
          )
        ],
      ),
    );
  }

  Widget numberBox({int number}) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.brown,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0.3, 0.5))
          ]),
      child: Text(
        number != 10 ? number.toString() : '',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(fontSize: 30),
      ),
    );
  }
}
