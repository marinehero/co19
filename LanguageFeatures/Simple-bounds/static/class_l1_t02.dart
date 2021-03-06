/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that simple bounds are correct for lists and maps
 * parameters: [A<X extends List>], [B<X extends Map>]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../../Utils/expect.dart";

class A<X extends List> {}
class B<X extends Map> {}

testA(A source) {
  var fsource = toF(source);

  F<A<List>> target1 = fsource;
  F<A<List<dynamic>>> target2 = fsource;

  F<A<List<int>>> target3 = fsource;
//                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<List<Null>>> target4 = fsource;
//                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<List<Never>>> target5 = fsource;
//                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A();
}

testB(B source) {
   var fsource = toF(source);

  F<B<Map>> target = fsource;
  F<B<Map<dynamic, dynamic>>> target1 = fsource;

  F<B<Map>> target2 = fsource;
  F<B<Map<dynamic, dynamic>>> target3 = fsource;

 F<B<Map<int, dynamic>>> target4 = fsource;
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<dynamic, int>>> target5 = fsource;
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<int, Null>>> target6 = fsource;
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<Null, int>>> target7 = fsource;
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<int, int>>> target8 = fsource;
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<Null, Null>>?>? target9 = fsource;
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<Never, Never>>> target10 = fsource;
//                                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  B();
}

main() {}
