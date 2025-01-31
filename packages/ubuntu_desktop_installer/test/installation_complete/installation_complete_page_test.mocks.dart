// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_desktop_installer/test/installation_complete/installation_complete_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductInfo_0 extends _i1.SmartFake implements _i2.ProductInfo {
  _FakeProductInfo_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InstallationCompleteModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstallationCompleteModel extends _i1.Mock
    implements _i3.InstallationCompleteModel {
  MockInstallationCompleteModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductInfo get productInfo => (super.noSuchMethod(
        Invocation.getter(#productInfo),
        returnValue: _FakeProductInfo_0(
          this,
          Invocation.getter(#productInfo),
        ),
      ) as _i2.ProductInfo);
  @override
  _i4.Future<void> reboot() => (super.noSuchMethod(
        Invocation.method(
          #reboot,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
