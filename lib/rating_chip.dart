import 'dart:math';

import 'package:flutter/material.dart';
import 'package:service_review/chip_data.dart';
import 'package:service_review/review_screen.dart';
import 'package:service_review/size_provider.dart';

class RatingChips extends StatefulWidget {
  final int starsGiven;
  final Function(String, int) onChipSelected;
  final List<bool> chipStates;
  const RatingChips({
    Key? key,
    required this.starsGiven,
    required this.onChipSelected,
    required this.chipStates,
  }) : super(key: key);

  @override
  _RatingChipsState createState() => _RatingChipsState();
}

class _RatingChipsState extends State<RatingChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingChip(
              text: chipData[widget.starsGiven]?[0] ?? "Excellent!",
              onChipSelected: (text, index) {
                resetChips(index, widget.chipStates);
                widget.onChipSelected(widget.chipStates[0] ? text : "", index);
              },
              index: 0,
              isSelected: widget.chipStates[0],
            ),
            RatingChip(
              text: chipData[widget.starsGiven]?[1] ?? "Superb!",
              onChipSelected: (text, index) {
                resetChips(index, widget.chipStates);
                widget.onChipSelected(widget.chipStates[1] ? text : "", index);
              },
              index: 1,
              isSelected: widget.chipStates[1],
            ),
            RatingChip(
              text: chipData[widget.starsGiven]?[2] ?? "Great!",
              onChipSelected: (text, index) {
                resetChips(index, widget.chipStates);
                widget.onChipSelected(widget.chipStates[2] ? text : "", index);
              },
              index: 2,
              isSelected: widget.chipStates[2],
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingChip(
              text: chipData[widget.starsGiven]?[3] ?? "Wonderful!",
              onChipSelected: (text, index) {
                resetChips(index, widget.chipStates);
                widget.onChipSelected(widget.chipStates[3] ? text : "", index);
              },
              index: 3,
              isSelected: widget.chipStates[3],
            ),
            (chipData[widget.starsGiven] ?? []).length > 4
                ? RatingChip(
                    text: chipData[widget.starsGiven]?[4] ?? "Sharing It Now!",
                    onChipSelected: (text, index) {
                      resetChips(index, widget.chipStates);
                      widget.onChipSelected(
                          widget.chipStates[4] ? text : "", index);
                    },
                    index: 4,
                    isSelected: widget.chipStates[4],
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}

class RatingChip extends StatefulWidget {
  final String text;
  final int index;
  final Function(String, int) onChipSelected;
  final bool isSelected;
  const RatingChip({
    Key? key,
    required this.text,
    required this.onChipSelected,
    required this.index,
    required this.isSelected,
  }) : super(key: key);
  @override
  _RatingChipState createState() => _RatingChipState();
}

class _RatingChipState extends State<RatingChip> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(getProportionateSize(4)),
      padding: EdgeInsets.all(getProportionateSize(8)),
      width: widget.isSelected
          ? (widget.text.length * getProportionateWidth(10) +
              getProportionateWidth(20))
          : max(widget.text.length * getProportionateWidth(10),
              getProportionateWidth(85)),
      decoration: BoxDecoration(
          color:
              widget.isSelected ? Colors.amber.shade300 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(getProportionateSize(28))),
      child: InkWell(
        onTap: () {
          widget.onChipSelected(widget.text, widget.index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isSelected
                ? Padding(
                    padding: EdgeInsets.only(right: getProportionateWidth(8)),
                    child: Icon(
                      Icons.check_rounded,
                      size: getProportionateSize(16),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                  ),
            Text(
              widget.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: getProportionateHeight(14)),
            ),
          ],
        ),
      ),
    );
  }
}
