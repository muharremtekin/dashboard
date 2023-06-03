import 'package:flutter/material.dart';

enum Sizes {
  size4(4),
  size6(6),
  size8(8),
  size10(10),
  size12(12),
  size14(14),
  size16(16),
  size18(18),
  size20(20),
  size22(22),
  size24(24),
  size26(26),
  size28(28),
  size30(30),
  size32(32),
  size34(34),
  size35(35),
  size40(40),
  size64(64),
  size72(72),
  size80(80),
  size96(96),
  size128(128);

  final double size;
  const Sizes(this.size);

  EdgeInsets get getEdgeInsetsSymetricVertical =>
      EdgeInsets.symmetric(vertical: size);
  EdgeInsets get getEdgeInsetsSymetricHorizontal =>
      EdgeInsets.symmetric(horizontal: size);
}
