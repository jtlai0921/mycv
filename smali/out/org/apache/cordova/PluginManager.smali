.class public Lorg/apache/cordova/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# static fields
.field private static final SLOW_EXEC_WARNING_THRESHOLD:I

.field private static TAG:Ljava/lang/String;


# instance fields
.field private final app:Lorg/apache/cordova/CordovaWebView;

.field private final ctx:Lorg/apache/cordova/CordovaInterface;

.field private final entryMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private isInitialized:Z

.field private permissionRequester:Lorg/apache/cordova/CordovaPlugin;

.field private final pluginMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CordovaPlugin;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-string v0, "PluginManager"

    sput-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    .line 40
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v0

    if-eqz v0, :cond_f

    const/16 v0, 0x3c

    :goto_c
    sput v0, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    return-void

    :cond_f
    const/16 v0, 0x10

    goto :goto_c
.end method

.method public constructor <init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Ljava/util/Collection;)V
    .registers 5
    .param p1, "cordovaWebView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/cordova/CordovaWebView;",
            "Lorg/apache/cordova/CordovaInterface;",
            "Ljava/util/Collection",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p3, "pluginEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/apache/cordova/PluginEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    .line 44
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    .line 53
    iput-object p2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    .line 54
    iput-object p1, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    .line 55
    invoke-virtual {p0, p3}, Lorg/apache/cordova/PluginManager;->setPluginEntries(Ljava/util/Collection;)V

    .line 56
    return-void
.end method

.method private instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .registers 9
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 485
    const/4 v3, 0x0

    .line 487
    .local v3, "ret":Lorg/apache/cordova/CordovaPlugin;
    const/4 v1, 0x0

    .line 488
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_10

    :try_start_4
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 489
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 491
    :cond_10
    if-eqz v1, :cond_25

    const/4 v4, 0x1

    :goto_13
    const-class v5, Lorg/apache/cordova/CordovaPlugin;

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    and-int/2addr v4, v5

    if-eqz v4, :cond_24

    .line 492
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    move-object v3, v0
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_24} :catch_27

    .line 498
    :cond_24
    :goto_24
    return-object v3

    .line 491
    :cond_25
    const/4 v4, 0x0

    goto :goto_13

    .line 494
    :catch_27
    move-exception v2

    .line 495
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 496
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Error adding plugin "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_24
.end method

.method private startupPlugins()V
    .registers 6

    .prologue
    .line 93
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 102
    return-void

    .line 93
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 96
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-boolean v2, v0, Lorg/apache/cordova/PluginEntry;->onload:Z

    if-eqz v2, :cond_21

    .line 97
    iget-object v2, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    goto :goto_a

    .line 99
    :cond_21
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v3, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 185
    new-instance v0, Lorg/apache/cordova/PluginEntry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 186
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    .line 187
    return-void
.end method

.method public addService(Lorg/apache/cordova/PluginEntry;)V
    .registers 7
    .param p1, "entry"    # Lorg/apache/cordova/PluginEntry;

    .prologue
    .line 196
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    iget-object v0, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v0, :cond_25

    .line 198
    iget-object v0, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 199
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    iget-object v2, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    :cond_25
    return-void
.end method

.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 19
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;
    .param p4, "rawArgs"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v7

    .line 123
    .local v7, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-nez v7, :cond_29

    .line 124
    sget-object v11, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "exec() call to unknown plugin: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 126
    .local v3, "cr":Lorg/apache/cordova/PluginResult;
    iget-object v11, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v0, p3

    invoke-interface {v11, v3, v0}, Lorg/apache/cordova/CordovaWebView;->sendPluginResult(Lorg/apache/cordova/PluginResult;Ljava/lang/String;)V

    .line 149
    .end local v3    # "cr":Lorg/apache/cordova/PluginResult;
    :cond_28
    :goto_28
    return-void

    .line 129
    :cond_29
    new-instance v2, Lorg/apache/cordova/CallbackContext;

    iget-object v11, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v0, p3

    invoke-direct {v2, v0, v11}, Lorg/apache/cordova/CallbackContext;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaWebView;)V

    .line 131
    .local v2, "callbackContext":Lorg/apache/cordova/CallbackContext;
    :try_start_32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 132
    .local v8, "pluginStartTime":J
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v7, v0, v1, v2}, Lorg/apache/cordova/CordovaPlugin;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z

    move-result v10

    .line 133
    .local v10, "wasValidAction":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v4, v12, v8

    .line 135
    .local v4, "duration":J
    sget v11, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    int-to-long v12, v11

    cmp-long v11, v4, v12

    if-lez v11, :cond_7b

    .line 136
    sget-object v11, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "THREAD WARNING: exec() call to "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " blocked the main thread for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "ms. Plugin should use CordovaInterface.getThreadPool()."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_7b
    if-nez v10, :cond_28

    .line 139
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 140
    .restart local v3    # "cr":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_87
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_87} :catch_88
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_87} :catch_94

    goto :goto_28

    .line 142
    .end local v3    # "cr":Lorg/apache/cordova/PluginResult;
    .end local v4    # "duration":J
    .end local v8    # "pluginStartTime":J
    .end local v10    # "wasValidAction":Z
    :catch_88
    move-exception v6

    .line 143
    .local v6, "e":Lorg/json/JSONException;
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 144
    .restart local v3    # "cr":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_28

    .line 145
    .end local v3    # "cr":Lorg/apache/cordova/PluginResult;
    .end local v6    # "e":Lorg/json/JSONException;
    :catch_94
    move-exception v6

    .line 146
    .local v6, "e":Ljava/lang/Exception;
    sget-object v11, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string v12, "Uncaught exception from plugin"

    invoke-static {v11, v12, v6}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 147
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v11}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_28
.end method

