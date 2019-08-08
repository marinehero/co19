/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call an expression whose type is potentially
 * nullable and not dynamic.
 *
 * @description Check that it is a compile-time error to call an expression
 * whose type is potentially nullable and not dynamic.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class A {
}

class C<X extends A?> {
  X x;
  C(this.x);

  X get xgetter => x;
  X method() => x;

  test() {
    this.x;             //# 01: compile-time error
    this.xgetter;       //# 02: compile-time error
    this.method();      //# 03: compile-time error
  }
}

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
  c.test();
}
