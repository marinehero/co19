/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> is a
 * subtype of T1 but S0 is not a subtype of a type T1, then a type T0 is not a
 * subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A01.dart and 
 * arguments_binding_fail_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

import "dart:async";

class S0 {}

FutureOr<S0> t0Instance = new S0();
Future<S0> t1Instance = new Future<S0>.value(new S0()); // S0 is not a subtype of T1 (T1 is Future<S0>)




class ArgumentsBindingSuper1_t02 {
  Future<S0> m;

  ArgumentsBindingSuper1_t02(Future<S0> value): m = value {}
  ArgumentsBindingSuper1_t02.named(Future<S0> value, {Future<S0> val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(Future<S0> value, [Future<S0> val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Future<S0> val) {}
  void superTestPositioned(Future<S0> val, [Future<S0> val2 = t1Default]) {}
  void superTestNamed(Future<S0> val, {Future<S0> val2 = t1Default}) {}
  Future<S0> get superGetter => forgetType(t0Instance);
  void set superSetter(Future<S0> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}): m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => forgetType(t0Instance);
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

main() {
  // test constructors
  Expect.throws(() {
    new ArgumentsBinding1_t02(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c5(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // test class members
  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestPositioned(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestNamed(t1Instance, val2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superGetter;
  }, (e) => e is TypeError);

  new ArgumentsBinding1_t02(t1Instance).test();

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic class constructors
  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>.c5(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // test generic class members
  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>(t1Instance).superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>(t1Instance).superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<Future<S0>>(t1Instance).superGetter;
  }, (e) => e is TypeError);

  new ArgumentsBinding2_t02<Future<S0>>(t1Instance).test();
  //# -->
}
