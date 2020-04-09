.class Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;
.super Ljava/lang/Object;
.source "AndroidBug5497Workaround.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;

.field private final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;->this$0:Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;

    iput-object p2, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;->val$activity:Landroid/app/Activity;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 3

    .prologue
    .line 40
    iget-object v0, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;->this$0:Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;

    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->access$0(Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;Landroid/app/Activity;)V

    .line 41
    return-void
.end method
