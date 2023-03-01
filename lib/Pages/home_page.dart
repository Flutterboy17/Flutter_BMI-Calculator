import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/Constants/app_constants.dart';
import 'package:flutter_bmi_calculator_app/Widgets/left_bar.dart';
import '../Widgets/right_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();



  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Height',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor)),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Weight',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor)),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                String heightStr = heightController.text.trim();
                String weightStr = weightController.text.trim();
                if (heightStr.isEmpty || weightStr.isEmpty) {
                  // show a snackbar to inform the user that both fields are required
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                    const SnackBar(
                    backgroundColor: accentHexColor,
                        content: Text("Please enter both height and weight", style: TextStyle(color: mainHexColor),)),
                  );
                } else {
                  double h = double.parse(heightStr);
                  double w = double.parse(weightStr);
                  setState(() {
                    bmiResult = w / (h * h);
                    if (bmiResult > 25) {
                      textResult = "You're over weight";
                    } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                      textResult = "You have normal weight";
                    } else {
                      textResult = "You're under weight";
                    }
                  });
                }
              },
              
              child: const Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              bmiResult.toStringAsFixed(2),
              style: const TextStyle(fontSize: 90, color: accentHexColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textResult,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor),
            ),
            const SizedBox(
              height: 40,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 60),
            const SizedBox(
              height: 45,
            ),
            const RightBar(barWidth: 60),
          ],
        ),
      ),
    );
  }
}
