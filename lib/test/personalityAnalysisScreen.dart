import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



class PersonalityAnalysisScreen extends StatelessWidget {
  final Map<String, double> dataMap = {
    "AGR": 10,
    "EXT": 25,
    "CON": 10,
    "NEU": 30,
    "OPN": 25,
  };

  final List<Color> colorList = [
    Color(0xFF4CAF50), // OPN - Green
    Color(0xFFCDDC39), // NEU - Yellow Green
    Color(0xFFFFC107), // CON - Amber
    Color(0xFFFF9800), // EXT - Orange
    Color(0xFF8BC34A), // AGR - Light Green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE0B2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Personality Analysis",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PieChart(

              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartRadius: MediaQuery.of(context).size.width / 2.2,
              colorList: colorList,
              chartType: ChartType.ring,
              ringStrokeWidth: 25,
              centerText: "",
              legendOptions: LegendOptions(
                showLegends: true,
                showLegendsInRow: true,
                  legendPosition:LegendPosition.bottom,


              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValues: true,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Personality Insights",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "You are highly neurotic and have low level of agreeableness, extraversion and covietitiousness, and openness suggesting you may benefit from connecting with patient and empathetic individual who can provide stability and support",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Note - Only you can see this. It helps us improve your vibe-based matches.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Handle Done action
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFE278), Color(0xFFFF914D)],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
