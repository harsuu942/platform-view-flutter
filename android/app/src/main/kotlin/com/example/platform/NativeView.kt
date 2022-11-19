package com.example.platform

import android.content.Context
import android.content.pm.ActivityInfo
import android.net.Uri
import android.view.*
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import android.webkit.WebView
import android.webkit.WebViewClient



internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger,
                          mainActivity: com.example.platform.MainActivity) : PlatformView,
    MethodChannel.MethodCallHandler {

    private var webView : WebView? = null

    override fun getView(): View? {
        return webView
    }


    override fun dispose() {

    }



    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

    }


    init {
        webView = WebView(context)
        initializeWeb(creationParams)

    }


    private fun initializeWeb(
        creationParams: Map<String?, Any?>?
    ) {

        val url = creationParams as Map<String?, Any?>?

        webView!!.webViewClient = WebViewClient()
        webView!!.settings.javaScriptEnabled = true
        webView?.loadUrl(Uri.parse(url?.get("webURL") as String?).toString())


    }



}