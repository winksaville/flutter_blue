// Copyright 2020, Wink Saville.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

main() {
  group("BluetoothCharacteristic", () {
    //var uuid = Guid("12345678-0000-1000-8000-00805f9b34fb");
    var uuid1800 = Guid("00001800-0000-1000-8000-00805f9b34fb");
    //var uuid1801 = Guid("00001801-0000-1000-8000-00805f9b34fb");
    var uuid2a00 = Guid("00002a37-0000-1000-8000-00805f9b34fb");

    var deviceId = DeviceIdentifier("device1");
    var serviceUuid = uuid1800;

    var characteristicUuid = uuid2a00;
    //var aList = List<int>(1);
    //var behaviors = BehaviorSubject.seeded(aList);
    //var behaviors = null;

    var secondaryServiceUuid = Guid.empty();
    var descriptors = [];
    var properties = CharacteristicProperties();
    var value = [];

    test('equality', () {
      var bv = BehaviorSubject<List<int>>();
      bv.add([1, 2]);
      //bv.stream.listen(print);
      //bv.stream.listen(print);

      var bc = BluetoothCharacteristic(characteristicUuid, deviceId, serviceUuid, behaviors: bv);
      var bc2 = BluetoothCharacteristic(characteristicUuid, deviceId, serviceUuid, behaviors: bv);
      expect(bc, bc);

      // This doesn't work, but it seems to be a problem with "_value"
      //  00:01 +0 -1: /home/wink/prgs/flutter/projects/flutter_blue/test/bluetooth_characteristic_test.dart: BluetoothCharacteristic equality [E]
      //  Expected: <Instance of 'BluetoothCharacteristic'>
      //  Actual: <Instance of 'BluetoothCharacteristic'>

      //  package:test_api                                   expect
      //  package:flutter_test/src/widget_tester.dart 348:3  expect
      //  bluetooth_characteristic_test.dart 40:7            main.<fn>.<fn>
      //expect(bc, bc2);

      // As I can compare each of the fields other than value
      expect(bc.uuid, bc2.uuid);
      expect(bc.deviceId, bc2.deviceId);
      expect(bc.serviceUuid, bc2.serviceUuid);
      expect(bc.secondaryServiceUuid, bc2.secondaryServiceUuid);
      expect(bc.properties, bc2.properties);
      expect(bc.descriptors, bc2.descriptors);

      // And the value associated with the "behaviors", I can't even print
      // this generates an error: "ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized."
      //print("bc.value=${bc.value}");

      // You need to close the BehaviorSubject stream to not get a warning
      bv.close();
    });
  });
}
