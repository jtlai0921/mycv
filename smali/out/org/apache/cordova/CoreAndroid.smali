.class public Lorg/apache/cordova/CoreAndroid;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CoreAndroid.java"


# static fields
.field public static final PLUGIN_NAME:Ljava/lang/String; = "CoreAndroid"

.field protected static final TAG:Ljava/lang/String; = "CordovaApp"


# instance fields
.field private messageChannel:Lorg/apache/cordova/CallbackContext;

.field private final messageChannelLock:Ljava/lang/Object;

.field private pendingResume:Lorg/apache/cordova/PluginResult;

.field private telephonyReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CoreAndroid;->messageChannelLock:Ljava/lang/Object;

    .line 39
    return-void
.end method

.method public static getBuildConfigValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 375
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".BuildConfig"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 376
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 377
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_24} :catch_26
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_24} :catch_32
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_24} :catch_4c

    move-result-object v3

    .line 388
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :goto_25
    return-object v3

    .line 378
    :catch_26
    move-exception v1

    .line 379
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string v4, "CordovaApp"

    const-string v5, "Unable to get the BuildConfig, is this built with ANT?"

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_25

    .line 381
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_32
    move-exception v1

    .line 382
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    const-string v4, "CordovaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " is not a valid field. Check your build.gradle"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_25

    .line 383
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    :catch_4c
    move-exception v1

    .line 384
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v4, "CordovaApp"

    const-string v5, "Illegal Access Exception: Let\'s print a stack trace."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_25
.end method

.method private initTelephonyReceiver()V
    .registers 4

    .prologue
    .line 284
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 285
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 287
    new-instance v1, Lorg/apache/cordova/CoreAndroid$5;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CoreAndroid$5;-><init>(Lorg/apache/cordova/CoreAndroid;)V

    iput-object v1, p0, Lorg/apache/cordova/CoreAndroid;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    .line 314
    iget-object v1, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/CoreAndroid;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 315
    return-void
.end method

.method private sendEventMessage(Ljava/lang/String;)V
    .registers 6
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 320
    .local v1, "obj":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "action"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_a} :catch_15

    .line 324
    :goto_a
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-direct {p0, v2}, Lorg/apache/cordova/CoreAndroid;->sendEventMessage(Lorg/apache/cordova/PluginResult;)V

    .line 325
    return-void

    .line 321
    :catch_15
    move-exception v0

    .line 322
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "CordovaApp"

    const-string v3, "Failed to create event message"

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a
.end method

.method private sendEventMessage(Lorg/apache/cordova/PluginResult;)V
    .registers 3
    .param p1, "payload"    # Lorg/apache/cordova/PluginResult;

    .prologue
    .line 328
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 329
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->messageChannel:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_d

    .line 330
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->messageChannel:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 332
    :cond_d
    return-void
.end method


