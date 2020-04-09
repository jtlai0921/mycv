.class Lorg/apache/cordova/engine/SystemWebChromeClient$4;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SystemWebChromeClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebChromeClient;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

.field private final synthetic val$uploadMsg:Landroid/webkit/ValueCallback;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/ValueCallback;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$uploadMsg:Landroid/webkit/ValueCallback;

    .line 252
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 255
    if-eqz p3, :cond_5

    const/4 v1, -0x1

    if-eq p2, v1, :cond_20

    :cond_5
    const/4 v0, 0x0

    .line 256
    .local v0, "result":Landroid/net/Uri;
    :goto_6
    const-string v1, "SystemWebChromeClient"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Receive file chooser URL: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$uploadMsg:Landroid/webkit/ValueCallback;

    invoke-interface {v1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 258
    return-void

    .line 255
    .end local v0    # "result":Landroid/net/Uri;
    :cond_20
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    goto :goto_6
.end method
