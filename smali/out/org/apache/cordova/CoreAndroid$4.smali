.class Lorg/apache/cordova/CoreAndroid$4;
.super Ljava/lang/Object;
.source "CoreAndroid.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CoreAndroid;->backHistory()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CoreAndroid;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CoreAndroid;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/CoreAndroid$4;->this$0:Lorg/apache/cordova/CoreAndroid;

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid$4;->this$0:Lorg/apache/cordova/CoreAndroid;

    iget-object v0, v0, Lorg/apache/cordova/CoreAndroid;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->backHistory()Z

    .line 226
    return-void
.end method
