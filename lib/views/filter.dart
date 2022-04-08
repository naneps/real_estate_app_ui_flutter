import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var selectedRange = RangeValues(400, 1000);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectedRange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24, left: 24, top: 32, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "your search",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "range",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: selectedRange,
            onChanged: (RangeValues newRange) {
              setState(() {
                selectedRange = newRange;
              });
            },
            min: 70,
            max: 1000,
            activeColor: Colors.blue[900],
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"$70k",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                r"$1000k",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Rooms",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Any", false),
              buildOption("1", false),
              buildOption("2", true),
              buildOption("3+", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOption(String text, bool selected) {
    return Container(
      height: 45,
      width: 65,
      decoration: BoxDecoration(
          color: selected ? Colors.blue[900] : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            width: selected ? 0 : 1,
            color: Colors.grey,
          )),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
