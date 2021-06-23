import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iimsapp/insta_login.dart';
import 'package:iimsapp/routes.dart';

void main() {
  runApp(BaseStateLessWidget());
}

class BaseStateLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //we are building app specific to Android Platform
    //we set themes here as well
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      initialRoute: '/insta_login',
      theme: ThemeData(primarySwatch: Colors.green),
      //home: Instagram(),
      onGenerateRoute: generatedRoutes,
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  //returns the stateObject
  @override
  State<MyStateFulWidget> createState() => _StateOfMyStateFulWidget();
}

class _StateOfMyStateFulWidget extends State<MyStateFulWidget> {
  int counterVariable = 0;

  @override
  Widget build(BuildContext context) {
    print(
        "THIS BUILD IS RUNNING EVERY TIME COUNTER VARIABLE IS CHANGING: $counterVariable");
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Increment App"),
      ),
      body: Center(
          child: Text(
        counterVariable.toString(),
        style: TextStyle(fontSize: 50.0, color: Colors.green),
      )),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildFloatingActionButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          onPressed: () {
            //it notifies the framework that the internal
            // state of the the object has been changed
            //so rebuild it again

            setState(() {
              counterVariable++;
            });

            print(counterVariable.toString());
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 50),
        FloatingActionButton(
          onPressed: () {
            //it notifies the framework that the internal
            // state of the the object has been changed
            //so rebuild it again

            setState(() {
              if (counterVariable != 0) {
                counterVariable--;
              }
            });

            print(counterVariable.toString());
          },
          child: Icon(Icons.minimize_rounded),
        ),
      ],
    );
  }
}

//stateful widget create state class

//state class has a build method that returns an widget
