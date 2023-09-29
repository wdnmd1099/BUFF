import 'package:flutter/material.dart';

class AdjustableFontSize extends StatefulWidget {
  @override
  _AdjustableFontSizeState createState() => _AdjustableFontSizeState();
}

class _AdjustableFontSizeState extends State<AdjustableFontSize> {
  final String text = 'This is a multiline text. Line 2. Line 3.222222222222222222222222222222222222222222';

  double _fontSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final TextSpan textSpan = TextSpan(
          text: text,
          style: TextStyle(fontSize: _fontSize),
        );

        final TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: 3,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        final int lines = textPainter.computeLineMetrics().length;

        switch (lines) {
          case 1:
            _fontSize = 24.0;
            break;
          case 2:
            _fontSize = 18.0;
            break;
          case 3:
            _fontSize = 14.0;
            break;
          default:
            _fontSize = 14.0;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Adjustable Font Size'),
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Text.rich(
              textSpan,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdjustableFontSize(),
  ));
}
