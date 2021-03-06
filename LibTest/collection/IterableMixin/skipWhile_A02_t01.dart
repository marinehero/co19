/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the [test] method is not called when [skipWhile] is
 * executed.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

bool test(var value) {
  Expect.fail("test($value) called");
  return false;
}

main() {
  new MyIterable([]).skipWhile(test);
  new MyIterable([1]).skipWhile(test);
  new MyIterable([1, 3, 7, 4, 5, 6]).skipWhile(test);
}
