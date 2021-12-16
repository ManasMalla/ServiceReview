import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_review/size_provider.dart';

class RatingTextField extends StatelessWidget {
  final String? initialText;
  final Function(String) onChanged;
  final Function onBackspacePressed;

  final Function(String) onSubmitted;

  final bool needToSendOnBackSpaceChanged;
  const RatingTextField({
    Key? key,
    this.initialText,
    required this.onChanged,
    required this.onSubmitted,
    required this.onBackspacePressed,
    required this.needToSendOnBackSpaceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(getProportionateSize(16))),
      width: double.infinity,
      height: getProportionateHeight(120),
      padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(16)),
      margin: EdgeInsets.symmetric(vertical: getProportionateHeight(8)),
      child: RatingInputTextField(
        initialText: initialText ?? "",
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onBackspacePressed: onBackspacePressed,
        needToSendOnBackSpaceChanged: needToSendOnBackSpaceChanged,
      ),
    );
  }
}

class RatingInputTextField extends StatefulWidget {
  final String initialText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function onBackspacePressed;
  final bool needToSendOnBackSpaceChanged;
  const RatingInputTextField({
    Key? key,
    required this.initialText,
    required this.onChanged,
    required this.onSubmitted,
    required this.onBackspacePressed,
    required this.needToSendOnBackSpaceChanged,
  }) : super(key: key);

  @override
  _RatingInputTextFieldState createState() => _RatingInputTextFieldState();
}

class _RatingInputTextFieldState extends State<RatingInputTextField> {
  @override
  Widget build(BuildContext context) {
    var textFieldController = TextEditingController(text: widget.initialText);
    return RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if (widget.needToSendOnBackSpaceChanged) {
              widget.onBackspacePressed();
            }
          }
        },
        child: TextFormField(
            controller: textFieldController,
            onChanged: (string) {
              widget.onChanged(string);
            },
            onFieldSubmitted: widget.onSubmitted,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Please provide your feedback!"),
            cursorColor: Colors.grey));
  }
}
