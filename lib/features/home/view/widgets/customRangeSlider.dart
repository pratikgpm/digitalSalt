import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class RangeSliderWithLabels extends StatefulWidget {
  final double min;
  final double max;
  final int divisions;
  final Function(RangeValues) onChanged;

  RangeSliderWithLabels({
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  _RangeSliderWithLabelsState createState() => _RangeSliderWithLabelsState();
}

class _RangeSliderWithLabelsState extends State<RangeSliderWithLabels> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSlider(
                values: _currentRangeValues,
                min: widget.min,
                max: widget.max,
                activeColor: Pallete.bgBlue,
                inactiveColor: Pallete.formFieldGrey,
                divisions: widget.divisions,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                  widget.onChanged(values);
                },
              ),
              const SizedBox(height: 10), // Add space for the labels
            ],
          ),
          Positioned(
            left: (_currentRangeValues.start / widget.max) * 350,
            // Adjust for width
            top: 40,
            child: Text(
              '\$${_currentRangeValues.start.round().toString()}',
              style: TextStyle(
                  color: Pallete.bgBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          Positioned(
            left: (_currentRangeValues.end / widget.max) * 310,
            // Adjust for width
            top: 40,
            child: Text(
              '\$${_currentRangeValues.end.round().toString()}',
              style: TextStyle(
                  color: Pallete.bgBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
