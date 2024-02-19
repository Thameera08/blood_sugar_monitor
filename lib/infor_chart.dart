// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:blood_sugar/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => InputScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Chart Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: HexColor('#bcf4ff'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  _buildTableRow([
                    '',
                    'Before meals (fasting)',
                    'After meals (post-prandial)',
                    'Other'
                  ]),
                  _buildTableRow([
                    'Adults with type 1 diabetes',
                    '80–130 mg/dL',
                    '< 180 mg/dL (1 or 2 hours after)',
                    ''
                  ]),
                  _buildTableRow([
                    'Adults with type 2 diabetes',
                    '80–130mg/dL',
                    '< 180 mg/dL and (1 or 2 hours after)',
                    ''
                  ]),
                  _buildTableRow([
                    'Children with type 1 diabetes',
                    '90-130 mg/dL',
                    '',
                    '90–150 mg/dL at bedtime/overnight'
                  ]),
                  _buildTableRow([
                    'Pregnant people (T1D, gestational diabetes)',
                    '< 95 mg/dL',
                    '140 mg/dL (1 hour after)',
                    '120 mg/dL (2 hours after)'
                  ]),
                  _buildTableRow([
                    '65 or older ',
                    '80–180 mg/dL',
                    '',
                    '80–200 mg/dL for those in poorer health, assisted living, end of life'
                  ]),
                  _buildTableRow([
                    'Without diabetes',
                    '99 mg/dL or below',
                    '140 mg/dL or below',
                    ''
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String> data) {
    return TableRow(
      children: data.map((item) => _buildTableCell(item)).toList(),
    );
  }

  Widget _buildTableCell(String value) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(value),
      ),
    );
  }
}
