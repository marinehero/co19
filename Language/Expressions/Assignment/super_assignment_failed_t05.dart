/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form super.v = e proceeds as
 * follows:
 * Let g be the method currently executing, and let C be the class in which
 * g was looked up. Let Sdynamic be the superclass of C.
 * ...
 * If the setter lookup has failed, then a new instance im of the predefined
 * class Invocation is created, such that :
 *  • im.isSetter evaluates to true.
 *  • im.memberName evaluates to the symbol v=.
 *  • im.positionalArguments evaluates to an immutable list with the same values
 *    as [o].
 *  • im.namedArguments evaluates to the value of const {}.
 *  Then the method noSuchMethod() is looked up in Sdynamic and invoked
 *  with argument im.  However, if the implementation found cannot be invoked
 *  with a single positional argument, the implementation of noSuchMethod()
 *  in class Object is invoked on this
 * @description Checks that if there is no setter v= in class Sdynamic and no
 * method noSuchMethod then the implementation of noSuchMethod() in class Object
 * is invoked on this, that results in NoSuchMethodError. Test the case when
 * class C has its own implementation of noSuchMethod()
 * @author sgrekhov@unipro.ru
 * @issue 25671
 */
import '../../../Utils/expect.dart';

class A {
  noSuchMethod() { /// static type warning
    //Expect.fail("Wrong noSuchMethod() should not be called");
    throw new Exception("Wrong noSuchMethod() should not be called");
  }
}

class C extends A {
  test() {
    super.v = 1; /// static type warning
  }
}

main() {
  C c = new C();
  c.test();
}
