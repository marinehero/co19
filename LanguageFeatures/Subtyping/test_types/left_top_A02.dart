/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Top: if T0 is dynamic or void then T0 <: T1 if Object? <: T1
 * @description Check that if type T0 is void and Object? <: T1 then T0 is a
 * subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class T1 {}

void t0Instance = "Show must go on";
T1? t1Instance = new T1();

//# @T0 = Void
//# @T1 = Object?
