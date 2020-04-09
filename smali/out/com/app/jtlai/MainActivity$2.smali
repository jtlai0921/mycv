.class Lcom/app/jtlai/MainActivity$2;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/app/jtlai/MainActivity;->fitScreen()V
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
    .line 134
    iput-object p1, p0, Lcom/app/jtlai/MainActivity$2;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 136
    iget-object v0, p0, Lcom/app/jtlai/MainActivity$2;->this$0:Lcom/app/jtlai/MainActivity;

    invoke-static {v0}, Lcom/app/jtlai/MainActivity;->access$200(Lcom/app/jtlai/MainActivity;)Lorg/apache/cordova/CordovaInterfaceImpl;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaInterfaceImpl;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/app/jtlai/MainActivity$2$1;

    invoke-direct {v1, p0}, Lcom/app/jtlai/MainActivity$2$1;-><init>(Lcom/app/jtlai/MainActivity$2;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 148
    return-void
.end method
