.class public Lorg/apache/cordova/engine/SystemWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SystemWebViewClient.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SystemWebViewClient"


# instance fields
.field private authenticationTokens:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/AuthenticationToken;",
            ">;"
        }
    .end annotation
.end field

.field private doClearHistory:Z

.field isCurrentlyLoading:Z

.field protected final parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .registers 3
    .param p1, "parentEngine"    # Lorg/apache/cordova/engine/SystemWebViewEngine;

    .prologue
    .line 68
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    .line 66
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    .line 69
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 70
    return-void
.end method

.method private static needsKitKatContentUrlFix(Landroid/net/Uri;)Z
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 385
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_14

    const-string v0, "content"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private static needsSpecialsInAssetUrlFix(Landroid/net/Uri;)Z
    .registers 5
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 389
    invoke-static {p0}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v2

    if-eq v2, v1, :cond_9

    .line 405
    :cond_8
    :goto_8
    return v0

    .line 392
    :cond_9
    invoke-virtual {p0}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_15

    invoke-virtual {p0}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_17

    :cond_15
    move v0, v1

    .line 393
    goto :goto_8

    .line 396
    :cond_17
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 400
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    packed-switch v2, :pswitch_data_2c

    goto :goto_8

    :pswitch_29
    move v0, v1

    .line 403
    goto :goto_8

    .line 400
    nop

    :pswitch_data_2c
    .packed-switch 0xe
        :pswitch_29
        :pswitch_29
    .end packed-switch
.end method


# virtual methods
.method public clearAuthenticationTokens()V
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 350
    return-void
.end method

.method public getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;

    .prologue
    .line 324
    const/4 v0, 0x0

    .line 325
    .local v0, "token":Lorg/apache/cordova/AuthenticationToken;
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 327
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    if-nez v0, :cond_2d

    .line 329
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 332
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    if-nez v0, :cond_21

    .line 333
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v1, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 337
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    :cond_21
    if-nez v0, :cond_2d

    .line 338
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 342
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    :cond_2d
    return-object v0
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 162
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 164
    iget-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    if-nez v0, :cond_11

    const-string v0, "about:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 181
    :goto_10
    return-void

    .line 167
    :cond_11
    iput-boolean v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    .line 175
    iget-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    if-eqz v0, :cond_1c

    .line 176
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 177
    iput-boolean v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    .line 179
    :cond_1c
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onPageFinishedLoading(Ljava/lang/String;)V

    goto :goto_10
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 145
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 146
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    .line 148
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->bridge:Lorg/apache/cordova/CordovaBridge;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaBridge;->reset()V

    .line 149
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onPageStarted(Ljava/lang/String;)V

    .line 150
    return-void
.end method

