.class Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

.field private final synthetic val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;


# direct methods
.method constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    iput-object p2, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;

    .line 334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 336
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 337
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$1(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V

    .line 338
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-static {v0}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$2(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;->this$1:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-static {v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->access$3(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Z

    move-result v1

    invoke-interface {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;->setNetworkAvailable(Z)V

    .line 340
    :cond_1d
    return-void
.end method
