/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is not
 * a subtype of types Future<S1> or S1, then a type T0 is not a subtype of a
 * type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super method named
 * argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_fail_A01.dart and 
 * arguments_binding_mixin_fail_x21.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class S1 {}
class T0 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class ArgumentsBindingSuper1_t03 {
  void superTestNamed(FutureOr<S1> val, {FutureOr<S1> val2}) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {
  test() {
    this.superTestNamed(t1Instance, val2: t0Instance);
  }
}

main() {
  new ArgumentsBinding1_t03().test();
}
