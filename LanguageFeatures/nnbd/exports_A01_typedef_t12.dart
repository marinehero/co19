/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function typedef with nullable type
 * parameter is exported from opted-in library to legacy library and then back
 * to the opted in code, typedef retains its status. Typedef is in the form
 * [typedef <typeIdentifier> <typeParameters> = <functionType>]. Check function
 * with argument.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_dynamic          <T>                   = void Function(T);
typedef exp_nullable_int     <T extends int?>      = void Function(T);
typedef exp_nullable_object  <T extends Object?>   = void Function(T);
typedef exp_nullable_function<T extends Function?> = void Function(T);
typedef exp_null             <T extends Null>      = void Function(T);
typedef exp_futureOr         <T extends FutureOr>  = void Function(T);

main() {
  Expect.equals(exp_nullable_int,      g_def_nullable_int_arg     );
  Expect.equals(exp_nullable_object,   g_def_nullable_object_arg  );
  Expect.equals(exp_dynamic,           g_def_dynamic_arg          );
  Expect.equals(exp_nullable_function, g_def_nullable_function_arg);
  Expect.equals(exp_null,              g_def_null_arg             );
  Expect.equals(exp_futureOr,          g_def_futureOr_arg         );
}
