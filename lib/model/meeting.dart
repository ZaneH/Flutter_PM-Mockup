import 'package:flutter/material.dart';

class Meeting {
  final String name;
  final String location;
  final String startTime;
  final String endTime;
  final String thumbnailPath;

  const Meeting({
    this.name,
    this.location,
    this.startTime = "12:00",
    this.endTime = "12:00",
    this.thumbnailPath,
  });
}