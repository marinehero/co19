/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int8List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * ...
 * Throws [RangeError] if [offsetInBytes] or [length] are negative, or
 * if [offsetInBytes] + ([length] * elementSizeInBytes) is greater than
 * the length of [buffer].
 * @description Checks that [RangeError] is thrown if [offsetInBytes] is
 * negative.
 * @author msyabro
 * @issue 43196
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset) {
  var tmp = new Int8List.fromList(array);
  var byteBuffer = tmp.buffer;
  Expect.throws(
          () { Int8List.view(byteBuffer, offset); }, (e) => e is RangeError);
}

main() {
  check([0], -5);
  check([100, 50], -100);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], -1);
}
