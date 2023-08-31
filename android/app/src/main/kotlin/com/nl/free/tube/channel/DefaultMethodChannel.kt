package com.nl.free.tube.channel

import android.os.Build
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DefaultMethodChannel(messenger: BinaryMessenger) : MethodChannel.MethodCallHandler {
    private var mChannel: MethodChannel

    init {
        mChannel =
            MethodChannel(messenger, "tuber.default.method.channel")
        mChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getAndroidSDKInt") {
            result.success(Build.VERSION.SDK_INT)
        }
    }
}