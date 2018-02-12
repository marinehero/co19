/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Returns the first element of the stream.
 * @description Checks that [first] returns non-read elements.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  stdin.readLineSync();
  stdin.first.then((List<int> l) { print(new String.fromCharCodes(l)); });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
        process.stdin.writeln("Testme");
        process.stdin.writeln("12345");
      await process.exitCode.then((_) async {
        process.stderr.toList().then((errors){ Expect.isTrue(errors.isEmpty); });
        await process.stdout.toList().then((out) {
          String res = SYSTEM_ENCODING.decode(out[0]);
          // Get rid from possible new line symbols here
          Expect.equals("12345", res.trimRight());
          called++;
        });
      });
    });
  Expect.equals(1, called);
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