.method public getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .registers 8
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 161
    .local v1, "ret":Lorg/apache/cordova/CordovaPlugin;
    if-nez v1, :cond_2f

    .line 162
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 163
    .local v0, "pe":Lorg/apache/cordova/PluginEntry;
    if-nez v0, :cond_17

    .line 164
    const/4 v3, 0x0

    move-object v2, v1

    .line 174
    .end local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    .end local v1    # "ret":Lorg/apache/cordova/CordovaPlugin;
    .local v2, "ret":Lorg/apache/cordova/CordovaPlugin;
    :goto_16
    return-object v3

    .line 166
    .end local v2    # "ret":Lorg/apache/cordova/CordovaPlugin;
    .restart local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    .restart local v1    # "ret":Lorg/apache/cordova/CordovaPlugin;
    :cond_17
    iget-object v3, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v3, :cond_32

    .line 167
    iget-object v1, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    .line 171
    :goto_1d
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    iget-object v5, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v5

    invoke-virtual {v1, p1, v3, v4, v5}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 172
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    :cond_2f
    move-object v2, v1

    .end local v1    # "ret":Lorg/apache/cordova/CordovaPlugin;
    .restart local v2    # "ret":Lorg/apache/cordova/CordovaPlugin;
    move-object v3, v1

    .line 174
    goto :goto_16

    .line 169
    .end local v2    # "ret":Lorg/apache/cordova/CordovaPlugin;
    .restart local v0    # "pe":Lorg/apache/cordova/PluginEntry;
    .restart local v1    # "ret":Lorg/apache/cordova/CordovaPlugin;
    :cond_32
    iget-object v3, v0, Lorg/apache/cordova/PluginEntry;->pluginClass:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/apache/cordova/PluginManager;->instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v1

    goto :goto_1d
.end method

.method public getPluginEntries()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .registers 3

    .prologue
    .line 81
    sget-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string v1, "init()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 84
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 85
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 86
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->startupPlugins()V

    .line 87
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 507
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 512
    return-void

    .line 507
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 508
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 509
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_a
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    .line 295
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 300
    return-void

    .line 295
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 296
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 297
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    goto :goto_a
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 325
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 330
    return-void

    .line 325
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 326
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 327
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_a
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .registers 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 449
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_12

    .line 455
    const/4 v2, 0x0

    :goto_11
    return v2

    .line 449
    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 450
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v4, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 451
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_a

    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 452
    const/4 v2, 0x1

    goto :goto_11
.end method

.method public onPause(Z)V
    .registers 5
    .param p1, "multitasking"    # Z

    .prologue
    .line 209
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 214
    return-void

    .line 209
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 210
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 211
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    goto :goto_a
.end method

.method public onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z
    .registers 6
    .param p1, "view"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "request"    # Lorg/apache/cordova/ICordovaClientCertRequest;

    .prologue
    .line 248
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_12

    .line 253
    const/4 v1, 0x0

    :goto_11
    return v1

    .line 248
    :cond_12
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 249
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v2, p2}, Lorg/apache/cordova/CordovaPlugin;->onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 250
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "view"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "handler"    # Lorg/apache/cordova/ICordovaHttpAuthHandler;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "realm"    # Ljava/lang/String;

    .prologue
    .line 229
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_12

    .line 234
    const/4 v1, 0x0

    :goto_11
    return v1

    .line 229
    :cond_12
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 230
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v2, p2, p3, p4}, Lorg/apache/cordova/CordovaPlugin;->onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 231
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public onReset()V
    .registers 4

    .prologue
    .line 462
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 467
    return-void

    .line 462
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 463
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 464
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->onReset()V

    goto :goto_a
.end method

