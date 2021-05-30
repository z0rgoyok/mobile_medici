import 'package:flutter/material.dart';
import 'package:mobile_medici/model/Deck.dart';
import 'package:sliding_panel_pro/sliding_panel_pro.dart';

class IChingSelectWidget extends StatefulWidget {
  var selectedHexes = <int>[];
  Function onUpdate;
  final gHex = [3, 4, 6, 9, 12, 18, 21, 23, 26, 28, 29, 36, 38, 39, 44, 47, 52];
  final neutralHexIdx = [
    35,
    7,
    8,
    15,
    20,
    22,
    27,
    30,
    32,
    33,
    41,
    48,
    51,
    54,
    57,
    62
  ];

  var positivehex = [
    1,
    10,
    11,
    13,
    14,
    16,
    17,
    19,
    24,
    25,
    31,
    34,
    35,
    37,
    40,
    42,
    43,
    45,
    46,
    49,
    50,
    53,
    55,
    56,
    58,
    59,
    60,
    61,
    63,
    64,
  ];

  IChingSelectWidget(this.selectedHexes, this.onUpdate);

  @override
  IChingSelectState createState() => IChingSelectState();
}

class IChingSelectState extends State<IChingSelectWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: width / 3,
        height: width / 2.5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          widget.selectedHexes.clear();
                          widget.selectedHexes.addAll(widget.positivehex);
                          widget.onUpdate();
                        });
                      },
                      child: Text(
                        "⬆️",
                        style: TextStyle(fontSize: 48),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          widget.selectedHexes.clear();
                          widget.selectedHexes.addAll(widget.gHex);
                          widget.onUpdate();
                        });
                      },
                      child: Text(
                        "⬇️️",
                        style: TextStyle(fontSize: 48),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          widget.selectedHexes.clear();
                          widget.onUpdate();
                        });
                      },
                      child: Text(
                        "🗑️️",
                        style: TextStyle(fontSize: 48),
                      )),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 8,
                  children: List.generate(64, (index) {
                    var number = index + 1;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.selectedHexes.contains(number)) {
                            widget.selectedHexes.remove(number);
                          } else {
                            widget.selectedHexes.add(number);
                          }
                          widget.onUpdate();
                        });
                      },
                      child: Container(
                        color: widget.selectedHexes.contains(number)
                            ? Colors.blue.withAlpha(200)
                            : Colors.white,
                        width: width,
                        height: width,
                        child: Center(
                            child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              decoration: null),
                        )),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
