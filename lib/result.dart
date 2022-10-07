import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double tip;
  final double friends;
  ResultPage(this.bill, this.friends, this.tax, this.tip);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TextStyle infoStyle = GoogleFonts.montserrat(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
  String dividedAmout = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  divideamount() {
    double taxamount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);

    double finalbill =
        (double.parse(widget.bill) + taxamount + widget.tip) / widget.friends;
    setState(() {
      dividedAmout = finalbill.toStringAsFixed(2);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                "Result: ",
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20),
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
                          "Equally Divided: ",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "\$$dividedAmout",
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
                              widget.friends.round().toString(),
                              style: infoStyle,
                            ),
                            Text(
                              "\$${widget.tip.round().toString()}",
                              style: infoStyle,
                            ),
                            Text(
                              "\$${widget.tax}",
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Everybody Has To Pay: \$$dividedAmout",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            "Calculate Again",
                            style: infoStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
