/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 * If the literal is constant, the list is canonicalized and immutable,
 * otherwise it is not.
 * @description Checks that constant list is cannonicalized and immutable.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

import "../../Utils/expect.dart";

const List list1 = [1, 2, 3, 4, 5];
const List list2 = [];

const Set set1 = {1, 2, 3, 4, 5};
const Set set2 = {};

main() {
  const List res1 = [...list1];
  Expect.equals(list1, res1);
  Expect.throws(() => res1.add(123));

  const List res2 = [...set1];
  Expect.equals(list1, res2);
  Expect.throws(() => res2[0]++);

  const List res3 = [...list2];
  Expect.equals(list2, res3);
  Expect.throws(() => res3.add(123));

  const List res4 = [...set2];
  Expect.equals(list2, res4);
  Expect.throws(() => res4.clear());
}
