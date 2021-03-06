/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33805 (Analyzer throws error when
 * try to assign a function result to row variable).
 * @Issue 33805
 * @author iarkh@unipro.ru
 */
class A<X> {}
X testme<X extends A<X>>(dynamic x) => x;

main() {
  A a = testme(new A());              //# 01: compile-time error
  A<A> a1 = testme(new A<A>());       //# 02: compile-time error
  A<A<A>> a2 = testme(new A<A<A>>()); //# 03: compile-time error
}
