// ignore: avoid_web_libraries_in_flutter
import 'dart:js_interop';

import 'package:agora_rtc_engine/src/binding_forward_export.dart';
import 'package:agora_rtc_engine/src/impl/platform/web/iris_web_rtc_bindings_js.dart';
import 'package:iris_method_channel/iris_method_channel.dart';
import 'package:iris_method_channel/iris_method_channel_bindings_web.dart'
    as js;

// ignore_for_file: public_member_api_docs

class IrisApiEngineBindingsDelegateJS
    extends PlatformBindingsDelegateInterface {
  @override
  void initialize() {}

  @override
  CreateApiEngineResult createApiEngine(List<InitilizationArgProvider> args) {
    final apiEnginePtr = js.createIrisApiEngine();
    final irisApiEngineHandle = IrisApiEngineHandle(apiEnginePtr);
    InitIrisRtcOptions? options;
    // Only set the option in debug mode
    assert(() {
      if (args.isNotEmpty) {
        final arg = args[0].provide(irisApiEngineHandle)();
        options = InitIrisRtcOptions(irisRtcEngine: arg as JSAny?);
      }

      return true;
    }());
    initIrisRtc(apiEnginePtr, options);

    final res = CreateApiEngineResult(irisApiEngineHandle);

    return res;
  }

  static const _skipCalls = ['CreateIrisRtcRendering'];

  @override
  int callApi(
    IrisMethodCall methodCall,
    IrisApiEngineHandle apiEnginePtr,
    IrisApiParamHandle param,
  ) {
    throw UnimplementedError('Sync call of `callApi` is not supported on js');
  }

  @override
  Future<CallApiResult> callApiAsync(
    IrisMethodCall methodCall,
    IrisApiEngineHandle apiEnginePtr,
    IrisApiParamHandle param,
  ) async {
    final nApiEnginePtr = apiEnginePtr() as js.IrisApiEngine;

    final jsBuffer = <JSAny?>[];
    final jsLength = <JSNumber>[];
    if (methodCall.buffers != null) {
      for (final rb in methodCall.buffers!) {
        jsBuffer.add(rb.toJS);
        jsLength.add(rb.length.toJS);
      }
    }
    if (methodCall.rawBufferParams != null) {
      for (final rb in methodCall.rawBufferParams!) {
        jsBuffer.add(_rawBufferValueToJS(rb.intPtr()));
        jsLength.add(rb.length.toJS);
      }
    }

    final nParam = js.EventParam(
      event: methodCall.funcName,
      data: methodCall.params,
      data_size: methodCall.params.length,
      result: '',
      // `EventParam.buffer` is declared as `JSArray<JSObject>` upstream, but
      // a raw buffer param can also be a JS string (the platform view div id),
      // so the array is created with `JSAny?` elements and cast here.
      buffer: jsBuffer.toJS as JSArray<JSObject>,
      length: jsLength.toJS,
      buffer_count: jsBuffer.length,
    );

    if (_skipCalls.contains(methodCall.funcName)) {
      debugPrint('[callApiAsync]: ${methodCall.funcName} is skipped.');
      return CallApiResult(irisReturnCode: 0, data: {'result': 0});
    }

    // The JS side returns a `Promise`, convert it to a Dart `Future` so this
    // also works when compiled to Wasm, where `dart:js_util.promiseToFuture`
    // is not available and awaiting a native JS Promise does not work.
    final jsPromise = (js.callIrisApi(nApiEnginePtr, nParam)
            as JSPromise<js.CallIrisApiResult>)
        .toDart;

    final js.CallIrisApiResult irisApiResult = await jsPromise;

    return irisApiResult.toCallApiResult();
  }

  @override
  IrisEventHandlerHandle createIrisEventHandler(
    IrisCEventHandlerHandle eventHandler,
  ) {
    return IrisEventHandlerHandle(
        js.createIrisEventHandler(eventHandler() as js.IrisCEventHandler));
  }

  @override
  void destroyIrisEventHandler(
    IrisEventHandlerHandle handler,
  ) {}

  @override
  void destroyNativeApiEngine(IrisApiEngineHandle apiEnginePtr) {
    js.disposeIrisApiEngine(apiEnginePtr() as js.IrisApiEngine);
  }
}

/// Converts the value of a raw buffer param to a JS value.
///
/// On web the value is one of:
/// * a `String`, the platform view div id (see
///   `GlobalVideoViewControllerWeb.waitAndGetId`);
/// * a JS object, i.e. the `IrisEventHandler` created by
///   `IrisMethodChannelInternalWeb.initilize`, which is passed back when
///   registering/unregistering event handlers;
/// * a Dart event handler callback (`IrisCEventHandler`).
JSAny? _rawBufferValueToJS(Object value) {
  if (value is String) return value.toJS;
  if (value is js.IrisCEventHandler) return value.toJS;

  // Handles created by the JS bindings (e.g. `IrisEventHandler`) are already
  // JS values, but `IrisHandle` stores them as `Object`. Avoid `is JSObject`:
  // runtime checks between `Object` and JS interop types are not
  // platform-consistent between dart2js and dart2wasm (see the
  // `invalid_runtime_check_with_js_interop_types` lint). Use `isA` on the
  // JS value instead.
  final jsValue = value as JSAny?;
  if (jsValue.isA<JSAny>()) return jsValue;

  throw ArgumentError.value(
      value.runtimeType, 'value', 'Unsupported raw buffer param type');
}

class IrisApiEngineNativeBindingDelegateProviderWeb
    extends PlatformBindingsProvider {
  @override
  PlatformBindingsDelegateInterface provideNativeBindingDelegate() {
    return IrisApiEngineBindingsDelegateJS();
  }
}
