.class Lcom/lbuilder/cordova/plugins/PageLoader;
.super Ljava/lang/Object;
.source "PageLoader.java"


# static fields
.field private static REMOTE_URL_REGEX:Ljava/util/regex/Pattern;

.field public static flag:Z


# instance fields
.field private activity:Landroid/app/Activity;

.field private pageLoadCount:I

.field private webView:Lorg/apache/cordova/CordovaWebView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-string v0, "^http(s)?://.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/lbuilder/cordova/plugins/PageLoader;->REMOTE_URL_REGEX:Ljava/util/regex/Pattern;

    .line 24
    const/4 v0, 0x1

    sput-boolean v0, Lcom/lbuilder/cordova/plugins/PageLoader;->flag:Z

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->activity:Landroid/app/Activity;

    .line 28
    return-void
.end method

.method private addCordovaScriptNode()V
    .registers 7

    .prologue
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v0, "jsPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, "www/cordova.js"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "www/plugins"

    invoke-direct {p0, v3, v4}, Lcom/lbuilder/cordova/plugins/PageLoader;->jsPathsToInject(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 77
    const-string v3, "www/cordova_plugins.js"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v1, "jsToInject":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_51

    .line 90
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "data:text/javascript;charset=utf-8;base64,"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    invoke-direct {p0, v3}, Lcom/lbuilder/cordova/plugins/PageLoader;->addScriptNode(Ljava/lang/String;)V

    .line 92
    return-void

    .line 87
    :cond_51
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 88
    .local v2, "path":Ljava/lang/String;
    iget-object v4, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-direct {p0, v4, v2}, Lcom/lbuilder/cordova/plugins/PageLoader;->readFile(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2b
.end method

.method private addScriptNode(Ljava/lang/String;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 97
    const-string v0, "var script = document.createElement(\'script\');"

    .line 98
    .local v0, "jsUrl":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "script.src=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "document.getElementsByTagName(\'body\')[0].appendChild(script);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getEngine()Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lorg/apache/cordova/CordovaWebViewEngine;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 104
    return-void
.end method

.method private jsPathsToInject(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/util/List;
    .registers 13
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .local v4, "jsPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_5
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_b
    if-lt v5, v7, :cond_e

    .line 160
    :goto_d
    return-object v4

    .line 145
    :cond_e
    aget-object v2, v6, v5

    .line 146
    .local v2, "filePath":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 147
    .local v3, "fullPath":Ljava/lang/String;
    const-string v8, ".js"

    invoke-virtual {v3, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_35

    .line 148
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    :cond_32
    :goto_32
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 150
    :cond_35
    invoke-direct {p0, p1, v3}, Lcom/lbuilder/cordova/plugins/PageLoader;->jsPathsToInject(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 151
    .local v0, "childPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_32

    .line 152
    invoke-interface {v4, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_42} :catch_43

    goto :goto_32

    .line 156
    .end local v0    # "childPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "filePath":Ljava/lang/String;
    .end local v3    # "fullPath":Ljava/lang/String;
    :catch_43
    move-exception v1

    .line 157
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d
.end method

.method private readFile(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    .line 107
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v3, "out":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 110
    .local v1, "in":Ljava/io/BufferedReader;
    :try_start_6
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 111
    .local v5, "stream":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_14
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_14} :catch_67
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_14} :catch_40
    .catchall {:try_start_6 .. :try_end_14} :catchall_4f

    .line 112
    .end local v1    # "in":Ljava/io/BufferedReader;
    .local v2, "in":Ljava/io/BufferedReader;
    :try_start_14
    const-string v4, ""

    .line 114
    .local v4, "str":Ljava/lang/String;
    :goto_16
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_19
    .catch Ljava/net/MalformedURLException; {:try_start_14 .. :try_end_19} :catch_30
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_19} :catch_64
    .catchall {:try_start_14 .. :try_end_19} :catchall_61

    move-result-object v4

    if-nez v4, :cond_27

    .line 123
    if-eqz v2, :cond_5f

    .line 125
    :try_start_1e
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_21} :catch_5b

    move-object v1, v2

    .line 131
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v4    # "str":Ljava/lang/String;
    .end local v5    # "stream":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :cond_22
    :goto_22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 115
    .end local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "str":Ljava/lang/String;
    .restart local v5    # "stream":Ljava/io/InputStream;
    :cond_27
    :try_start_27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    const-string v6, "\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2f
    .catch Ljava/net/MalformedURLException; {:try_start_27 .. :try_end_2f} :catch_30
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2f} :catch_64
    .catchall {:try_start_27 .. :try_end_2f} :catchall_61

    goto :goto_16

    .line 118
    .end local v4    # "str":Ljava/lang/String;
    :catch_30
    move-exception v0

    move-object v1, v2

    .line 119
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v5    # "stream":Ljava/io/InputStream;
    .local v0, "e":Ljava/net/MalformedURLException;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :goto_32
    :try_start_32
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_4f

    .line 123
    if-eqz v1, :cond_22

    .line 125
    :try_start_37
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3a} :catch_3b

    goto :goto_22

    .line 126
    :catch_3b
    move-exception v0

    .line 127
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_22

    .line 120
    .end local v0    # "e":Ljava/io/IOException;
    :catch_40
    move-exception v0

    .line 121
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_41
    :try_start_41
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_4f

    .line 123
    if-eqz v1, :cond_22

    .line 125
    :try_start_46
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_22

    .line 126
    :catch_4a
    move-exception v0

    .line 127
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_22

    .line 122
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_4f
    move-exception v6

    .line 123
    :goto_50
    if-eqz v1, :cond_55

    .line 125
    :try_start_52
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_55} :catch_56

    .line 130
    :cond_55
    :goto_55
    throw v6

    .line 126
    :catch_56
    move-exception v0

    .line 127
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_55

    .line 126
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "str":Ljava/lang/String;
    .restart local v5    # "stream":Ljava/io/InputStream;
    :catch_5b
    move-exception v0

    .line 127
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .end local v0    # "e":Ljava/io/IOException;
    :cond_5f
    move-object v1, v2

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    goto :goto_22

    .line 122
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v4    # "str":Ljava/lang/String;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :catchall_61
    move-exception v6

    move-object v1, v2

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    goto :goto_50

    .line 120
    .end local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :catch_64
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    goto :goto_41

    .line 118
    .end local v5    # "stream":Ljava/io/InputStream;
    :catch_67
    move-exception v0

    goto :goto_32
.end method


# virtual methods
.method onPageFinished(Lorg/apache/cordova/CordovaWebView;Ljava/lang/Object;)V
    .registers 9
    .param p1, "webView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 32
    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_54

    move-object v2, p2

    .line 33
    check-cast v2, Ljava/lang/String;

    .line 34
    .local v2, "url":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "&plc="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->pageLoadCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "isStartPage":Ljava/lang/String;
    iget v3, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->pageLoadCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->pageLoadCount:I

    .line 36
    invoke-interface {p1}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v3

    const-string v4, "lbuilderID"

    const-string v5, "1"

    invoke-virtual {v3, v4, v5}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "lbuilderID":Ljava/lang/String;
    sget-boolean v3, Lcom/lbuilder/cordova/plugins/PageLoader;->flag:Z

    if-eqz v3, :cond_38

    .line 39
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/PageLoader;->activity:Landroid/app/Activity;

    invoke-static {v1, v3}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->judgeAlertADView(Ljava/lang/String;Landroid/app/Activity;)V

    .line 40
    const/4 v3, 0x0

    sput-boolean v3, Lcom/lbuilder/cordova/plugins/PageLoader;->flag:Z

    .line 50
    :cond_38
    invoke-interface {p1}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v3

    const-string v4, "autoInjectJS"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_54

    .line 51
    sget-object v3, Lcom/lbuilder/cordova/plugins/PageLoader;->REMOTE_URL_REGEX:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 52
    invoke-direct {p0}, Lcom/lbuilder/cordova/plugins/PageLoader;->addCordovaScriptNode()V

    .line 60
    .end local v0    # "isStartPage":Ljava/lang/String;
    .end local v1    # "lbuilderID":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    :cond_54
    :goto_54
    return-void

    .line 56
    .restart local v0    # "isStartPage":Ljava/lang/String;
    .restart local v1    # "lbuilderID":Ljava/lang/String;
    .restart local v2    # "url":Ljava/lang/String;
    :cond_55
    const-string v3, "file:///android_asset/www/cordova.js"

    invoke-direct {p0, v3}, Lcom/lbuilder/cordova/plugins/PageLoader;->addScriptNode(Ljava/lang/String;)V

    goto :goto_54
.end method