.method public onResume(Z)V
    .registers 5
    .param p1, "multitasking"    # Z

    .prologue
    .line 262
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 267
    return-void

    .line 262
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 263
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 264
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    goto :goto_a
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .registers 6

    .prologue
    .line 515
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 516
    .local v2, "state":Landroid/os/Bundle;
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_16

    .line 524
    return-object v2

    .line 516
    :cond_16
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 517
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_f

    .line 518
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v1

    .line 519
    .local v1, "pluginState":Landroid/os/Bundle;
    if-eqz v1, :cond_f

    .line 520
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_f
.end method

.method public onStart()V
    .registers 4

    .prologue
    .line 273
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 278
    return-void

    .line 273
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 274
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 275
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->onStart()V

    goto :goto_a
.end method

.method public onStop()V
    .registers 4

    .prologue
    .line 284
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 289
    return-void

    .line 284
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 285
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 286
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->onStop()V

    goto :goto_a
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 310
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_17

    .line 318
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2, p1, p2}, Lorg/apache/cordova/CordovaInterface;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_16
    return-object v0

    .line 310
    :cond_17
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 311
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_a

    .line 312
    invoke-virtual {v1, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 313
    .local v0, "obj":Ljava/lang/Object;
    if-eqz v0, :cond_a

    goto :goto_16
.end method

.method remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 470
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_12

    .line 478
    const/4 v1, 0x0

    :goto_11
    return-object v1

    .line 470
    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    .line 471
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v0, :cond_a

    .line 472
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    .line 473
    .local v1, "ret":Landroid/net/Uri;
    if-eqz v1, :cond_a

    goto :goto_11
.end method

.method public setPluginEntries(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "pluginEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/apache/cordova/PluginEntry;>;"
    iget-boolean v1, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    if-eqz v1, :cond_15

    .line 64
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 65
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 66
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    .line 67
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    .line 69
    :cond_15
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_27

    .line 72
    iget-boolean v1, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    if-eqz v1, :cond_26

    .line 73
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->startupPlugins()V

    .line 75
    :cond_26
    return-void

    .line 69
    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 70
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    goto :goto_19
.end method

.method public shouldAllowBridgeAccess(Ljava/lang/String;)Z
    .registers 8
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 401
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_17

    .line 412
    const-string v3, "file://"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    :goto_16
    return v3

    .line 401
    :cond_17
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 402
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v5, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 403
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_a

    .line 404
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowBridgeAccess(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    .line 405
    .local v2, "result":Ljava/lang/Boolean;
    if-eqz v2, :cond_a

    .line 406
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_16
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Z
    .registers 8
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 382
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_22

    .line 393
    const-string v3, "file://"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3f

    const-string v3, "about:blank"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3f

    const/4 v3, 0x0

    :goto_21
    return v3

    .line 382
    :cond_22
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 383
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v5, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 384
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_a

    .line 385
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    .line 386
    .local v2, "result":Ljava/lang/Boolean;
    if-eqz v2, :cond_a

    .line 387
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_21

    .line 393
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    .end local v2    # "result":Ljava/lang/Boolean;
    :cond_3f
    const/4 v3, 0x1

    goto :goto_21
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Z
    .registers 10
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 344
    iget-object v5, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2b

    .line 355
    const-string v5, "blob:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2a

    const-string v5, "data:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2a

    const-string v5, "about:blank"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 367
    :cond_2a
    :goto_2a
    return v4

    .line 344
    :cond_2b
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 345
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v6, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v7, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 346
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_c

    .line 347
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    .line 348
    .local v2, "result":Ljava/lang/Boolean;
    if-eqz v2, :cond_c

    .line 349
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    goto :goto_2a

    .line 359
    .end local v0    # "entry":Lorg/apache/cordova/PluginEntry;
    .end local v1    # "plugin":Lorg/apache/cordova/CordovaPlugin;
    .end local v2    # "result":Ljava/lang/Boolean;
    :cond_48
    const-string v5, "https://ssl.gstatic.com/accessibility/javascript/android/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 362
    const-string v5, "file://"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_64

    .line 365
    const-string v5, "/app_webview/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_62

    :goto_60
    move v4, v3

    goto :goto_2a

    :cond_62
    move v3, v4

    goto :goto_60

    :cond_64
    move v4, v3

    .line 367
    goto :goto_2a
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 8
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 428
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_16

    .line 439
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :goto_15
    return-object v2

    .line 428
    :cond_16
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 429
    .local v0, "entry":Lorg/apache/cordova/PluginEntry;
    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/LinkedHashMap;

    iget-object v5, v0, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    .line 430
    .local v1, "plugin":Lorg/apache/cordova/CordovaPlugin;
    if-eqz v1, :cond_a

    .line 431
    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    .line 432
    .local v2, "result":Ljava/lang/Boolean;
    if-eqz v2, :cond_a

    goto :goto_15
.end method
