/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectory
 * final
 * Is true if the event target was a directory.
 * @description Checks that this property returns true if the event target was a
 * directory. Test link
 * @issue 30359
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main, delay: 2);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);
  asyncStart();

  dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemCreateEvent) {
      Expect.isFalse(event.isDirectory);
      asyncEnd();
    }
  });
  getTempLink(parent: dir, target: target.path);
}
