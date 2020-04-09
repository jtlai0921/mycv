.class Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;
.super Lorg/apache/cordova/ConfigXmlParser;
.source "WhitelistPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/whitelist/WhitelistPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomConfigXmlParser"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;


# direct methods
.method private constructor <init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;)V
    .registers 2

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-direct {p0}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;)V
    .registers 3

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/whitelist/WhitelistPlugin;)V

    return-void
.end method


# virtual methods
.method public handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 2
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 117
    return-void
.end method

.method public handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 11
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v5, 0x1

    const/4 v8, 0x0

    const/4 v6, 0x0

    .line 78
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "strNode":Ljava/lang/String;
    const-string v7, "content"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 80
    const-string v5, "src"

    invoke-interface {p1, v8, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "startPage":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    invoke-virtual {v5, v2, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 114
    .end local v2    # "startPage":Ljava/lang/String;
    :cond_1e
    :goto_1e
    return-void

    .line 82
    :cond_1f
    const-string v7, "allow-navigation"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6c

    .line 83
    const-string v5, "href"

    invoke-interface {p1, v8, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "origin":Ljava/lang/String;
    const-string v5, "*"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_62

    .line 85
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "file://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 86
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "http://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 87
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "https://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 88
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "data:*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto :goto_1e

    .line 90
    :cond_62
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$0(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    invoke-virtual {v5, v1, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto :goto_1e

    .line 92
    .end local v1    # "origin":Ljava/lang/String;
    :cond_6c
    const-string v7, "allow-intent"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_84

    .line 93
    const-string v5, "href"

    invoke-interface {p1, v8, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 94
    .restart local v1    # "origin":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$1(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    invoke-virtual {v5, v1, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto :goto_1e

    .line 95
    .end local v1    # "origin":Ljava/lang/String;
    :cond_84
    const-string v7, "access"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 96
    const-string v7, "origin"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 97
    .restart local v1    # "origin":Ljava/lang/String;
    const-string v7, "subdomains"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 98
    .local v4, "subdomains":Ljava/lang/String;
    const-string v7, "launch-external"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_c1

    move v0, v5

    .line 99
    .local v0, "external":Z
    :goto_a1
    if-eqz v1, :cond_1e

    .line 100
    if-eqz v0, :cond_c5

    .line 101
    const-string v7, "WhitelistPlugin"

    const-string v8, "Found <access launch-external> within config.xml. Please use <allow-intent> instead."

    invoke-static {v7, v8}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v7, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v7}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$1(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v7

    if-eqz v4, :cond_c3

    const-string v8, "true"

    invoke-virtual {v4, v8}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_c3

    :goto_bc
    invoke-virtual {v7, v1, v5}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto/16 :goto_1e

    .end local v0    # "external":Z
    :cond_c1
    move v0, v6

    .line 98
    goto :goto_a1

    .restart local v0    # "external":Z
    :cond_c3
    move v5, v6

    .line 102
    goto :goto_bc

    .line 104
    :cond_c5
    const-string v7, "*"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f0

    .line 105
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$2(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "file://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 106
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$2(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "http://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 107
    iget-object v5, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v5}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$2(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v5

    const-string v7, "https://*/*"

    invoke-virtual {v5, v7, v6}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto/16 :goto_1e

    .line 109
    :cond_f0
    iget-object v7, p0, Lorg/apache/cordova/whitelist/WhitelistPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/whitelist/WhitelistPlugin;

    invoke-static {v7}, Lorg/apache/cordova/whitelist/WhitelistPlugin;->access$2(Lorg/apache/cordova/whitelist/WhitelistPlugin;)Lorg/apache/cordova/Whitelist;

    move-result-object v7

    if-eqz v4, :cond_105

    const-string v8, "true"

    invoke-virtual {v4, v8}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_105

    :goto_100
    invoke-virtual {v7, v1, v5}, Lorg/apache/cordova/Whitelist;->addWhiteListEntry(Ljava/lang/String;Z)V

    goto/16 :goto_1e

    :cond_105
    move v5, v6

    goto :goto_100
.end method
