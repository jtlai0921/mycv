.class Lorg/apache/cordova/engine/SystemWebViewClient$3;
.super Ljava/lang/Object;
.source "SystemWebViewClient.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebViewClient;

.field private final synthetic val$mHandler:Landroid/webkit/SslErrorHandler;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebViewClient;Landroid/webkit/SslErrorHandler;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$3;->this$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewClient$3;->val$mHandler:Landroid/webkit/SslErrorHandler;

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 249
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_13

    const/4 v1, 0x4

    if-ne p2, v1, :cond_13

    .line 250
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$3;->val$mHandler:Landroid/webkit/SslErrorHandler;

    invoke-virtual {v1}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 251
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 254
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method
