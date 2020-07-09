import 'package:flutter/material.dart';

// const kTryThisColorsAcAppBackgroundDarkBlue = const Color(0xFF10132D);
// const kTryThisAsFontColorYellow = const Color(0xFFFFC30E);
// const kTryCardBackgroundColor = const Color(0xFF171C48);

const kPrimaryBackgroundColor = const Color(0xFF030303);
const kSecondaryBackgroundColor = const Color(0xFF1A1B25);
const kCardColor = const Color(0xFF1C1C1E);
const kSearchInputColor = const Color(0xFF2C2C2E);
const kTextColor = const Color(0xFFBEBDC0);

const kSearchBarDecoration = InputDecoration(
  hintText: 'Search',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSearchInputColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  // prefixIcon: const Icon(Icons.search, color: kTextColor),
  prefixIcon: Padding(
    padding: const EdgeInsetsDirectional.only(start: 10.0),
    child: const Icon(Icons.search,
        color: kTextColor), // myIcon is a 48px-wide widget.
  ),
  filled: true,
  fillColor: kSearchInputColor,
);
