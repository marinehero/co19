/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int type
 *  final
 * The type of event. See FileSystemEvent for a list of events.
 * @description Checks that this property returns type of event. Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main, delay: 2);
}

_main(Directory sandbox) async {
  Directory d = getTempDirectorySync(parent: sandbox);
  asyncStart();
  bool first = true;
  sandbox.watch().listen((FileSystemEvent event) {
    if (event is FileSystemDeleteEvent) {
      if (first) {
        first = false;
        Expect.equals(FileSystemEvent.delete, event.type);
        asyncEnd();
      }
    }
  });
  d.delete();
}
