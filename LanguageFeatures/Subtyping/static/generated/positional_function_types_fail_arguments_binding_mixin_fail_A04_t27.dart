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
 * @description Check that if p > n and m < q then T0 is not a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super getter return
 * type is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from positional_function_types_fail_A04.dart and 
 * arguments_binding_mixin_fail_x27.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class U0 extends U1 {}
class U1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 extends V2 {}
class S3 extends V3 {}

typedef T0 = U0 Function(V0 x0, V1 x1, [V2 x2]);
typedef T1 = U1 Function(S0 y0, S1 y1, S2 y2, [S3 y3]);

U0 t0Func(V0 x0, V1 x1, [V2 x2]) => null;
U1 t1Func(S0 y0, S1 y1, S2 y2, [S3 y3]) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;



class ArgumentsBindingSuper1_t03 {
  T1 get superGetter => t0Instance;
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {
  test() {
    this.superGetter;
  }
}

main() {
  new ArgumentsBinding1_t03().test();
}
