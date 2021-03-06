/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setUint16(
 *     int byteOffset,
 *     int value, [
 *     Endian endian = Endian.big
 * ])
 * ...
 * Throws [RangeError] if [byteOffset] is negative, or `byteOffset + 2` is
 * greater than the length of this object.
 * @description Checks that [RangeError] is thrown if `byteOffset + 2` is
 * greater than the length of this object.
 * @issue 12880
 * @issue 43196
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(5);
  Expect.throws(() { byteData.setUint16( 4, 0); }, (e) => e is RangeError);
  Expect.throws(() { byteData.setUint16(10, 0); }, (e) => e is RangeError);
}
