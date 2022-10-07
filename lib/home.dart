import 'package:bill_splitting_app/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  double friends = 0.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '';

  buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          if (text == 'C') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  TextStyle infoStyle = GoogleFonts.montserrat(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 70),
                child: Text("Bill Spliter",
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 45, 59, 85),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Toatl : ",
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            bill,
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Friends: ",
                                style: infoStyle,
                              ),
                              Text(
                                "Tip: ",
                                style: infoStyle,
                              ),
                              Text(
                                "Tax: ",
                                style: infoStyle,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friends.round().toString(),
                                style: infoStyle,
                              ),
                              Text(
                                "\$${tip.round().toString()}",
                                style: infoStyle,
                              ),
                              Text(
                                "\$$tax %",
                                style: infoStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "How Many Friends",
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Slider(
                min: 0,
                max: 20,
                divisions: 20,
                activeColor: Colors.orange,
                inactiveColor: Colors.blueAccent,
                value: friends,
                onChanged: (value) {
                  setState(() {
                    friends = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 121, 182, 173),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Tip",
                          style: infoStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: (() {
                                  setState(() {
                                    if (tip >= 0) {
                                      tip = 0;
                                    } else {
                                      tip--;
                                    }
                                  });
                                }),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "\$${tip.round().toString()}",
                              style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                heroTag: null,
                                onPressed: (() {
                                  setState(() {
                                    tip++;
                                  });
                                }),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 121, 182, 173),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelText: "Tax in %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                ],
              ),
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("C"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 45, 59, 85),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ResultPage(bill, friends, tax, tip)),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Split Bill",
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
