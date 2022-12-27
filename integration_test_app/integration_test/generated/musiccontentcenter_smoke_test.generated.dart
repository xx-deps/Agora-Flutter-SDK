/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:integration_test_app/main.dart' as app;

void musicContentCenterSmokeTestCases() {
  testWidgets(
    'initialize',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String configurationAppId = "hello";
        const String configurationToken = "hello";
        const int configurationMccUid = 10;
        const MusicContentCenterConfiguration configuration =
            MusicContentCenterConfiguration(
          appId: configurationAppId,
          token: configurationToken,
          mccUid: configurationMccUid,
        );
        await musicContentCenter.initialize(
          configuration,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[initialize] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[initialize] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'renewToken',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String token = "hello";
        await musicContentCenter.renewToken(
          token,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[renewToken] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[renewToken] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'registerEventHandler',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        final MusicContentCenterEventHandler eventHandler =
            MusicContentCenterEventHandler(
          onMusicChartsResult: (String requestId,
              MusicContentCenterStatusCode status, List result) {},
          onMusicCollectionResult: (String requestId,
              MusicContentCenterStatusCode status, MusicCollection result) {},
          onLyricResult: (String requestId, String lyricUrl) {},
          onPreLoadEvent: (int songCode, int percent, PreloadStatusCode status,
              String msg, String lyricUrl) {},
        );
        musicContentCenter.registerEventHandler(
          eventHandler,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[registerEventHandler] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint(
            '[registerEventHandler] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'unregisterEventHandler',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        musicContentCenter.unregisterEventHandler();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[unregisterEventHandler] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint(
            '[unregisterEventHandler] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getMusicCharts',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        await musicContentCenter.getMusicCharts();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getMusicCharts] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint(
            '[getMusicCharts] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getMusicCollectionByMusicChartId',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int musicChartId = 10;
        const int page = 10;
        const int pageSize = 10;
        const String jsonOption = "hello";
        await musicContentCenter.getMusicCollectionByMusicChartId(
          musicChartId: musicChartId,
          page: page,
          pageSize: pageSize,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint(
              '[getMusicCollectionByMusicChartId] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint(
            '[getMusicCollectionByMusicChartId] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'searchMusic',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const String keyWord = "hello";
        const int page = 10;
        const int pageSize = 10;
        const String jsonOption = "hello";
        await musicContentCenter.searchMusic(
          keyWord: keyWord,
          page: page,
          pageSize: pageSize,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[searchMusic] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[searchMusic] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'preload',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        const String jsonOption = "hello";
        await musicContentCenter.preload(
          songCode: songCode,
          jsonOption: jsonOption,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[preload] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[preload] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'removeCache',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.removeCache(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[removeCache] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[removeCache] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getCaches',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int cacheInfoSize = 10;
        await musicContentCenter.getCaches(
          cacheInfoSize,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getCaches] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[getCaches] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'isPreloaded',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        await musicContentCenter.isPreloaded(
          songCode,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[isPreloaded] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[isPreloaded] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'getLyric',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();

      try {
        const int songCode = 10;
        const int lyricType = 10;
        await musicContentCenter.getLyric(
          songCode: songCode,
          lyricType: lyricType,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getLyric] error: ${e.toString()}');
        }
        expect(e is AgoraRtcException, true);
        debugPrint('[getLyric] errorcode: ${(e as AgoraRtcException).code}');
      }

      await musicContentCenter.release();
      await rtcEngine.release();
    },
//  skip: !(),
  );
}

