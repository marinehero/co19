/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the declared return type of a function
 * marked sync* may not be assigned to Iterable. It is a static warning if
 * the declared return type of a function marked async* may not be assigned
 * to Stream.
 *
 * @description Check that it is a compile error, if the declared
 * return type of a function marked async* may not be assigned to Stream but is
 * void.
 * @issue 32192
 * @compile-error
 * @author a.semenov@unipro.ru
 */

void h() async* { }

main() {
  h();
}
