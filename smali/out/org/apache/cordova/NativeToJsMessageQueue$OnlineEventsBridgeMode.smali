.class public Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;
.super Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;
.source "NativeToJsMessageQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/NativeToJsMessageQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnlineEventsBridgeMode"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;
    }
.end annotation


# instance fields
.field private final delegate:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

.field private ignoreNextFlush:Z

.field private online:Z


# direct methods
.method public constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    .prologue
    .line 316
    invoke-direct {p0}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;-><init>()V

    .line 317
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->delegate:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    .line 318
    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V
    .registers 2

    .prologue
    .line 308
    iput-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->online:Z

    return-void
.end method

.method static synthetic access$1(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V
    .registers 2

    .prologue
    .line 309
    iput-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->ignoreNextFlush:Z

    return-void
.end method

.method static synthetic access$2(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->delegate:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    return-object v0
.end method

.method static synthetic access$3(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Z
    .registers 2

    .prologue
    .line 308
    iget-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->online:Z

    return v0
.end method


# virtual methods
.method public notifyOfFlush(Lorg/apache/cordova/NativeToJsMessageQueue;Z)V
    .registers 4
    .param p1, "queue"    # Lorg/apache/cordova/NativeToJsMessageQueue;
    .param p2, "fromOnlineEvent"    # Z

    .prologue
    .line 346
    if-eqz p2, :cond_d

    iget-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->ignoreNextFlush:Z

    if-nez v0, :cond_d

    .line 347
    iget-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->online:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    :goto_b
    iput-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->online:Z

    .line 349
    :cond_d
    return-void

    .line 347
    :cond_e
    const/4 v0, 0x1

    goto :goto_b
.end method

.method public onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .registers 4
    .param p1, "queue"    # Lorg/apache/cordova/NativeToJsMessageQueue;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->delegate:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    new-instance v1, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;

    invoke-direct {v1, p0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$2;-><init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Lorg/apache/cordova/NativeToJsMessageQueue;)V

    invoke-interface {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 342
    return-void
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->delegate:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    new-instance v1, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;-><init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)V

    invoke-interface {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 330
    return-void
.end method
