.class Lorg/apache/cordova/engine/SystemWebViewClient$1;
.super Ljava/lang/Object;
.source "SystemWebViewClient.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$1;->this$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewClient$1;->val$mHandler:Landroid/webkit/SslErrorHandler;

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient$1;->val$mHandler:Landroid/webkit/SslErrorHandler;

    invoke-virtual {v0}, Landroid/webkit/SslErrorHandler;->proceed()V

    .line 238
    return-void
.end method
