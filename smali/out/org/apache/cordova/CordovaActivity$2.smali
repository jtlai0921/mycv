.class Lorg/apache/cordova/CordovaActivity$2;
.super Ljava/lang/Object;
.source "CordovaActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaActivity;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CordovaActivity;

.field private final synthetic val$description:Ljava/lang/String;

.field private final synthetic val$errorCode:I

.field private final synthetic val$errorUrl:Ljava/lang/String;

.field private final synthetic val$me:Lorg/apache/cordova/CordovaActivity;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaActivity;ILjava/lang/String;Lorg/apache/cordova/CordovaActivity;Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/CordovaActivity$2;->this$0:Lorg/apache/cordova/CordovaActivity;

    iput p2, p0, Lorg/apache/cordova/CordovaActivity$2;->val$errorCode:I

    iput-object p3, p0, Lorg/apache/cordova/CordovaActivity$2;->val$description:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/CordovaActivity$2;->val$me:Lorg/apache/cordova/CordovaActivity;

    iput-object p5, p0, Lorg/apache/cordova/CordovaActivity$2;->val$errorUrl:Ljava/lang/String;

    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 392
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "errorCode:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lorg/apache/cordova/CordovaActivity$2;->val$errorCode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 394
    .local v1, "eString":Ljava/lang/String;
    :try_start_11
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity$2;->val$description:Ljava/lang/String;

    const-string v3, "UTF8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_18
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_11 .. :try_end_18} :catch_3b

    move-result-object v1

    .line 401
    :goto_19
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity$2;->val$me:Lorg/apache/cordova/CordovaActivity;

    iget-object v2, v2, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lorg/apache/cordova/CordovaActivity$2;->val$errorUrl:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "?error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;Z)V

    .line 403
    return-void

    .line 395
    :catch_3b
    move-exception v0

    .line 397
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_19
.end method
