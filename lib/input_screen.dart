// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'package:blood_sugar/infor_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'diabetes_types.dart';
import 'information_screen.dart'; // Import the InformationScreen widget

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController beforeMealController = TextEditingController();
  final TextEditingController afterMealController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  DiabetesType selectedDiabetesType = DiabetesType.none;

  void navigateToInfoScreen(BuildContext context) {
    Get.to(() => InformationScreen(
          beforeMealValue: beforeMealController.text,
          afterMealValue: afterMealController.text,
          age: ageController.text,
          diabetesType: selectedDiabetesType,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#bcf4ff'),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MY SUGAR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          Text(
            "Chart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChartPage()));
            },
            icon: Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/bs.jpg",
                  width: 400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Add Your Meal Details Below",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: HexColor('#003366'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: beforeMealController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              labelText: 'Before Meal',
                              labelStyle:
                                  TextStyle(color: HexColor('#003366'))),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: afterMealController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              labelText: 'After Meal',
                              labelStyle:
                                  TextStyle(color: HexColor('#003366'))),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<DiabetesType>(
                          isExpanded: true,
                          dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          value: selectedDiabetesType,
                          onChanged: (DiabetesType? newValue) {
                            setState(() {
                              selectedDiabetesType = newValue!;
                            });
                          },
                          items: DiabetesType.values.map((DiabetesType type) {
                            return DropdownMenuItem<DiabetesType>(
                              value: type,
                              child: Text(type.toString().split('.').last),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 35),
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: ageController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              labelText: 'Age',
                              labelStyle:
                                  TextStyle(color: HexColor('#003366'))),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => navigateToInfoScreen(context),
                child: Text(
                  'Show Results',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#003366'),
                    fixedSize: Size(200, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
