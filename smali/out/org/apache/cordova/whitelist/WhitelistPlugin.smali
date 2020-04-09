.class public Lorg/apache/cordova/whitelist/WhitelistPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "WhitelistPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "WhitelistPlugin"


# instance fields
.field private allowedIntents:Lorg/apache/cordova/Whitelist;

.field private allowedNavigations:Lorg/apache/cordova/Whitelist;

.field private allowedRequests:Lorg/apache/cordova/Whitelist;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 47
    new-instance v0, Lorg/apache/cordova/Whitelist;

    invoke-direct {v0}, Lorg/apache/cordova/Whitelist;-><init>()V

    new-instance v1, Lorg/apache/cordova/Whitelist;

    invoke-direct {v1}, Lorg/apache/cordova/Whitelist;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/whitelist/WhitelistPlugin;-><init>(Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;)V

    .line 48
    new-instance v0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;

    invoke-direct {v0, p0, v2}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;)V

    invoke-virtual {v0, p1}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;)V
    .registers 6
    .param p1, "allowedNavigations"    # Lorg/apache/cordova/Whitelist;
    .param p2, "allowedIntents"    # Lorg/apache/cordova/Whitelist;
    .param p3, "allowedRequests"    # Lorg/apache/cordova/Whitelist;

    .prologue
    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 55
    if-nez p3, :cond_15

    .line 56
    new-instance p3, Lorg/apache/cordova/Whitelist;

    .end local p3    # "allowedRequests":Lorg/apache/cordova/Whitelist;
    invoke-direct {p3}, Lorg/apache/cordova/Whitelist;-><init>()V

    .line 57
    .restart local p3    # "allowedRequests":Lorg/apache/cordova/Whitelist;
    const-string v0, "file:///*"

    invoke-virtual {p3, v0, v1}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 58
    const-string v0, "data:*"

    invoke-virtual {p3, v0, v1}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 60
    :cond_15
    iput-object p1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    .line 61
    iput-object p2, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    .line 62
    iput-object p3, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    .line 64
    return-void
.end method

.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 5
    .param p1, "xmlParser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v2, 0x0

    .line 51
    new-instance v0, Lorg/apache/cordova/Whitelist;

    invoke-direct {v0}, Lorg/apache/cordova/Whitelist;-><init>()V

    new-instance v1, Lorg/apache/cordova/Whitelist;

    invoke-direct {v1}, Lorg/apache/cordova/Whitelist;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/whitelist/WhitelistPlugin;-><init>(Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;Lorg/apache/cordova/Whitelist;)V

    .line 52
    new-instance v0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;

    invoke-direct {v0, p0, v2}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;)V

    invoke-virtual {v0, p1}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 53
    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method static synthetic access$1(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method static synthetic access$2(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method private isBidNavigation(Ljava/lang/String;)Z
    .registers 10
    .param p1, "urlString"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 120
    const/4 v4, 0x6

    new-array v1, v4, [Ljava/lang/String;

    const-string v4, "apk"

    aput-object v4, v1, v3

    const-string v4, "ipa"

    aput-object v4, v1, v2

    const/4 v4, 0x2

    const-string v5, "exe"

    aput-object v5, v1, v4

    const/4 v4, 0x3

    const-string v5, "zip"

    aput-object v5, v1, v4

    const/4 v4, 0x4

    const-string v5, "rar"

    aput-object v5, v1, v4

    const/4 v4, 0x5

    const-string v5, "jar"

    aput-object v5, v1, v4

    .line 121
    .local v1, "extentFile":[Ljava/lang/String;
    array-length v5, v1

    move v4, v3

    :goto_23
    if-lt v4, v5, :cond_27

    move v2, v3

    .line 124
    :cond_26
    return v2

    .line 121
    :cond_27
    aget-object v0, v1, v4

    .line 122
    .local v0, "exe":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_26

    .line 121
    add-int/lit8 v4, v4, 0x1

    goto :goto_23
.end method


# virtual methods
.method public getAllowedIntents()Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method public getAllowedNavigations()Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method public getAllowedRequests()Lorg/apache/cordova/Whitelist;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    return-object v0
.end method

.method public pluginInitialize()V
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    if-nez v0, :cond_28

    .line 68
    new-instance v0, Lorg/apache/cordova/Whitelist;

    invoke-direct {v0}, Lorg/apache/cordova/Whitelist;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    .line 69
    new-instance v0, Lorg/apache/cordova/Whitelist;

    invoke-direct {v0}, Lorg/apache/cordova/Whitelist;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    .line 70
    new-instance v0, Lorg/apache/cordova/Whitelist;

    invoke-direct {v0}, Lorg/apache/cordova/Whitelist;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    .line 71
    new-instance v0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;)V

    iget-object v1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 73
    :cond_28
    return-void
.end method

.method public setAllowedIntents(Lorg/apache/cordova/Whitelist;)V
    .registers 2
    .param p1, "allowedIntents"    # Lorg/apache/cordova/Whitelist;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    .line 207
    return-void
.end method

.method public setAllowedNavigations(Lorg/apache/cordova/Whitelist;)V
    .registers 2
    .param p1, "allowedNavigations"    # Lorg/apache/cordova/Whitelist;

    .prologue
    .line 198
    iput-object p1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    .line 199
    return-void
.end method

.method public setAllowedRequests(Lorg/apache/cordova/Whitelist;)V
    .registers 2
    .param p1, "allowedRequests"    # Lorg/apache/cordova/Whitelist;

    .prologue
    .line 214
    iput-object p1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    .line 215
    return-void
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->isBidNavigation(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 166
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 171
    :goto_b
    return-object v0

    .line 168
    :cond_c
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedNavigations:Lorg/apache/cordova/Whitelist;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/Whitelist;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 169
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_b

    .line 171
    :cond_1a
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 176
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    if-ne v0, v1, :cond_e

    .line 177
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 182
    :goto_d
    return-object v0

    .line 179
    :cond_e
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedRequests:Lorg/apache/cordova/Whitelist;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/Whitelist;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 180
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d

    .line 182
    :cond_1b
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin;->allowedIntents:Lorg/apache/cordova/Whitelist;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/Whitelist;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 188
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 190
    :goto_d
    return-object v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
