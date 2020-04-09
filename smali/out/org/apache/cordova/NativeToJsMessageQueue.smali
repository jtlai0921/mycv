.class public Lorg/apache/cordova/NativeToJsMessageQueue;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;,
        Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;,
        Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;,
        Lorg/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode;,
        Lorg/apache/cordova/NativeToJsMessageQueue$NoOpBridgeMode;,
        Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;
    }
.end annotation


# static fields
.field static final DISABLE_EXEC_CHAINING:Z = false

.field private static final FORCE_ENCODE_USING_EVAL:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "JsMessageQueue"

.field private static MAX_PAYLOAD_SIZE:I


# instance fields
.field private activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

.field private bridgeModes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;",
            ">;"
        }
    .end annotation
.end field

.field private paused:Z

.field private final queue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/high16 v0, 0x1f400000

    sput v0, Lorg/apache/cordova/NativeToJsMessageQueue;->MAX_PAYLOAD_SIZE:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->bridgeModes:Ljava/util/ArrayList;

    .line 27
    return-void
.end method

.method private calculatePackedMessageLength(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;)I
    .registers 5
    .param p1, "message"    # Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .prologue
    .line 113
    invoke-virtual {p1}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->calculateEncodedLength()I

    move-result v0

    .line 114
    .local v0, "messageLen":I
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "messageLenStr":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    add-int/lit8 v2, v2, 0x1

    return v2
.end method

.method private enqueueMessage(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;)V
    .registers 4
    .param p1, "message"    # Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .prologue
    .line 242
    monitor-enter p0

    .line 243
    :try_start_1
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    if-nez v0, :cond_e

    .line 244
    const-string v0, "JsMessageQueue"

    const-string v1, "Dropping Native->JS message due to disabled bridge"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    monitor-exit p0

    .line 252
    :goto_d
    return-void

    .line 247
    :cond_e
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 248
    iget-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->paused:Z

    if-nez v0, :cond_1c

    .line 249
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    invoke-virtual {v0, p0}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V

    .line 242
    :cond_1c
    monitor-exit p0

    goto :goto_d

    :catchall_1e
    move-exception v0

    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method private packMessage(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;Ljava/lang/StringBuilder;)V
    .registers 6
    .param p1, "message"    # Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 119
    invoke-virtual {p1}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->calculateEncodedLength()I

    move-result v0

    .line 120
    .local v0, "len":I
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 121
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {p1, p2}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->encodeAsMessage(Ljava/lang/StringBuilder;)V

    .line 123
    return-void
.end method


# virtual methods
.method public addBridgeMode(Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;)V
    .registers 3
    .param p1, "bridgeMode"    # Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->bridgeModes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    return-void
.end method

