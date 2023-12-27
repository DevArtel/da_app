package io.devartel.da_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        const val CHANNEL_FLAVOR = "flavor_channel"

        const val METHOD_GET_FLAVOR = "getFlavor";
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_FLAVOR)
                .setMethodCallHandler { call, result ->
                    when (call.method) {
                        METHOD_GET_FLAVOR -> {
                            result.success(BuildConfig.FLAVOR)
                        }

                        else -> {
                            result.notImplemented()
                        }
                    }
                }
    }
}
