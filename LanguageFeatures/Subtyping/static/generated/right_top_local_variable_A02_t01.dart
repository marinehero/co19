/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a dynamic then T0 is a subtype of a
 * type T1
 * @author sgrekhov@unipro.ru
 */
import '../../utils/common.dart';

class T0 {}

T0 t0Instance = new T0();
dynamic t1Instance = 3.14;




class LocalVariableTest {

  LocalVariableTest() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  dynamic t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
