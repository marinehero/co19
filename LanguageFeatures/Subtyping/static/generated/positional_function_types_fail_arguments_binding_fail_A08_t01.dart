/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Positional Function Types: T0 is U0 Function<X0 extends B00, ... ,
 * Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
 *
 *  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
 *  Sp yp, [Sp+1 yp+1, ..., Sq yq])
 *  and p >= n
 *  and m >= q
 *  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
 *  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 *  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 *  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 *
 * @description Check that if p > n and m < q then T0 is not a subtype of T1.
 * Test generic types.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Global function required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from positional_function_types_fail_A08.dart and 
 * arguments_binding_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class A {}

class C extends A {}

class U0<X, Y, Z> extends U1<X, Y, Z> {}

class U1<X, Y, Z> {}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class S0<X, Y, Z> extends V0<X, Y, Z> {}

class S1<X, Y, Z> extends V1<X, Y, Z> {}

class S2<X, Y, Z> extends V2<X, Y, Z> {}

class S3<X, Y, Z> extends V3<X, Y, Z> {}

typedef T0 = U0<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, num> x0, [V1<A, List, num> x1]);
typedef T1 = U1<A, List, num> Function<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    [S2<C, List<String>, int> y2, S3<C, List<String>, int> y3]);

U0<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, num> x0,[ V1<A, List, num> x1]) =>
    null;
U1<A, List, num> t1Func<X extends B0, Y extends B1>(
        S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
        [S2<C, List<String>, int> y2, S3<C, List<String>, int> y3]) =>
    null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;
bool isGenericFunctionType = true;



namedArgumentsFunc1(T1 t1, {T1 t2}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(T1 t1) {}

    ArgumentsBindingClass.named(T1 t1, {T1 t2}) {}
    ArgumentsBindingClass.positional(T1 t1, [T1 t2]) {}

    factory ArgumentsBindingClass.fNamed(T1 t1, {T1 t2}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(T1 t1, [T1 t2]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(T1 t1, {T1 t2}) {}
    static positionalArgumentsStaticMethod(T1 t1, [T1 t2]) {}

    namedArgumentsMethod(T1 t1, {T1 t2}) {}
    positionalArgumentsMethod(T1 t1, [T1 t2]) {}

    set testSetter(T1 val) {}
}

class ArgumentsBindingClassSuper {          //# 23: compile-time error
  ArgumentsBindingClassSuper(T1 t1) {}     //# 23: compile-time error
}                                           //# 23: compile-time error

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper { //# 23: compile-time error
  ArgumentsBindingDesc(T0 t0) : super (t0) {}                  //# 23: compile-time error
}                                                               //# 23: compile-time error

main() {
  namedArgumentsFunc1(t0Instance); //# 01: compile-time error
  namedArgumentsFunc1(t1Instance, t2: t0Instance); //# 02: compile-time error
  positionalArgumentsFunc1(t0Instance); //# 03: compile-time error
  positionalArgumentsFunc1(t1Instance, t0Instance); //# 04: compile-time error
  new ArgumentsBindingClass(t0Instance); //# 05: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance); //# 06: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance); //# 07: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance); //# 08: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance); //# 09: compile-time error
  new ArgumentsBindingClass(t1Instance).testSetter = t0Instance; //# 10: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance); //# 11: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance); //# 12: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance); //# 13: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance); //# 14: compile-time error
  new ArgumentsBindingClass.named(t0Instance); //# 15: compile-time error
  new ArgumentsBindingClass.named(t1Instance, t2: t0Instance); //# 16: compile-time error
  new ArgumentsBindingClass.positional(t0Instance); //# 17: compile-time error
  new ArgumentsBindingClass.positional(t1Instance, t0Instance); //# 18: compile-time error
  new ArgumentsBindingClass.fNamed(t0Instance); //# 19: compile-time error
  new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance); //# 20: compile-time error
  new ArgumentsBindingClass.fPositional(t0Instance); //# 21: compile-time error
  new ArgumentsBindingClass.fPositional(t1Instance, t0Instance); //# 22: compile-time error
  new ArgumentsBindingDesc(t0Instance); //# 23: compile-time error
}

