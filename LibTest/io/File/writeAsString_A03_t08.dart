/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> writeAsString(
 *  String contents, {
 *  FileMode mode: FileMode.WRITE,
 *  Encoding encoding: UTF8,
 *  bool flush: false
 *  })
 * Write a string to a file.
 *
 * Opens the file, writes the string in the given encoding, and closes the file.
 * Returns a Future<File> that completes with this File object once the entire
 * operation has completed.
 *
 * By default writeAsString creates the file for writing and truncates the file
 * if it already exists. In order to append the bytes to an existing file, pass
 * FileMode.APPEND as the optional mode parameter.
 *
 * If the argument flush is set to true, the data written will be flushed to the
 * file system before the returned future completes.
 * @description Checks that in a FileMode.WRITE writeAsString creates the
 * file for writing and truncates the file if it already exists
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("Old content");
  asyncStart();
  String toWrite = "New content";
  file.writeAsString(toWrite, mode: FileMode.WRITE).then((f) {
    Expect.equals("New content", file.readAsStringSync());
    asyncEnd();
  }).whenComplete(() {
    file.delete();
  });
}
