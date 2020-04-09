.class Lcom/app/jtlai/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/app/jtlai/MainActivity;->setFullScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/app/jtlai/MainActivity;


# direct methods
.method constructor <init>(Lcom/app/jtlai/MainActivity;)V
    .registers 2

    .prologue
    .line 63
    iput-object p1, p0, Lcom/app/jtlai/MainActivity$1;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 66
    iget-object v0, p0, Lcom/app/jtlai/MainActivity$1;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-static {v0}, Lcom/app/jtlai/MainActivity;->access$000(Lcom/app/jtlai/MainActivity;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v0

    const-string v1, "Fullscreen"

    const-string v2, "false"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 68
    iget-object v0, p0, Lcom/app/jtlai/MainActivity$1;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-virtual {v0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 69
    iget-object v0, p0, Lcom/app/jtlai/MainActivity$1;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-virtual {v0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x800

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 71
    :cond_30
    return-void
.end method
