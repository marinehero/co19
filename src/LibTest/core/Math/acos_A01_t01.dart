/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the arc cosine of a value.
 * @description Checks returned values on various arguments.
 * @author msyabro
 * @reviewer pagolubev
 * @3rdparty sputnik-v1:S15.8.2.2_A5.js
 * @needsreview Returned value precision is not specified.
 * Checks exact match with values calculated with LibC.
 */

main() {
  int vnum = 64;
  var x = new List(64);
  x[0] = -1.00000000000000000000;
  x[1] = -0.96825396825396826000;
  x[2] = -0.93650793650793651000;
  x[3] = -0.90476190476190477000;
  x[4] = -0.87301587301587302000;
  x[5] = -0.84126984126984128000;
  x[6] = -0.80952380952380953000;
  x[7] = -0.77777777777777779000;
  x[8] = -0.74603174603174605000;
  x[9] = -0.71428571428571430000;
  x[10] = -0.68253968253968256000;
  x[11] = -0.65079365079365081000;
  x[12] = -0.61904761904761907000;
  x[13] = -0.58730158730158732000;
  x[14] = -0.55555555555555558000;
  x[15] = -0.52380952380952384000;
  x[16] = -0.49206349206349209000;
  x[17] = -0.46031746031746035000;
  x[18] = -0.42857142857142860000;
  x[19] = -0.39682539682539686000;
  x[20] = -0.36507936507936511000;
  x[21] = -0.33333333333333337000;
  x[22] = -0.30158730158730163000;
  x[23] = -0.26984126984126988000;
  x[24] = -0.23809523809523814000;
  x[25] = -0.20634920634920639000;
  x[26] = -0.17460317460317465000;
  x[27] = -0.14285714285714290000;
  x[28] = -0.11111111111111116000;
  x[29] = -0.07936507936507941600;
  x[30] = -0.04761904761904767200;
  x[31] = -0.01587301587301592800;
  x[32] = 0.01587301587301581700;
  x[33] = 0.04761904761904767200;
  x[34] = 0.07936507936507930500;
  x[35] = 0.11111111111111116000;
  x[36] = 0.14285714285714279000;
  x[37] = 0.17460317460317465000;
  x[38] = 0.20634920634920628000;
  x[39] = 0.23809523809523814000;
  x[40] = 0.26984126984126977000;
  x[41] = 0.30158730158730163000;
  x[42] = 0.33333333333333326000;
  x[43] = 0.36507936507936511000;
  x[44] = 0.39682539682539675000;
  x[45] = 0.42857142857142860000;
  x[46] = 0.46031746031746024000;
  x[47] = 0.49206349206349209000;
  x[48] = 0.52380952380952372000;
  x[49] = 0.55555555555555558000;
  x[50] = 0.58730158730158721000;
  x[51] = 0.61904761904761907000;
  x[52] = 0.65079365079365070000;
  x[53] = 0.68253968253968256000;
  x[54] = 0.71428571428571419000;
  x[55] = 0.74603174603174605000;
  x[56] = 0.77777777777777768000;
  x[57] = 0.80952380952380953000;
  x[58] = 0.84126984126984117000;
  x[59] = 0.87301587301587302000;
  x[60] = 0.90476190476190466000;
  x[61] = 0.93650793650793651000;
  x[62] = 0.96825396825396814000;
  x[63] = 1.00000000000000000000;

  var y = new List(64);
  y[0] = 3.14159265358979310000;
  y[1] = 2.88894492730522990000;
  y[2] = 2.78333143507717650000;
  y[3] = 2.70161669879887430000;
  y[4] = 2.63214880477790030000;
  y[5] = 2.57042415502425570000;
  y[6] = 2.51413688066660250000;
  y[7] = 2.46191883468154950000;
  y[8] = 2.41287920284638750000;
  y[9] = 2.36639928027943200000;
  y[10] = 2.32202832592153240000;
  y[11] = 2.27942559835728040000;
  y[12] = 2.23832577143072960000;
  y[13] = 2.19851714445280910000;
  y[14] = 2.15982729701117070000;
  y[15] = 2.12211329592677920000;
  y[16] = 2.08525480235608330000;
  y[17] = 2.04914909144415440000;
  y[18] = 2.01370737086853560000;
  y[19] = 1.97885200409617520000;
  y[20] = 1.94451437773781040000;
  y[21] = 1.91063323624901860000;
  y[22] = 1.87715336135181590000;
  y[23] = 1.84402450933553450000;
  y[24] = 1.81120054356415610000;
  y[25] = 1.77863871614824330000;
  y[26] = 1.74629906437061930000;
  y[27] = 1.71414389570026190000;
  y[28] = 1.68213734113586070000;
  y[29] = 1.65024496088003380000;
  y[30] = 1.61843338941929970000;
  y[31] = 1.58667000928485250000;
  y[32] = 1.55492264430494110000;
  y[33] = 1.52315926417049340000;
  y[34] = 1.49134769270975950000;
  y[35] = 1.45945531245393270000;
  y[36] = 1.42744875788953140000;
  y[37] = 1.39529358921917380000;
  
