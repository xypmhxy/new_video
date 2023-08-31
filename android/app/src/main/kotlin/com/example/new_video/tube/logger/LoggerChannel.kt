package com.example.new_video.tube.logger

import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class LoggerChannel(messenger: BinaryMessenger) : MethodChannel.MethodCallHandler {
    private var mLogChannel: MethodChannel
    init {
        mLogChannel =
            MethodChannel(messenger, "free.tuber.log.plugin")
        mLogChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val params = call.arguments as Map<String, Any>
        val tag = params["tag"] as String?
        val msg = params["msg"] as String? ?: ""
        when (call.method) {
            "logI" -> {
                Log.i(tag, msg)
            }

            "logD" -> {
                Log.d(tag, msg)
            }

            "logW" -> {
                Log.w(tag, msg)
            }

            "logE" -> {
                Log.e(tag, msg)
            }
        }
        result.success(true)
    }
}