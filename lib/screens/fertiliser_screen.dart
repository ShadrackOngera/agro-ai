import 'package:agro_ai/utils/constants.dart';
import 'package:agro_ai/widgets/primary_text.dart';
import 'package:agro_ai/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';

class FertiliserScreen extends StatefulWidget {
  const FertiliserScreen({super.key});

  @override
  State<FertiliserScreen> createState() => _FertiliserScreenState();
}

class _FertiliserScreenState extends State<FertiliserScreen> {
  final TextEditingController nitrogenController = TextEditingController();
  final TextEditingController phosphorusController = TextEditingController();
  final TextEditingController potassiumController = TextEditingController();
  final TextEditingController phLevelController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();
  String dropdownvalue = 'Rice ';
  var cities = [
    'Rice',
    'Maize',
    'Apple',
    'Orange',
    'Coconut',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          text: 'Fertiliser',
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: 'Get informed advice on fertilizer based on soil',
              color: Constants.grey700,
              maxLines: 2,
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryText(
              text: 'Nitrogen',
              color: Constants.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            PrimaryTextField(
              controller: nitrogenController,
              obsecureText: false,
              hintText: 'Enter the Value (E.g 50)',
            ),
            const SizedBox(
              height: 15,
            ),
            PrimaryText(
              text: 'Phosphorus',
              color: Constants.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            PrimaryTextField(
              controller: phosphorusController,
              obsecureText: false,
              hintText: 'Enter the Value (E.g 50)',
            ),
            const SizedBox(
              height: 15,
            ),
            PrimaryText(
              text: 'Potassium',
              color: Constants.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            PrimaryTextField(
              controller: potassiumController,
              obsecureText: false,
              hintText: 'Enter the Value (E.g 50)',
            ),
            const SizedBox(
              height: 15,
            ),
            PrimaryText(
              text: 'Crop you want to grow',
              color: Constants.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                hintText: 'Select Crop',
                hintStyle: const TextStyle(
                  color: Color(0xff989a95),
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 160, 160, 159),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xff050505),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
              ),
              items: cities.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Constants.black,
                backgroundColor: Colors.cyan.shade800,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const PrimaryText(
                text: 'Submit',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
