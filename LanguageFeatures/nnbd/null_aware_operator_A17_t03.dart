/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A null-shorting cascade expression e?..s translates as follows,
 * where x and y are fresh object level variables.
 *  fn[k : Exp -> Exp] : Exp =>
 *  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
 *
 * @description Check that a null-shorting cascade expression e?..s translates
 * as follows, where x and y are fresh object level variables.
 *  fn[k : Exp -> Exp] : Exp =>
 *  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
  String test = "Let it be";
}

typedef AAlias1 = A?;
typedef AAlias2 = A;

main() {
  AAlias1 a1 = null;
  Expect.isNull(a1 ?.. test = "Lily was here");
  Expect.isNull(a1);
  a1 = new A();
  Expect.equals(a1, a1 ?.. test = "Lily was here");
  Expect.equals("Lily was here", a1?.test);

  AAlias2 a2 = new A();
  Expect.equals(a2, a2 ?.. test = "Lily was here");    /// static type warning
  Expect.equals("Lily was here", a2.test);
}
