import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FluidInfusion(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FluidInfusion extends StatefulWidget {
  @override
  _FluidInfusionState createState() => _FluidInfusionState();
}

class _FluidInfusionState extends State<FluidInfusion> {

  TextEditingController _volume = new TextEditingController();
  TextEditingController _hours = new TextEditingController();
  TextEditingController _minutes = new TextEditingController();

  double calculatedMinutes = 0.0;//result of hours to minutes calculation
  double mlPerMinNum = 0.0;
  double dropsCrystalloidMin = 0.0;
  double dropsColloidMin = 0.0;
  double microDropsMin = 0.0;
  double hoursNum = 0.0;
  double minutesNum = 0.0;
  double enteredMinutesNum = 0.0;
  double millilitresNum = 0.0;


  String millilitres = "0.0"; //millilitres/min value on UI
  String crystalloid = "0.0";//drops/min Crystalloid on UI 20/ml
  String colloid = "0.0";//drops/min Colloid on screen 15/ml
  String microDrops = "0.0";//microdrop value on screen 60/ml
  String convertedMinutes = "0.0";//result of hours to minutes calculation
  String enteredMinutes = "0.0";//User entered minutes for main calculation
  String enteredHours = "0.0";//User entered hours for hours to minutes conversion
  String enteredVolume = "0.0"; // user entered volume
  String mlPerMin = "0.0";

  void convertToMinutes(enteredHours){
    enteredHours = _hours.text;
    hoursNum = double.parse(enteredHours);

    minutesNum = hoursNum * 60;

    convertedMinutes = minutesNum.toStringAsFixed(1);

    setState(() {
    });
  }

  void calculateInfusions() {
    millilitres = _volume.text;
    millilitresNum = double.parse(millilitres);

    enteredMinutes = _minutes.text;
    minutesNum = double.parse(enteredMinutes);

    mlPerMinNum = millilitresNum / minutesNum;

    mlPerMin = mlPerMinNum.toStringAsFixed(2);
    dropsCrystalloidMin = mlPerMinNum * 20;
    crystalloid = dropsCrystalloidMin.toStringAsFixed(2);
    dropsColloidMin = mlPerMinNum * 15;
    colloid = dropsColloidMin.toStringAsFixed(2);
    microDropsMin = mlPerMinNum * 60;
    microDrops = microDropsMin.toStringAsFixed(2);

    setState(() {

    });


  }


  // ignore: non_constant_identifier_names
  void Reset(){
    setState(() {
      millilitres = "0.0";
    });
    setState(() {
      crystalloid = "0.0";
    });
    setState(() {
      colloid = "0.0";
    });
    setState(() {
      microDrops = "0.0";
    });
    setState(() {
      convertedMinutes = "0.0";
    });
    setState(() {
      _volume.text =  "";
    });
    setState(() {
      _hours.text = "";
    });
    setState(() {
      _minutes.text = "";
    });
    setState(() {
      mlPerMin = "0.0";
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.red,
          body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 10,
                    width: double.maxFinite,
                  ),
                  Text("Fluid Infusions",
                    style: TextStyle(color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: double.maxFinite,
                  ),
                  Text("Calculations",
                    style: TextStyle(color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(30),
                        alignment: Alignment.topLeft,
                        child: Text("Infusion Volume (ml):",
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(left: 10, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Volume",
                            ),
                            controller: _volume,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Hours to Minutes Conversion",
                          style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Hours",
                                ),
                                controller: _hours,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Text("Hours",style: TextStyle(color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),)
                          ),

                    ],
                  ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          convertToMinutes(enteredHours);
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        splashColor: Colors.green,
                        child: Text("Convert", style:
                        TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        ),
                      ),
                      Column(
                          children: [
                            Container(
                              width: 80,
                              height: 40,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                child: Text("$convertedMinutes",
                                style: TextStyle(fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                color: Colors.black),
                                ),
                                   ),
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text("Minutes",style: TextStyle(color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),)
                            ),
                          ]
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        child: Text("Infusion Time in Minutes:",
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(left: 10, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Minutes",
                            ),
                            controller: _minutes,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ignore: deprecated_member_use
                  Container(
                    margin: EdgeInsets.all(20),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        onPressed:(){
                        calculateInfusions();
                        },
                        color: Colors.blue,
                      textColor: Colors.white,
                      splashColor: Colors.green,
                      child: Text("Calculate", style:
                      TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          child: Text("Infusion Rate (ml/min):",
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text("$mlPerMin",
                                style: TextStyle(fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 20,bottom: 20),
                          alignment: Alignment.topLeft,
                          child: Text("Drops/Minute Crystalloid:",
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 5,top: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text("$crystalloid",
                              style: TextStyle(fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                          alignment: Alignment.topLeft,
                          child: Text("Drops/Minute Colloid:",
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text("$colloid",
                              style: TextStyle(fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.topLeft,
                              child: Text("Drops/Minute Microdrop",
                                style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.topLeft,
                              child: Text("60 drops/ml:",
                                style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text("$microDrops",
                              style: TextStyle(fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      onPressed:(){
                        Reset();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      splashColor: Colors.green,
                      child: Text("Reset", style:
                      TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]
            ),
          )
          ),
        )
    );
  }
}