# virtual methods
.method public backHistory()V
    .registers 3

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/CoreAndroid$4;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CoreAndroid$4;-><init>(Lorg/apache/cordova/CoreAndroid;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 228
    return-void
.end method

.method public clearCache()V
    .registers 3

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/CoreAndroid$2;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CoreAndroid$2;-><init>(Lorg/apache/cordova/CoreAndroid;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 145
    return-void
.end method

.method public clearHistory()V
    .registers 3

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/CoreAndroid$3;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CoreAndroid$3;-><init>(Lorg/apache/cordova/CoreAndroid;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 216
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .registers 11
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 75
    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 76
    .local v2, "status":Lorg/apache/cordova/PluginResult$Status;
    const-string v1, ""

    .line 79
    .local v1, "result":Ljava/lang/String;
    :try_start_6
    const-string v5, "clearCache"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 80
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->clearCache()V

    .line 124
    :cond_11
    :goto_11
    new-instance v5, Lorg/apache/cordova/PluginResult;

    invoke-direct {v5, v2, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 128
    :goto_19
    return v3

    .line 82
    :cond_1a
    const-string v5, "show"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 86
    iget-object v5, p0, Lorg/apache/cordova/CoreAndroid;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lorg/apache/cordova/CoreAndroid$1;

    invoke-direct {v6, p0}, Lorg/apache/cordova/CoreAndroid$1;-><init>(Lorg/apache/cordova/CoreAndroid;)V

    invoke-virtual {v5, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_30
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_30} :catch_31

    goto :goto_11

    .line 126
    :catch_31
    move-exception v0

    .line 127
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    move v3, v4

    .line 128
    goto :goto_19

    .line 92
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_3e
    :try_start_3e
    const-string v5, "loadUrl"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_54

    .line 93
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/cordova/CoreAndroid;->loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_11

    .line 95
    :cond_54
    const-string v5, "cancelLoadUrl"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_11

    .line 98
    const-string v5, "clearHistory"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_68

    .line 99
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->clearHistory()V

    goto :goto_11

    .line 101
    :cond_68
    const-string v5, "backHistory"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_74

    .line 102
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->backHistory()V

    goto :goto_11

    .line 104
    :cond_74
    const-string v5, "overrideButton"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8a

    .line 105
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/cordova/CoreAndroid;->overrideButton(Ljava/lang/String;Z)V

    goto :goto_11

    .line 107
    :cond_8a
    const-string v5, "overrideBackbutton"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 108
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v5

    invoke-virtual {p0, v5}, Lorg/apache/cordova/CoreAndroid;->overrideBackbutton(Z)V

    goto/16 :goto_11

    .line 110
    :cond_9c
    const-string v5, "exitApp"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a9

    .line 111
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->exitApp()V

    goto/16 :goto_11

    .line 113
    :cond_a9
    const-string v5, "messageChannel"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 114
    iget-object v5, p0, Lorg/apache/cordova/CoreAndroid;->messageChannelLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_b4
    .catch Lorg/json/JSONException; {:try_start_3e .. :try_end_b4} :catch_31

    .line 115
    :try_start_b4
    iput-object p3, p0, Lorg/apache/cordova/CoreAndroid;->messageChannel:Lorg/apache/cordova/CallbackContext;

    .line 116
    iget-object v6, p0, Lorg/apache/cordova/CoreAndroid;->pendingResume:Lorg/apache/cordova/PluginResult;

    if-eqz v6, :cond_c2

    .line 117
    iget-object v6, p0, Lorg/apache/cordova/CoreAndroid;->pendingResume:Lorg/apache/cordova/PluginResult;

    invoke-direct {p0, v6}, Lorg/apache/cordova/CoreAndroid;->sendEventMessage(Lorg/apache/cordova/PluginResult;)V

    .line 118
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/cordova/CoreAndroid;->pendingResume:Lorg/apache/cordova/PluginResult;

    .line 114
    :cond_c2
    monitor-exit v5

    goto/16 :goto_19

    :catchall_c5
    move-exception v3

    monitor-exit v5
    :try_end_c7
    .catchall {:try_start_b4 .. :try_end_c7} :catchall_c5

    :try_start_c7
    throw v3
    :try_end_c8
    .catch Lorg/json/JSONException; {:try_start_c7 .. :try_end_c8} :catch_31
.end method

.method public exitApp()V
    .registers 4

    .prologue
    .line 274
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "exit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    return-void
.end method

.method public fireJavascriptEvent(Ljava/lang/String;)V
    .registers 2
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/cordova/CoreAndroid;->sendEventMessage(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public isBackbuttonOverridden()Z
    .registers 3

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lorg/apache/cordova/CordovaWebView;->isButtonPlumbedToJs(I)Z

    move-result v0

    return v0
.end method

.method public loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 15
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "props"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 155
    const-string v9, "App"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "App.loadUrl("

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const/4 v8, 0x0

    .line 157
    .local v8, "wait":I
    const/4 v5, 0x0

    .line 158
    .local v5, "openExternal":Z
    const/4 v0, 0x0

    .line 161
    .local v0, "clearHistory":Z
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 162
    .local v6, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_39

    .line 163
    invoke-virtual {p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v4

    .line 164
    .local v4, "keys":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_33
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v2, v9, :cond_47

    .line 195
    .end local v2    # "i":I
    .end local v4    # "keys":Lorg/json/JSONArray;
    :cond_39
    if-lez v8, :cond_41

    .line 197
    :try_start_3b
    monitor-enter p0
    :try_end_3c
    .catch Ljava/lang/InterruptedException; {:try_start_3b .. :try_end_3c} :catch_b3

    .line 198
    int-to-long v10, v8

    :try_start_3d
    invoke-virtual {p0, v10, v11}, Ljava/lang/Object;->wait(J)V

    .line 197
    monitor-exit p0
    :try_end_41
    .catchall {:try_start_3d .. :try_end_41} :catchall_b0

    .line 204
    :cond_41
    :goto_41
    iget-object v9, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v9, p1, v5, v0, v6}, Lorg/apache/cordova/CordovaWebView;->showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V

    .line 205
    return-void

    .line 165
    .restart local v2    # "i":I
    .restart local v4    # "keys":Lorg/json/JSONArray;
    :cond_47
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 166
    .local v3, "key":Ljava/lang/String;
    const-string v9, "wait"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5a

    .line 167
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 164
    :cond_57
    :goto_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    .line 169
    :cond_5a
    const-string v9, "openexternal"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_67

    .line 170
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    .line 171
    goto :goto_57

    .line 172
    :cond_67
    const-string v9, "clearhistory"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_74

    .line 173
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 174
    goto :goto_57

    .line 176
    :cond_74
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 177
    .local v7, "value":Ljava/lang/Object;
    if-eqz v7, :cond_57

    .line 180
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8c

    .line 181
    check-cast v7, Ljava/lang/String;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_57

    .line 183
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_8c
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Boolean;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9e

    .line 184
    check-cast v7, Ljava/lang/Boolean;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_57

    .line 186
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_9e
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Integer;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_57

    .line 187
    check-cast v7, Ljava/lang/Integer;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_57

    .line 197
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Lorg/json/JSONArray;
    :catchall_b0
    move-exception v9

    :try_start_b1
    monitor-exit p0
    :try_end_b2
    .catchall {:try_start_b1 .. :try_end_b2} :catchall_b0

    :try_start_b2
    throw v9
    :try_end_b3
    .catch Ljava/lang/InterruptedException; {:try_start_b2 .. :try_end_b3} :catch_b3

    .line 200
    :catch_b3
    move-exception v1

    .line 201
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_41
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 340
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/CoreAndroid;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 341
    return-void
.end method

.method public overrideBackbutton(Z)V
    .registers 4
    .param p1, "override"    # Z

    .prologue
    .line 237
    const-string v0, "App"

    const-string v1, "WARNING: Back Button Default Behavior will be overridden.  The backbutton event will be fired!"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x4

    invoke-interface {v0, v1, p1}, Lorg/apache/cordova/CordovaWebView;->setButtonPlumbedToJs(IZ)V

    .line 239
    return-void
.end method

.method public overrideButton(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "button"    # Ljava/lang/String;
    .param p2, "override"    # Z

    .prologue
    .line 249
    const-string v0, "App"

    const-string v1, "WARNING: Volume Button Default Behavior will be overridden.  The volume event will be fired!"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    const-string v0, "volumeup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 251
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    const/16 v1, 0x18

    invoke-interface {v0, v1, p2}, Lorg/apache/cordova/CordovaWebView;->setButtonPlumbedToJs(IZ)V

    .line 259
    :cond_16
    :goto_16
    return-void

    .line 253
    :cond_17
    const-string v0, "volumedown"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 254
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    const/16 v1, 0x19

    invoke-interface {v0, v1, p2}, Lorg/apache/cordova/CordovaWebView;->setButtonPlumbedToJs(IZ)V

    goto :goto_16

    .line 256
    :cond_27
    const-string v0, "menubutton"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 257
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    const/16 v1, 0x52

    invoke-interface {v0, v1, p2}, Lorg/apache/cordova/CordovaWebView;->setButtonPlumbedToJs(IZ)V

    goto :goto_16
.end method

.method public pluginInitialize()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/apache/cordova/CoreAndroid;->initTelephonyReceiver()V

    .line 64
    return-void
.end method

.method public sendResumeEvent(Lorg/apache/cordova/PluginResult;)V
    .registers 4
    .param p1, "resumeEvent"    # Lorg/apache/cordova/PluginResult;

    .prologue
    .line 351
    iget-object v1, p0, Lorg/apache/cordova/CoreAndroid;->messageChannelLock:Ljava/lang/Object;

    monitor-enter v1

    .line 352
    :try_start_3
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->messageChannel:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_c

    .line 353
    invoke-direct {p0, p1}, Lorg/apache/cordova/CoreAndroid;->sendEventMessage(Lorg/apache/cordova/PluginResult;)V

    .line 351
    :goto_a
    monitor-exit v1

    .line 360
    return-void

    .line 357
    :cond_c
    iput-object p1, p0, Lorg/apache/cordova/CoreAndroid;->pendingResume:Lorg/apache/cordova/PluginResult;

    goto :goto_a

    .line 351
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method
