/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of a setter is obtained by appending the string ‘=’ 
 * to the identiﬁer given in its signature. Hence, a setter name can never
 * conﬂict with, override or be overridden by a getter or method.
 * @description Checks that there is no compile-time error if a class has 
 * an explicitly defined setter inherited from a superclass and an instance method with the same name.
 * @author iefremov
 */

class A {
  void set foo(var x){}
}

class C extends A {
  foo(value) {}
}

main() {
  C c=new C();
  c.foo(1);
  c.foo=1;
}
