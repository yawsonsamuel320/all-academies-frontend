import 'package:flutter/material.dart';

class BioticText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  const BioticText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Use theme data to determine the color (use color parameter as fallback)
    final theme = Theme.of(context);
    final textColor = color ?? theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Biotic',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}

class BioticTitleText extends StatelessWidget {
  final String text;

  const BioticTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BioticText(
      text: text,
      fontSize: 33.0,
      fontWeight: FontWeight.bold,
    );
  }
}

class BioticBoldText extends StatelessWidget {
  final String text;

  const BioticBoldText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BioticText(
      text: text,
      fontWeight: FontWeight.bold,
    );
  }
}

class BioticCardTitleText extends StatelessWidget {
  final String text;

  const BioticCardTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BioticText(
      text: text,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }
}

class BioticSubtitleText extends StatelessWidget {
  final String text;

  const BioticSubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BioticText(
      text: text,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
  }
}

class BioticBodyText extends StatelessWidget {
  final String text;

  const BioticBodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BioticText(
      text: text,
      fontSize: 14.0,
    );
  }
}