.method public addJavaScript(Ljava/lang/String;)V
    .registers 3
    .param p1, "statement"    # Ljava/lang/String;

    .prologue
    .line 213
    new-instance v0, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    invoke-direct {v0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->enqueueMessage(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;)V

    .line 214
    return-void
.end method

.method public addPluginResult(Lorg/apache/cordova/PluginResult;Ljava/lang/String;)V
    .registers 9
    .param p1, "result"    # Lorg/apache/cordova/PluginResult;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 220
    if-nez p2, :cond_f

    .line 221
    const-string v3, "JsMessageQueue"

    const-string v4, "Got plugin result with no callbackId"

    new-instance v5, Ljava/lang/Throwable;

    invoke-direct {v5}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 239
    :cond_e
    :goto_e
    return-void

    .line 226
    :cond_f
    invoke-virtual {p1}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v3

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {v4}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v4

    if-ne v3, v4, :cond_2d

    const/4 v2, 0x1

    .line 227
    .local v2, "noResult":Z
    :goto_1c
    invoke-virtual {p1}, Lorg/apache/cordova/PluginResult;->getKeepCallback()Z

    move-result v0

    .line 228
    .local v0, "keepCallback":Z
    if-eqz v2, :cond_24

    if-nez v0, :cond_e

    .line 231
    :cond_24
    new-instance v1, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    invoke-direct {v1, p1, p2}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;-><init>(Lorg/apache/cordova/PluginResult;Ljava/lang/String;)V

    .line 238
    .local v1, "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    invoke-direct {p0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue;->enqueueMessage(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;)V

    goto :goto_e

    .line 226
    .end local v0    # "keepCallback":Z
    .end local v1    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    .end local v2    # "noResult":Z
    :cond_2d
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method public isBridgeEnabled()Z
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public popAndEncode(Z)Ljava/lang/String;
    .registers 12
    .param p1, "fromOnlineEvent"    # Z

    .prologue
    const/4 v4, 0x0

    .line 131
    monitor-enter p0

    .line 132
    :try_start_2
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    if-nez v7, :cond_8

    .line 133
    monitor-exit p0

    .line 161
    :goto_7
    return-object v4

    .line 135
    :cond_8
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    invoke-virtual {v7, p0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;->notifyOfFlush(Lorg/apache/cordova/NativeToJsMessageQueue;Z)V

    .line 136
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 137
    monitor-exit p0

    goto :goto_7

    .line 131
    :catchall_17
    move-exception v7

    monitor-exit p0
    :try_end_19
    .catchall {:try_start_2 .. :try_end_19} :catchall_17

    throw v7

    .line 139
    :cond_1a
    const/4 v6, 0x0

    .line 140
    .local v6, "totalPayloadLen":I
    const/4 v3, 0x0

    .line 141
    .local v3, "numMessagesToSend":I
    :try_start_1c
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_22
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_43

    .line 150
    :cond_28
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 151
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    if-lt v0, v3, :cond_5d

    .line 156
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_3d

    .line 158
    const/16 v7, 0x2a

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 160
    :cond_3d
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 161
    .local v4, "ret":Ljava/lang/String;
    monitor-exit p0

    goto :goto_7

    .line 141
    .end local v0    # "i":I
    .end local v4    # "ret":Ljava/lang/String;
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    :cond_43
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .line 142
    .local v1, "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    invoke-direct {p0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue;->calculatePackedMessageLength(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;)I

    move-result v2

    .line 143
    .local v2, "messageSize":I
    if-lez v3, :cond_59

    add-int v8, v6, v2

    sget v9, Lorg/apache/cordova/NativeToJsMessageQueue;->MAX_PAYLOAD_SIZE:I

    if-le v8, v9, :cond_59

    sget v8, Lorg/apache/cordova/NativeToJsMessageQueue;->MAX_PAYLOAD_SIZE:I

    if-gtz v8, :cond_28

    .line 146
    :cond_59
    add-int/2addr v6, v2

    .line 147
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    .line 152
    .end local v1    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    .end local v2    # "messageSize":I
    .restart local v0    # "i":I
    .restart local v5    # "sb":Ljava/lang/StringBuilder;
    :cond_5d
    iget-object v7, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .line 153
    .restart local v1    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    invoke-direct {p0, v1, v5}, Lorg/apache/cordova/NativeToJsMessageQueue;->packMessage(Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;Ljava/lang/StringBuilder;)V
    :try_end_68
    .catchall {:try_start_1c .. :try_end_68} :catchall_17

    .line 151
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e
.end method

.method public popAndEncodeAsJs()Ljava/lang/String;
    .registers 15

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 169
    monitor-enter p0

    .line 170
    :try_start_3
    iget-object v11, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v1

    .line 171
    .local v1, "length":I
    if-nez v1, :cond_e

    .line 172
    monitor-exit p0

    const/4 v5, 0x0

    .line 205
    :goto_d
    return-object v5

    .line 174
    :cond_e
    const/4 v7, 0x0

    .line 175
    .local v7, "totalPayloadLen":I
    const/4 v4, 0x0

    .line 176
    .local v4, "numMessagesToSend":I
    iget-object v11, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_16
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_46

    .line 184
    :cond_1c
    iget-object v11, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v11

    if-ne v4, v11, :cond_62

    move v8, v9

    .line 185
    .local v8, "willSendAllMessages":Z
    :goto_25
    new-instance v6, Ljava/lang/StringBuilder;

    if-eqz v8, :cond_64

    move v11, v10

    :goto_2a
    add-int/2addr v11, v7

    invoke-direct {v6, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 188
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2f
    if-lt v0, v4, :cond_67

    .line 198
    if-nez v8, :cond_38

    .line 199
    const-string v11, "window.setTimeout(function(){cordova.require(\'cordova/plugin/android/polling\').pollOnce();},0);"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    :cond_38
    if-eqz v8, :cond_89

    move v0, v9

    :goto_3b
    if-lt v0, v4, :cond_8b

    .line 204
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "ret":Ljava/lang/String;
    monitor-exit p0

    goto :goto_d

    .line 169
    .end local v0    # "i":I
    .end local v1    # "length":I
    .end local v4    # "numMessagesToSend":I
    .end local v5    # "ret":Ljava/lang/String;
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    .end local v7    # "totalPayloadLen":I
    .end local v8    # "willSendAllMessages":Z
    :catchall_43
    move-exception v9

    monitor-exit p0
    :try_end_45
    .catchall {:try_start_3 .. :try_end_45} :catchall_43

    throw v9

    .line 176
    .restart local v1    # "length":I
    .restart local v4    # "numMessagesToSend":I
    .restart local v7    # "totalPayloadLen":I
    :cond_46
    :try_start_46
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .line 177
    .local v2, "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    invoke-virtual {v2}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->calculateEncodedLength()I

    move-result v12

    add-int/lit8 v3, v12, 0x32

    .line 178
    .local v3, "messageSize":I
    if-lez v4, :cond_5e

    add-int v12, v7, v3

    sget v13, Lorg/apache/cordova/NativeToJsMessageQueue;->MAX_PAYLOAD_SIZE:I

    if-le v12, v13, :cond_5e

    sget v12, Lorg/apache/cordova/NativeToJsMessageQueue;->MAX_PAYLOAD_SIZE:I

    if-gtz v12, :cond_1c

    .line 181
    :cond_5e
    add-int/2addr v7, v3

    .line 182
    add-int/lit8 v4, v4, 0x1

    goto :goto_16

    .end local v2    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    .end local v3    # "messageSize":I
    :cond_62
    move v8, v10

    .line 184
    goto :goto_25

    .line 185
    .restart local v8    # "willSendAllMessages":Z
    :cond_64
    const/16 v11, 0x64

    goto :goto_2a

    .line 189
    .restart local v0    # "i":I
    .restart local v6    # "sb":Ljava/lang/StringBuilder;
    :cond_67
    iget-object v11, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;

    .line 190
    .restart local v2    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    if-eqz v8, :cond_7b

    add-int/lit8 v11, v0, 0x1

    if-ne v11, v4, :cond_7b

    .line 191
    invoke-virtual {v2, v6}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->encodeAsJsMessage(Ljava/lang/StringBuilder;)V

    .line 188
    :goto_78
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 193
    :cond_7b
    const-string v11, "try{"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v2, v6}, Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;->encodeAsJsMessage(Ljava/lang/StringBuilder;)V

    .line 195
    const-string v11, "}finally{"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_78

    .end local v2    # "message":Lorg/apache/cordova/NativeToJsMessageQueue$JsMessage;
    :cond_89
    move v0, v10

    .line 201
    goto :goto_3b

    .line 202
    :cond_8b
    const/16 v9, 0x7d

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_90
    .catchall {:try_start_46 .. :try_end_90} :catchall_43

    .line 201
    add-int/lit8 v0, v0, 0x1

    goto :goto_3b
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 106
    monitor-enter p0

    .line 107
    :try_start_1
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 108
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->setBridgeMode(I)V

    .line 106
    monitor-exit p0

    .line 110
    return-void

    .line 106
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public setBridgeMode(I)V
    .registers 6
    .param p1, "value"    # I

    .prologue
    .line 83
    const/4 v1, -0x1

    if-lt p1, v1, :cond_b

    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->bridgeModes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_20

    .line 84
    :cond_b
    const-string v1, "JsMessageQueue"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid NativeToJsBridgeMode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :cond_1f
    :goto_1f
    return-void

    .line 86
    :cond_20
    if-gez p1, :cond_5b

    const/4 v0, 0x0

    .line 87
    .local v0, "newMode":Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;
    :goto_23
    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    if-eq v0, v1, :cond_1f

    .line 88
    const-string v2, "JsMessageQueue"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "Set native->JS mode to "

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez v0, :cond_65

    const-string v1, "null"

    :goto_34
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    monitor-enter p0

    .line 90
    :try_start_40
    iput-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    .line 91
    if-eqz v0, :cond_56

    .line 92
    invoke-virtual {v0}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;->reset()V

    .line 93
    iget-boolean v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->paused:Z

    if-nez v1, :cond_56

    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_56

    .line 94
    invoke-virtual {v0, p0}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V

    .line 89
    :cond_56
    monitor-exit p0

    goto :goto_1f

    :catchall_58
    move-exception v1

    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_40 .. :try_end_5a} :catchall_58

    throw v1

    .line 86
    .end local v0    # "newMode":Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;
    :cond_5b
    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->bridgeModes:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    move-object v0, v1

    goto :goto_23

    .line 88
    .restart local v0    # "newMode":Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;
    :cond_65
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    goto :goto_34
.end method

.method public setPaused(Z)V
    .registers 5
    .param p1, "value"    # Z

    .prologue
    .line 255
    iget-boolean v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->paused:Z

    if-eqz v0, :cond_12

    if-eqz p1, :cond_12

    .line 258
    const-string v0, "JsMessageQueue"

    const-string v1, "nested call to setPaused detected."

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 260
    :cond_12
    iput-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->paused:Z

    .line 261
    if-nez p1, :cond_29

    .line 262
    monitor-enter p0

    .line 263
    :try_start_17
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    if-eqz v0, :cond_28

    .line 264
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue;->activeBridgeMode:Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;

    invoke-virtual {v0, p0}, Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V

    .line 262
    :cond_28
    monitor-exit p0

    .line 268
    :cond_29
    return-void

    .line 262
    :catchall_2a
    move-exception v0

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_17 .. :try_end_2c} :catchall_2a

    throw v0
.end method
