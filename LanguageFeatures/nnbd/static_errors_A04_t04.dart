/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable, static variable, or
 * instance field with potentially non-nullable type has no initializer
 * expression and is not initialized in a constructor via an initializing formal
 * or an initializer list entry, unless the variable or field is marked with the
 * 'late' modifier.
 *
 * @description Check that it is no compile-time error if a top level variable
 * with potentially non-nullable type has no initializer expression but this
 * variable is marked with the 'late' modifier
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class A {}

late A a;
late String s;
late int i;
late bool b;

final late A aa;
final late String ss;
final late int ii;
final late bool bb;

main() {
}
