.class Lorg/apache/cordova/engine/SystemWebChromeClient$3;
.super Ljava/lang/Object;
.source "SystemWebChromeClient.java"

# interfaces
.implements Lorg/apache/cordova/CordovaDialogsHelper$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebChromeClient;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

.field private final synthetic val$result:Landroid/webkit/JsPromptResult;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/JsPromptResult;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$3;->this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$3;->val$result:Landroid/webkit/JsPromptResult;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public gotResult(ZLjava/lang/String;)V
    .registers 4
    .param p1, "success"    # Z
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 130
    if-eqz p1, :cond_8

    .line 131
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$3;->val$result:Landroid/webkit/JsPromptResult;

    invoke-virtual {v0, p2}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    .line 135
    :goto_7
    return-void

    .line 133
    :cond_8
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$3;->val$result:Landroid/webkit/JsPromptResult;

    invoke-virtual {v0}, Landroid/webkit/JsPromptResult;->cancel()V

    goto :goto_7
.end method
