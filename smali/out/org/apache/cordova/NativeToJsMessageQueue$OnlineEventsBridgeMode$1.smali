.class Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->reset()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;


# direct methods
.method constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 324
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$0(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V

    .line 326
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-static {v0, v2}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$1(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V

    .line 327
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-static {v0}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$2(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    move-result-object v0

    invoke-interface {v0, v2}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;->setNetworkAvailable(Z)V

    .line 328
    return-void
.end method
