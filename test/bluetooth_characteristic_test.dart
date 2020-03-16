// Copyright 2020, Wink Saville.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

main() {
  group("BluetoothCharacteristic", () {
    var uuid1800 = Guid("00001800-0000-1000-8000-00805f9b34fb");
    var uuid2a00 = Guid("00002a37-0000-1000-8000-00805f9b34fb");

    var deviceId = DeviceIdentifier("device1");
    var serviceUuid = uuid1800;
    var characteristicUuid = uuid2a00;

    test('equality and hashCode', () {
      var bv = BehaviorSubject<List<int>>();
      try {
        bv.add([1, 2]);

        var bc =
            BluetoothCharacteristic(characteristicUuid, deviceId, serviceUuid);
        var bc2 = BluetoothCharacteristic(
            characteristicUuid, deviceId, serviceUuid,
            behaviors: bv);
        expect(bc, bc);
        expect(bc.hashCode, bc2.hashCode);
        expect(bc, bc2);
        expect(bc.hashCode, bc2.hashCode);
      } finally {
        // You need to close the BehaviorSubject stream to not get a warning
        bv.close();
      }
    });
  });
}
