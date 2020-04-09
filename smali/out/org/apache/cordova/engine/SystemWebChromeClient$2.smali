.class Lorg/apache/cordova/engine/SystemWebChromeClient$2;
.super Ljava/lang/Object;
.source "SystemWebChromeClient.java"

# interfaces
.implements Lorg/apache/cordova/CordovaDialogsHelper$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

.field private final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/JsResult;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$2;->this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$2;->val$result:Landroid/webkit/JsResult;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public gotResult(ZLjava/lang/String;)V
    .registers 4
    .param p1, "success"    # Z
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 102
    if-eqz p1, :cond_8

    .line 103
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$2;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->confirm()V

    .line 107
    :goto_7
    return-void

    .line 105
    :cond_8
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$2;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->cancel()V

    goto :goto_7
.end method
