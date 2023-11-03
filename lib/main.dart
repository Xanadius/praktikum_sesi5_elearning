import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KalkulatorBMI(),
    );
  }
}

class KalkulatorBMI extends StatefulWidget {
  const KalkulatorBMI({super.key});

  @override
  State<KalkulatorBMI> createState() => _KalkulatorBMIState();
}

class _KalkulatorBMIState extends State<KalkulatorBMI> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0.0;

  bool showBmi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi Badan (CM)',
              ),
              controller: heightController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Berat Badan (KG)',
              ),
              controller: weightController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double tinggi = double.parse(heightController.text);
                  double berat = double.parse(weightController.text);
                  bmi = (berat / (tinggi * tinggi)) * 10000;
                  showBmi = true;
                });
              },
              child: const Text(
                'Hitung',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            showBmi
                ? Text(
                    "Indeks Massa Tubuh (BMI): ${bmi.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
