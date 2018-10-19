/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixinMember production allows the same instance or static
 * members that a class would allow, but no constructors (for now).
 *
 * @description Checks that mixin declaration allows same instance or static
 * members that a class would allow. Test abstract members
 * @author ngl@unipro.ru
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {}
class C {}

mixin M<X extends num, Y extends num> on B, C implements I, J {
  static String s = "S.s";
  static String get gs => s;
  static set ss(String v) {
    s = v;
  }
  static String sf() => "S.sf()";

  Y i;
  Y get gi;
  set si(Y v);
  Y mi();
}

class A implements B, C, I, J {
}

class MA<X extends num, Y extends num> extends A with M<X, Y> {
  Y i = 2.0 as Y;
  Y get gi => i;
  set si(Y v) {
    i = v;
  }
  Y mi() => 22.0 as Y;
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA<int, double>();
  Expect.equals(2.0, ma.i);
  Expect.equals(22.0, ma.mi());
  Expect.equals(2.0, ma.gi);
  ma.si = 3.14;
  Expect.equals(3.14, ma.gi);

}