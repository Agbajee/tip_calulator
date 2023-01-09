// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tip'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int primaryColor = 0xFF2962FF;
  int primaryLight = 0xFFe5ecff;
  int secondaryColor = 0xFF4A148C;

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor:Colors.white,
        leading: IconButton(
            onPressed: () => _getMessage(context),
            icon: Icon(
                Icons.arrow_back_ios,
                color: Color(secondaryColor),
            )
        ),
      ),
      backgroundColor:Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              height: screenHeight * 0.25,
              width: screenWidth * 0.05,
              margin: EdgeInsets.only(
                top: screenHeight * 0.05,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.29),
                      spreadRadius: 0,
                      blurRadius: 29,
                      offset: Offset(0, 7), // changes position of shadow
                    )
                  ],
                color: Color(primaryLight),
                borderRadius: BorderRadius.circular(12.0)
              ),
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Per Person',
                      style:TextStyle(
                        color:Color(primaryColor),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      '\$${calculateTotalPerPerson(_personCounter, _billAmount)}',
                      style:TextStyle(
                        color:Color(primaryColor),
                        fontSize: 42,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal:15
              ),
              width: screenWidth * 0.05,
              margin: EdgeInsets.only(
                top: screenHeight * 0.05,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.29),
                    spreadRadius: 0,
                    blurRadius: 29,
                    offset: Offset(0, 7), // changes position of shadow
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  width: 2.0,
                  color: Color(0xFFe5ecff),
                )
              ),
              child:Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style:
                    TextStyle(
                      color: Color(secondaryColor),
                    ),
                    decoration: InputDecoration(
                      prefixText: 'Bill Amount',
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'split bill:',
                          style:TextStyle(
                              color:Color(secondaryColor),
                              fontSize: 22,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap:() =>
                                setState(() {
                                  if(_personCounter > 1){
                                    _personCounter --;
                                  }else{
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text('minimum person required is 1'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }),
                              child :Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(primaryLight),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Color(primaryColor),
                                    size: 30.0,

                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '$_personCounter',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Color(primaryColor)
                              ),
                            ),
                            InkWell(
                              onTap:() =>
                                setState(() {
                                    _personCounter ++;
                                }),
                              child :Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(primaryLight),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(primaryColor),
                                    size: 30.0,

                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'tip:',
                          style:TextStyle(
                              color:Color(secondaryColor),
                              fontSize: 22,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 10
                          ),
                          child: Text(
                            '\$${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Color(primaryColor)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '$_tipPercentage%',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Color(primaryColor)
                          ),
                        ),
                        Slider(
                            min: 0,
                            max: 100,
                            divisions: 10,
                            value:_tipPercentage.toDouble(),
                            onChanged: (double value){
                              setState(() {
                                _tipPercentage = value.round();
                              });
                            },
                            activeColor: Color(primaryColor),
                            inactiveColor: Color(secondaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if(_billAmount == 0 || _billAmount.toString().isEmpty ){

    }else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }

  calculateTotalPerPerson(int splitBy, double billAmount){
    var totalPerPerson = (calculateTotalTip(_billAmount, _personCounter, _tipPercentage) + billAmount)/splitBy ;
    return totalPerPerson;
  }


  SnackBar _getMessage(context) {
    final snackBar = SnackBar(
      backgroundColor: Color(primaryColor),
      content: Text('button is working'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}
