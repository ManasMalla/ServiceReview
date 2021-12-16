import 'package:flutter/material.dart';
import 'package:service_review/chip_data.dart';
import 'package:service_review/size_provider.dart';

class RatingStar extends StatefulWidget {
  final Function onPressed;
  final int index;
  final bool state;
  final int highestState;
  const RatingStar({
    Key? key,
    required this.index,
    required this.onPressed,
    required this.state,
    required this.highestState,
  }) : super(key: key);

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: getProportionateSize(36),
              height: getProportionateSize(36),
              color: emojiColor[widget.index + 1]
                  ?.withOpacity(widget.state ? 0.6 : 0),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onPressed();
            },
            splashColor: emojiColor[widget.index + 1]?.withOpacity(0.2),
            hoverColor: emojiColor[widget.index + 1]?.withOpacity(0.15),
            iconSize: getProportionateSize(48),
            splashRadius: getProportionateSize(20),
            icon: Icon(
              emojis[widget.index + 1],
              color: emojiColor[widget.index + 1],
            ),
          ),
        ],
      ),
    );
  }
}
