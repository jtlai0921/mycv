.class Landroid/support/v4/view/AsyncLayoutInflater$1;
.super Ljava/lang/Object;
.source "AsyncLayoutInflater.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/AsyncLayoutInflater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/view/AsyncLayoutInflater;


# direct methods
.method constructor <init>(Landroid/support/v4/view/AsyncLayoutInflater;)V
    .registers 2
    .param p1, "this$0"    # Landroid/support/v4/view/AsyncLayoutInflater;

    .prologue
    .line 94
    iput-object p1, p0, Landroid/support/v4/view/AsyncLayoutInflater$1;->this$0:Landroid/support/v4/view/AsyncLayoutInflater;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 97
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;

    .line 98
    .local v0, "request":Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;
    iget-object v1, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->view:Landroid/view/View;

    if-nez v1, :cond_19

    .line 99
    iget-object v1, p0, Landroid/support/v4/view/AsyncLayoutInflater$1;->this$0:Landroid/support/v4/view/AsyncLayoutInflater;

    invoke-static {v1}, Landroid/support/v4/view/AsyncLayoutInflater;->access$000(Landroid/support/v4/view/AsyncLayoutInflater;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget v2, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->resid:I

    iget-object v3, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->parent:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->view:Landroid/view/View;

    .line 102
    :cond_19
    iget-object v1, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->callback:Landroid/support/v4/view/AsyncLayoutInflater$OnInflateFinishedListener;

    iget-object v2, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->view:Landroid/view/View;

    iget v3, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->resid:I

    iget-object v4, v0, Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;->parent:Landroid/view/ViewGroup;

    invoke-interface {v1, v2, v3, v4}, Landroid/support/v4/view/AsyncLayoutInflater$OnInflateFinishedListener;->onInflateFinished(Landroid/view/View;ILandroid/view/ViewGroup;)V

    .line 104
    iget-object v1, p0, Landroid/support/v4/view/AsyncLayoutInflater$1;->this$0:Landroid/support/v4/view/AsyncLayoutInflater;

    invoke-static {v1}, Landroid/support/v4/view/AsyncLayoutInflater;->access$100(Landroid/support/v4/view/AsyncLayoutInflater;)Landroid/support/v4/view/AsyncLayoutInflater$InflateThread;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/view/AsyncLayoutInflater$InflateThread;->releaseRequest(Landroid/support/v4/view/AsyncLayoutInflater$InflateRequest;)V

    .line 105
    const/4 v1, 0x1

    return v1
.end method
