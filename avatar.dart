import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:o3d/o3d.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 30, 62),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/3Env1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   child: FutureBuilder(
              //     future: loadModel(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         if (snapshot.hasError) {
              //           return Text('Error loading model: ${snapshot.error}');
              //         } else {
              //           return O3D(
              //             src: snapshot.data.toString(),
              //           );
              //         }
              //       } else {
              //         return CircularProgressIndicator();
              //       }
              //     },
              //   ),
              // ),
              // const Expanded(
              //   child: O3D(
              //     src: 'assets/images/avatar2.glb',
              //   ),
              // ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Write a message!',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        // Implement microphone button functionality
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> loadModel() async {
    try {
      // Load the GLB file from assets (replace 'model.glb' with your file path)
      ByteData data = await rootBundle.load('assets/images/avatar2.glb');
      List<int> bytes = data.buffer.asUint8List();
      return String.fromCharCodes(bytes);
    } catch (error) {
      print('Error loading GLB file: $error');
      return ''; // Return an empty string to indicate failure
    }
  }
}
