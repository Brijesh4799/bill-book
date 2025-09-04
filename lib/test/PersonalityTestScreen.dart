import 'package:flutter/material.dart';


class PersonalityQuestionScreen extends StatefulWidget {
  @override
  _PersonalityQuestionScreenState createState() => _PersonalityQuestionScreenState();
}

class _PersonalityQuestionScreenState extends State<PersonalityQuestionScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> options = [
    {'emoji': '😣', 'label': 'Disagree'},
    {'emoji': '😐', 'label': 'Slightly disagree'},
    {'emoji': '😶', 'label': 'Neutral'},
    {'emoji': '🙂', 'label': 'Slightly agree'},
    {'emoji': '😃', 'label': 'Agree'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Section 1 of 5", style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 4),
            Text(
              "Agreeableness",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "How caring, empathetic, and cooperative you are.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Text(
              "+50 Uni Points",
              style: TextStyle(fontSize: 14, color: Color(0xff9EBF0D), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Question 1 of 10",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: 0.1,
              backgroundColor: Colors.grey[200],
              color: Colors.orange,
              minHeight: 6,
            ),
            const SizedBox(height: 30),
            Text(
              "I feel little concern for others",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(options.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: isSelected
                          ? LinearGradient(
                        colors: [Color(0xFFFFE278), Color(0xFFFF914D)],
                      )
                          : null,
                      border: isSelected
                          ? null
                          : Border.all(color: Colors.black12),
                      color: isSelected ? null : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          options[index]['emoji']!,
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          options[index]['label']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
