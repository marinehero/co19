/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the character of [charCode].
 * This method is equivalent to [write(new String.fromCharCode(charCode))].
 * @description Checks that correct char code is written to the result stream
 * for the [0...127] range.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

String getExpected() {
  String res = "";
  for(int i = 0; i < 128; i++) {
    res = res + new String.fromCharCode(i);
  };
  return res;
}

run_process(IOSink sink) {
  for(int i = 0; i < 128; i++) {
    sink.writeCharCode(i);
  };
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  bool called = false;
  await Process.run(executable, [eScript, mode]).then((ProcessResult results) {
    Expect.equals(getExpected(),
        mode == "err" ? results.stderr : results.stdout);
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
