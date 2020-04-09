.class Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;
.super Ljava/lang/Object;
.source "PageLoadPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;


# direct methods
.method constructor <init>(Lcom/lbuilder/cordova/plugins/PageLoadPlugin;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;->this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 20
    iget-object v2, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;->this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;

    iget-object v2, v2, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->canGoBack()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 21
    .local v0, "flag":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 22
    iget-object v2, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;->this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;

    iget-object v2, v2, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->backHistory()Z

    .line 28
    :goto_19
    return-void

    .line 24
    :cond_1a
    new-instance v1, Lorg/apache/cordova/ConfigXmlParser;

    invoke-direct {v1}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 25
    .local v1, "parser":Lorg/apache/cordova/ConfigXmlParser;
    iget-object v2, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;->this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;

    iget-object v2, v2, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/ConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 26
    iget-object v2, p0, Lcom/lbuilder/cordova/plugins/PageLoadPlugin$1;->this$0:Lcom/lbuilder/cordova/plugins/PageLoadPlugin;

    iget-object v2, v2, Lcom/lbuilder/cordova/plugins/PageLoadPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrl()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_19
.end method
