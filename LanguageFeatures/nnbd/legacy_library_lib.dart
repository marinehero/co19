/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// @dart=2.4
// SharedOptions=--enable-experiment=non-nullable
library legacy_library_lib;

class A implements AMx {
  int c1 = 0, c2 = 0;
  String get log => "test() called $c1 times, text2 called $c2 times";

  void foo() {}
  String test() {
    c1++;
    return "Lily was here";
  }
  String text = "Let it be";
  String get text2 {
    c2++;
    return text;
  }
  void set text3(String val) {
    this.text = val;
  }
  int operator[](int index) => index;
  void operator[]=(int index, var value) => value;

  AMx c = new AMx();
}

class C<X extends A> {
  X x;
  C(this.x);
}

class M {
}

class Mx {
  int iMx = 42;
}

class AMx {
  String text = "No woman, no cry";
}

mixin Mxn on AMx {
  String sMxn = "Show must go on";
}

abstract class I {}

class Const {
  const Const();
}

int iLegacy = 42;
String sLegacy = "Yesterday, All my troubles seemed so far away";
A aLegacy = new A();

class S {}

S getLegacyS() => null;

dynamic getLegscyDynamic(x) => x;

Null getLegscyNull() => null;