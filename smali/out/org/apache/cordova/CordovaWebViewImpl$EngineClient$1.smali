.class Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;
.super Ljava/lang/Object;
.source "CordovaWebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->onPageFinishedLoading(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;->this$1:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    .line 533
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;)Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;
    .registers 2

    .prologue
    .line 533
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;->this$1:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    return-object v0
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 536
    const-wide/16 v0, 0x7d0

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 537
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;->this$1:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->access$0(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;)Lorg/apache/cordova/CordovaWebViewImpl;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->access$4(Lorg/apache/cordova/CordovaWebViewImpl;)Lorg/apache/cordova/CordovaInterface;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1$1;-><init>(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient$1;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_1b} :catch_1c

    .line 544
    :goto_1b
    return-void

    .line 542
    :catch_1c
    move-exception v0

    goto :goto_1b
.end method
