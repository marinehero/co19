/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an interface is a superinterface
 * of itself.
 * @description Checks that it is a compile-time error if a generic interface
 * is a superinterface of itself.
 * @compile-error
 * @author rodionov
 */

abstract class I<T> implements I<T> {}

class A implements I {}

main() {
  new A();
}

