import 'package:digi2/uploadImage.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 24, 30, 62), // Set background color

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 30, 62),
        foregroundColor: Colors.white,
        title: const Text('Your Gender'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'You are a',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedGender = 'Woman';
                          });
                        },
                        child: const Text('Woman'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: selectedGender == 'Woman'
                              ? Colors.green // Change color if selected
                              : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 150.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedGender = 'Man';
                          });
                        },
                        child: const Text('Man'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: selectedGender == 'Man'
                              ? Colors.green // Change color if selected
                              : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          if (selectedGender != null)
            Text(
              'Chosen Gender: $selectedGender',
              style: const TextStyle(color: Colors.white),
            ),
          Expanded(
              child: Container()), // Spacer to push Ok button to the bottom
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (c) {
                  return const uploadImage();
                },
              ));
            },
            child: Container(
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/btnbk.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