.method public onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V
    .registers 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "request"    # Landroid/webkit/ClientCertRequest;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 124
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    .line 125
    .local v0, "pluginManager":Lorg/apache/cordova/PluginManager;
    if-eqz v0, :cond_1a

    const/4 v1, 0x0

    new-instance v2, Lorg/apache/cordova/CordovaClientCertRequest;

    invoke-direct {v2, p2}, Lorg/apache/cordova/CordovaClientCertRequest;-><init>(Landroid/webkit/ClientCertRequest;)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/PluginManager;->onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 126
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    .line 132
    :goto_19
    return-void

    .line 131
    :cond_1a
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V

    goto :goto_19
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 195
    iget-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    if-nez v0, :cond_5

    .line 214
    :goto_4
    return-void

    .line 198
    :cond_5
    const-string v0, "SystemWebViewClient"

    const-string v1, "CordovaWebViewClient.onReceivedError: Error code=%s Description=%s URL=%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 203
    const/16 v0, -0xa

    if-ne p2, v0, :cond_34

    .line 204
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    .line 206
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 207
    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    goto :goto_4

    .line 210
    :cond_31
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 213
    :cond_34
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0, p2, p3, p4}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_4
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/HttpAuthHandler;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "realm"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-virtual {p0, p3, p4}, Lorg/apache/cordova/engine/SystemWebViewClient;->getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;

    move-result-object v1

    .line 94
    .local v1, "token":Lorg/apache/cordova/AuthenticationToken;
    if-eqz v1, :cond_12

    .line 95
    invoke-virtual {v1}, Lorg/apache/cordova/AuthenticationToken;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/cordova/AuthenticationToken;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    :goto_11
    return-void

    .line 100
    :cond_12
    iget-object v2, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v2, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    .line 101
    .local v0, "pluginManager":Lorg/apache/cordova/PluginManager;
    if-eqz v0, :cond_2c

    const/4 v2, 0x0

    new-instance v3, Lorg/apache/cordova/CordovaHttpAuthHandler;

    invoke-direct {v3, p2}, Lorg/apache/cordova/CordovaHttpAuthHandler;-><init>(Landroid/webkit/HttpAuthHandler;)V

    invoke-virtual {v0, v2, v3, p3, p4}, Lorg/apache/cordova/PluginManager;->onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 102
    iget-object v2, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v2, v2, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    goto :goto_11

    .line 107
    :cond_2c
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_11
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .registers 9
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/SslErrorHandler;
    .param p3, "error"    # Landroid/net/http/SslError;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 231
    move-object v2, p2

    .line 232
    .local v2, "mHandler":Landroid/webkit/SslErrorHandler;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v3, v3, Lorg/apache/cordova/engine/SystemWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 233
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v3, "\u8be5\u7f51\u7ad9\u8bc1\u4e66\u5b58\u5728\u5b89\u5168\u98ce\u9669\uff0c\u662f\u5426\u7ee7\u7eed\u8bbf\u95ee"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 234
    const-string v3, "\u7ee7\u7eed"

    new-instance v4, Lorg/apache/cordova/engine/SystemWebViewClient$1;

    invoke-direct {v4, p0, v2}, Lorg/apache/cordova/engine/SystemWebViewClient$1;-><init>(Lorg/apache/cordova/engine/SystemWebViewClient;Landroid/webkit/SslErrorHandler;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 240
    const-string v3, "\u53d6\u6d88"

    new-instance v4, Lorg/apache/cordova/engine/SystemWebViewClient$2;

    invoke-direct {v4, p0, v2}, Lorg/apache/cordova/engine/SystemWebViewClient$2;-><init>(Lorg/apache/cordova/engine/SystemWebViewClient;Landroid/webkit/SslErrorHandler;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 246
    new-instance v3, Lorg/apache/cordova/engine/SystemWebViewClient$3;

    invoke-direct {v3, p0, v2}, Lorg/apache/cordova/engine/SystemWebViewClient$3;-><init>(Lorg/apache/cordova/engine/SystemWebViewClient;Landroid/webkit/SslErrorHandler;)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 257
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 258
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 277
    return-void
.end method

.method public removeAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    return-object v0
.end method

.method public setAuthenticationToken(Lorg/apache/cordova/AuthenticationToken;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "authenticationToken"    # Lorg/apache/cordova/AuthenticationToken;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "realm"    # Ljava/lang/String;

    .prologue
    .line 288
    if-nez p2, :cond_4

    .line 289
    const-string p2, ""

    .line 291
    :cond_4
    if-nez p3, :cond_8

    .line 292
    const-string p3, ""

    .line 294
    :cond_8
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .registers 13
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 358
    :try_start_1
    iget-object v5, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v5, v5, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v5, p2}, Lorg/apache/cordova/PluginManager;->shouldAllowRequest(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 359
    const-string v5, "SystemWebViewClient"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "URL blocked by whitelist: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    new-instance v5, Landroid/webkit/WebResourceResponse;

    const-string v7, "text/plain"

    const-string v8, "UTF-8"

    const/4 v9, 0x0

    invoke-direct {v5, v7, v8, v9}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 380
    :goto_29
    return-object v5

    .line 364
    :cond_2a
    iget-object v5, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v3, v5, Lorg/apache/cordova/engine/SystemWebViewEngine;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    .line 365
    .local v3, "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 367
    .local v1, "origUri":Landroid/net/Uri;
    invoke-virtual {v3, v1}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 369
    .local v2, "remappedUri":Landroid/net/Uri;
    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    invoke-static {v1}, Lorg/apache/cordova/engine/SystemWebViewClient;->needsSpecialsInAssetUrlFix(Landroid/net/Uri;)Z

    move-result v5

    if-nez v5, :cond_48

    invoke-static {v1}, Lorg/apache/cordova/engine/SystemWebViewClient;->needsKitKatContentUrlFix(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_6f

    .line 370
    :cond_48
    const/4 v5, 0x1

    invoke-virtual {v3, v2, v5}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;Z)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v4

    .line 371
    .local v4, "result":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    new-instance v5, Landroid/webkit/WebResourceResponse;

    iget-object v7, v4, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->mimeType:Ljava/lang/String;

    const-string v8, "UTF-8"

    iget-object v9, v4, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-direct {v5, v7, v8, v9}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_58} :catch_59

    goto :goto_29

    .line 375
    .end local v1    # "origUri":Landroid/net/Uri;
    .end local v2    # "remappedUri":Landroid/net/Uri;
    .end local v3    # "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    .end local v4    # "result":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    :catch_59
    move-exception v0

    .line 376
    .local v0, "e":Ljava/io/IOException;
    instance-of v5, v0, Ljava/io/FileNotFoundException;

    if-nez v5, :cond_65

    .line 377
    const-string v5, "SystemWebViewClient"

    const-string v7, "Error occurred while loading a file (returning a 404)."

    invoke-static {v5, v7, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 380
    :cond_65
    new-instance v5, Landroid/webkit/WebResourceResponse;

    const-string v7, "text/plain"

    const-string v8, "UTF-8"

    invoke-direct {v5, v7, v8, v6}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    goto :goto_29

    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "origUri":Landroid/net/Uri;
    .restart local v2    # "remappedUri":Landroid/net/Uri;
    .restart local v3    # "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    :cond_6f
    move-object v5, v6

    .line 374
    goto :goto_29
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onNavigationAttempt(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
