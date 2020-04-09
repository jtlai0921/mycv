.class Lcom/lbuilder/cordova/plugins/LBADAlertView$1;
.super Ljava/lang/Object;
.source "LBADAlertView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lbuilder/cordova/plugins/LBADAlertView;->judgeAlertADView(Ljava/lang/String;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$lbuildID:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;->val$lbuildID:Ljava/lang/String;

    iput-object p2, p0, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;->val$activity:Landroid/app/Activity;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 39
    :try_start_0
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;->val$lbuildID:Ljava/lang/String;

    invoke-static {v3}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->getNavURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->getUrlResponce(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 40
    .local v2, "tempStr":Ljava/lang/String;
    if-nez v2, :cond_d

    .line 57
    .end local v2    # "tempStr":Ljava/lang/String;
    :cond_c
    :goto_c
    return-void

    .line 43
    .restart local v2    # "tempStr":Ljava/lang/String;
    :cond_d
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    .local v1, "json":Lorg/json/JSONObject;
    const-string v3, "code"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2b

    .line 46
    const-string v3, "title"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "content"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;->val$activity:Landroid/app/Activity;

    invoke-static {v3, v4, v5}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->showADAlertView(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    .line 48
    :cond_2b
    const-string v3, "expire"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_c

    .line 49
    const-string v3, "expire"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    sput-wide v4, Lcom/lbuilder/cordova/plugins/LBADAlertView;->app_expire:J
    :try_end_3f
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_3f} :catch_40
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3f} :catch_45

    goto :goto_c

    .line 51
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "tempStr":Ljava/lang/String;
    :catch_40
    move-exception v0

    .line 52
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_c

    .line 53
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_45
    move-exception v0

    .line 54
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c
.end method
