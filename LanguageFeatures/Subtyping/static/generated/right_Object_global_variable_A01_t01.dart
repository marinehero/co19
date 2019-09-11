/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is an unpromoted type variable with bound B
 * and B <: Object then T0 is subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to global variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_Object_A01.dart and 
 * global_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class B {}
class T0 extends B {}

T0 t0Instance = new T0();
Object t1Instance = new Object();





class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
  }

  foo() {
    t1Instance = t0Instance;
  }

  static test() {
    t1Instance = t0Instance;
  }
}



test<T extends B>(T t0Instance) {
    
  bar () {
    t1Instance = t0Instance;
  }

  t1Instance = t0Instance;
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();

}

main() {
  test<T0>(t0Instance);
}