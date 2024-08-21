import 'package:flutter/material.dart';

const xs = 2.0;
const sm = 4.0;
const med = 8.0;
const lg = 12.0;
const xl = 16.0;
const xxl = 24.0;

const boxXS = SizedBox(width: xs, height: xs);
const boxS = SizedBox(width: sm, height: sm);
const boxM = SizedBox(width: med, height: med);
const boxL = SizedBox(width: lg, height: lg);
const boxXL = SizedBox(width: xl, height: xl);
const boxXXL = SizedBox(width: xxl, height: xxl);
const boxFAB = SizedBox(height: 64.0);

const noWidget = Nil();

const paddingAllNone = EdgeInsets.zero;
const paddingAllXS = EdgeInsets.all(xs);
const paddingAllS = EdgeInsets.all(sm);
const paddingAllM = EdgeInsets.all(med);
const paddingAllL = EdgeInsets.all(lg);
const paddingAllXL = EdgeInsets.all(xl);
const paddingAllXXL = EdgeInsets.all(xxl);

const noPadding = EdgeInsets.all(0);

final radiusS = BorderRadius.circular(sm);
final radiusM = BorderRadius.circular(med);
final radiusL = BorderRadius.circular(lg);
final radiusXL = BorderRadius.circular(xl);

enum ScreenSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

const breakPoints = [
  450,
  768,
  1024,
  1440,
  1920,
];

/// Pass either a width or height to get a size category in that dimension.
ScreenSize getScreenSize(double dimension) {
  for (int i = 0; i < breakPoints.length; i++) {
    if (dimension < breakPoints[i]) {
      return ScreenSize.values[i];
    }
  }

  return ScreenSize.xl;
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class Nil extends Widget {
  const Nil({super.key});

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nil super.widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    super.performRebuild();
  }
}
