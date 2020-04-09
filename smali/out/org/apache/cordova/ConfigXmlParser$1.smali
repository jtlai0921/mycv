.class Lorg/apache/cordova/ConfigXmlParser$1;
.super Ljava/lang/Thread;
.source "ConfigXmlParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/ConfigXmlParser;->gerateDebugURL()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/ConfigXmlParser;


# direct methods
.method constructor <init>(Lorg/apache/cordova/ConfigXmlParser;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    .line 103
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 106
    :try_start_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 107
    .local v1, "debugURLBuffer":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    iget-object v4, v4, Lorg/apache/cordova/ConfigXmlParser;->schemeRegex:Ljava/util/regex/Pattern;

    iget-object v5, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v5}, Lorg/apache/cordova/ConfigXmlParser;->access$0(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-nez v4, :cond_1f

    .line 108
    const-string v4, "http://"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    :cond_1f
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v4}, Lorg/apache/cordova/ConfigXmlParser;->access$0(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 111
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v4}, Lorg/apache/cordova/ConfigXmlParser;->access$0(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_49

    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v4}, Lorg/apache/cordova/ConfigXmlParser;->access$1(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_49

    .line 112
    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    :cond_49
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v4}, Lorg/apache/cordova/ConfigXmlParser;->access$1(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "debugURL":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 117
    .local v3, "oc":Ljava/net/HttpURLConnection;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 118
    const/16 v4, 0xbb8

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 119
    const/16 v4, 0xc8

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    if-ne v4, v5, :cond_73

    const/4 v2, 0x1

    .line 120
    .local v2, "isDebugHostReachable":Z
    :cond_73
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 121
    if-eqz v2, :cond_7d

    .line 122
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser$1;->this$0:Lorg/apache/cordova/ConfigXmlParser;

    invoke-static {v4, v0}, Lorg/apache/cordova/ConfigXmlParser;->access$2(Lorg/apache/cordova/ConfigXmlParser;Ljava/lang/String;)V
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_7d} :catch_7e

    .line 126
    .end local v0    # "debugURL":Ljava/lang/String;
    .end local v1    # "debugURLBuffer":Ljava/lang/StringBuffer;
    .end local v2    # "isDebugHostReachable":Z
    .end local v3    # "oc":Ljava/net/HttpURLConnection;
    :cond_7d
    :goto_7d
    return-void

    .line 124
    :catch_7e
    move-exception v4

    goto :goto_7d
.end method
