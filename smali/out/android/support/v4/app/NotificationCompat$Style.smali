.class public abstract Landroid/support/v4/app/NotificationCompat$Style;
.super Ljava/lang/Object;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Style"
.end annotation


# instance fields
.field mBigContentTitle:Ljava/lang/CharSequence;

.field mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

.field mSummaryText:Ljava/lang/CharSequence;

.field mSummaryTextSet:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1771
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1775
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/NotificationCompat$Style;->mSummaryTextSet:Z

    return-void
.end method


# virtual methods
.method public addCompatExtras(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 1799
    return-void
.end method

.method public build()Landroid/app/Notification;
    .registers 3

    .prologue
    .line 1787
    const/4 v0, 0x0

    .line 1788
    .local v0, "notification":Landroid/app/Notification;
    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz v1, :cond_b

    .line 1789
    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 1791
    :cond_b
    return-object v0
.end method

.method protected restoreFromCompatExtras(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 1806
    return-void
.end method

.method public setBuilder(Landroid/support/v4/app/NotificationCompat$Builder;)V
    .registers 3
    .param p1, "builder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 1778
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    if-eq v0, p1, :cond_f

    .line 1779
    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    .line 1780
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz v0, :cond_f

    .line 1781
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Style;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v0, p0}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 1784
    :cond_f
    return-void
.end method
