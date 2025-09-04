import 'package:flutter/material.dart';

class PersonalitySectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Sections',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'These five traits help us learn how you think, feel, and connect so we can match you with people you’re more likely to vibe with.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),
              SizedBox(
              //  color: Colors.blue,
                height: MediaQuery.of(context).size.height*0.7,
                width: 400,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: _buildSection(
                        textColor: Colors.black,
                        title: 'OPENNESS',
                        score: 10,
                        subtitle: 'How curious and open you are to new experiences.',
                        gradientColors: [Color(0xffFFDA59), Color(0xffFFDA59)],
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: _buildSection(
                        textColor: Colors.white,
                        title: 'CONSCIENTIOUSNESS',
                        score: 10,
                        subtitle: 'How organized, dependable, and goal-driven you are.',
                        gradientColors: [Color(0xFF089E00), Color(0xFF089E00)],
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: _buildSection(
                        textColor: Colors.white,
                        title: 'EXTRAVERSION',
                        score: 10,
                        subtitle: 'How social, energetic, and outgoing you feel.',
                        gradientColors: [Color(0xFF9EBF0D), Color(0xFF9EBF0D)],
                      ),
                    ),
                    Positioned(
                      top: 300,
                      left: 0,
                      right: 0,
                      child: _buildSection(
                        textColor: Colors.black,
                        title: 'AGREEABLENESS',
                        score: 10,
                        subtitle: 'How caring, empathetic, and cooperative you are.',
                        gradientColors: [Color(0xFFFE9B4F), Color(0xFFFE9B4F)],
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 0,
                      right: 0,
                      child: _buildSection(
                        textColor: Colors.black,
                        title: 'NEUROTICISM',
                        score: 10,
                        subtitle: 'How emotionally reactive or sensitive you tend to be.',
                        gradientColors: [Color(0xFFFFDA59), Color(0xFFFFFFFF)],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
             Container(
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 gradient: LinearGradient(
                   colors: [
                     Color(0xffFFDA59),
                     Color(0xffFE9B4F),
                   ],
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight,
                 ),
               ),
               child: Center(child: Text("Next",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
             ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required int score,
    required String subtitle,
    required Color textColor,

    required List<Color> gradientColors,
  }) {
    return Container(
      height: 200, // Explicit height to ensure layout
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade100,
        //     blurRadius: 1,
        //     //offset: Offset(0, 4),
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Prevent column from expanding unnecessarily
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title ($score)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Transform.rotate(
                  angle:75,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Expanded( // Ensure subtitle takes remaining space without overflow
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}