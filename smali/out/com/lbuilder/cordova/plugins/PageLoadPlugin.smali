.class public Lcom/lbuilder/cordova/plugins/PageLoadPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "PageLoadPlugin.java"


# static fields
.field public static final PLUGIN_NAME:Ljava/lang/String; = "PageLoadPlugin"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .registers 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 16
    const-string v0, "goBackOrReload"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 17
    iget-object v0, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;

    invoke-direct {v1, p0}, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;-><init>(Lcom/lbuilder/cordova/plugins/PageLoadPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 30
    const/4 v0, 0x1

    .line 32
    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 35
    const-string v0, "onPageFinished"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 36
    new-instance v0, Lcom/lbuilder/cordova/plugins/PageLoader;

    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lbuilder/cordova/plugins/PageLoader;-><init>(Landroid/app/Activity;)V

    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1, p2}, Lcom/lbuilder/cordova/plugins/PageLoader;->onPageFinished(Lorg/apache/cordova/CordovaWebView;Ljava/lang/Object;)V

    .line 38
    :cond_18
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public onResume(Z)V
    .registers 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 46
    const/4 v0, 0x1

    sput-boolean v0, Lcom/lbuilder/cordova/plugins/PageLoader;->flag:Z

    .line 47
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x1

    sput-boolean v0, Lcom/lbuilder/cordova/plugins/PageLoader;->flag:Z

    .line 43
    return-void
.end method
