import 'package:cvparser_b21_01/colors.dart';
import 'package:cvparser_b21_01/datatypes/export.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final List<CVMatch> elements;

  // right now it only accepts title, but you can add more
  // arguments to be accepted by this widget
  const CardWidget({
    Key? key,
    required this.title,
    required this.elements,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // responsible for toggle
  bool _showData = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5.0),
        GestureDetector(
          onTap: () {
            setState(() {
              _showData = !_showData;
            });
          },
          child: Container(
            width: 1350,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: !_showData
                  ? BorderRadius.circular(10)
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
            ),
            margin: !_showData
                ? const EdgeInsets.fromLTRB(0, 0, 0, 10)
                : const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Eczar",
                      fontWeight: FontWeight.w400,
                      color: colorTextSmoothBlack,
                    ),
                  ),
                  if (!_showData)
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        size: 55, color: colorSecondaryGreenPlant)
                  else
                    const Icon(Icons.keyboard_arrow_up_rounded,
                        size: 55, color: colorSecondaryGreenPlant)
                ],
              ),
            ),
          ),
        ),

        // this is the company card which is toggling based upon the bool
        _showData
            ? Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                    ),
                    color: colorSecondaryLightGreenPlant),
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.elements.map(
                    (e) {
                      // make changes in the UI here for your company card
                      return Card(
                        color: colorSecondaryLightGreenPlant,
                        shadowColor: Colors.transparent,
                        child: Column(children: [
                          SizedBox(
                            width: 1350,
                            child: Text(
                              e.match,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Merriweather',
                                color: colorTextSmoothBlack,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Container(
                              height: 1,
                              color: const Color.fromARGB(35, 77, 102, 88),
                              margin: const EdgeInsets.fromLTRB(0, 20, 30, 10)),
                        ]),
                      );
                    },
                  ).toList(),
                ),
              )
            : const SizedBox() // else blank
      ],
    );
  }
}
