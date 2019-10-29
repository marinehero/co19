/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 * @description Check that overriding works as expected in a migrated library -
 * test that migrated getter with null annotations can override legacy getter
 * ([with] clause).
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class A1 with A {
  int? aField1 = 1;
  int? aField2 = null;
  int? aField3;
  int? get get_field1 => aField1;
  int? get get_field2 => aField2;
  int? get get_field3 => aField3;
}

main() {
  A1 a1 = A1();
  Expect.equals(1, a1.get_field1);
  Expect.isNull(a1.get_field2);
  Expect.isNull(a1.get_field3);
}