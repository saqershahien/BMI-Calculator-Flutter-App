import 'dart:math';
import 'package:flutter/material.dart';

double res = 0;
/*var images = {
  1: "https://i.suar.me/G59dZ/t",
  2: "https://i.suar.me/AWo1L/t",
  3: "https://i.suar.me/yWQAm/t",
  4: "https://i.suar.me/mwY0Q/t",
};*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 40),
        ),
        titleTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _height = TextEditingController(text: "120");
  TextEditingController _weight = TextEditingController(text: "80");

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: isMale ? Colors.black : Colors.grey,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: isMale ? Colors.blue : Colors.grey,
                            size: 40,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 33,
                                color: isMale ? Colors.black : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: isMale == false ? Colors.black : Colors.grey,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: isMale == false ? Colors.pink : Colors.grey,
                            size: 40,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                color: !isMale ? Colors.black : Colors.grey,
                                fontSize: 33),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 33),
                    textAlign: TextAlign.center,
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const Text(
                    "Height (in Cm)",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 33),
                    textAlign: TextAlign.center,
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const Text(
                    "Weight (in kgs )",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              setState(() {
                double h = double.parse(_height.text);
                double w = double.parse(_weight.text);
                double temp = w / pow((h / 100), 2);
                res = double.parse(temp.toStringAsFixed(2));
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                        title: const Center(child: Text("Your BMI")),
                        titleTextStyle: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image(
                                      image: NetworkImage(
                                          images(res)),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      status(res),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "$res",
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )));
              });
            },
            child: Container(
                margin: const EdgeInsets.all(9),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
          )
        ],
      ),
    );
  }
}

String images(double res) {
  if (res <= 18.5) return "https://i.suar.me/dQrJl/t";
  if (res <= 24.9) return "https://i.suar.me/mwY0Q/t";
  if (res <= 29.0) return "https://i.suar.me/yWQAm/t";
  if (res <= 34.9) return "https://i.suar.me/OrGmB/t";
  return "https://i.suar.me/AWo1L/t";
}

Text status(double res) {
  if (res <= 18.5) {
    return const Text(
      "Under Weight",
      style: TextStyle(color: Colors.blue, fontSize: 25),
    );
  }
  if (res <= 24.9) {
    return const Text(
      "Normal",
      style: TextStyle(color: Colors.lightGreen, fontSize: 25),
    );
  }
  if (res <= 29.0) {
    return const Text(
      "OverWeight",
      style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
    );
  }
  if (res <= 34.9) {
    return const Text(
      "Obese",
      style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 25),
    );
  }

  return const Text(
    "Extremely Obese",
    style: TextStyle(color: Colors.red, fontSize: 25),
  );
}
