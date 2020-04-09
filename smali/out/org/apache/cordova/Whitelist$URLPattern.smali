.class Lorg/apache/cordova/Whitelist$URLPattern;
.super Ljava/lang/Object;
.source "Whitelist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/Whitelist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "URLPattern"
.end annotation


# instance fields
.field public host:Ljava/util/regex/Pattern;

.field public path:Ljava/util/regex/Pattern;

.field public port:Ljava/lang/Integer;

.field public scheme:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "scheme"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # Ljava/lang/String;
    .param p4, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    if-eqz p1, :cond_d

    :try_start_5
    const-string v1, "*"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 65
    :cond_d
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;

    .line 69
    :goto_10
    const-string v1, "*"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 70
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    .line 76
    :goto_1b
    if-eqz p3, :cond_25

    const-string v1, "*"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 77
    :cond_25
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    .line 81
    :goto_28
    if-eqz p4, :cond_32

    const-string v1, "/*"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8f

    .line 82
    :cond_32
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;

    .line 89
    :goto_35
    return-void

    .line 67
    :cond_36
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/apache/cordova/Whitelist$URLPattern;->regexFromPattern(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;
    :try_end_42
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_42} :catch_43

    goto :goto_10

    .line 86
    :catch_43
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/net/MalformedURLException;

    const-string v2, "Port must be a number"

    invoke-direct {v1, v2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_4c
    :try_start_4c
    const-string v1, "*."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_75

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "([a-z0-9.-]*\\.)?"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lorg/apache/cordova/Whitelist$URLPattern;->regexFromPattern(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    goto :goto_1b

    .line 74
    :cond_75
    const/4 v1, 0x0

    invoke-direct {p0, p2, v1}, Lorg/apache/cordova/Whitelist$URLPattern;->regexFromPattern(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    goto :goto_1b

    .line 79
    :cond_82
    const/16 v1, 0xa

    invoke-static {p3, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    goto :goto_28

    .line 84
    :cond_8f
    const/4 v1, 0x1

    invoke-direct {p0, p4, v1}, Lorg/apache/cordova/Whitelist$URLPattern;->regexFromPattern(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;
    :try_end_9a
    .catch Ljava/lang/NumberFormatException; {:try_start_4c .. :try_end_9a} :catch_43

    goto :goto_35
.end method

.method private regexFromPattern(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 9
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "allowWildcards"    # Z

    .prologue
    .line 48
    const-string v3, "\\.[]{}()^$?+|"

    .line 49
    .local v3, "toReplace":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v2, "regex":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v1, v4, :cond_13

    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 51
    :cond_13
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 52
    .local v0, "c":C
    const/16 v4, 0x2a

    if-ne v0, v4, :cond_28

    if-eqz p2, :cond_28

    .line 53
    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    :cond_22
    :goto_22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 54
    :cond_28
    const-string v4, "\\.[]{}()^$?+|"

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_22

    .line 55
    const/16 v4, 0x5c

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22
.end method


# virtual methods
.method public matches(Landroid/net/Uri;)Z
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x0

    .line 93
    :try_start_1
    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;

    if-eqz v2, :cond_15

    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_52

    .line 94
    :cond_15
    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    if-eqz v2, :cond_29

    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_52

    .line 95
    :cond_29
    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    if-eqz v2, :cond_3d

    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 96
    :cond_3d
    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;

    if-eqz v2, :cond_51

    iget-object v2, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4e} :catch_53

    move-result v2

    if-eqz v2, :cond_52

    .line 93
    :cond_51
    const/4 v1, 0x1

    .line 99
    :cond_52
    :goto_52
    return v1

    .line 97
    :catch_53
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "Whitelist"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_52
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 40
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;

    if-nez v4, :cond_44

    const-string v3, "*"

    .line 41
    .local v3, "schemeString":Ljava/lang/String;
    :goto_6
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    if-nez v4, :cond_4b

    const-string v0, "*"

    .line 42
    .local v0, "hostString":Ljava/lang/String;
    :goto_c
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    if-nez v4, :cond_52

    const-string v2, "*"

    .line 43
    .local v2, "portString":Ljava/lang/String;
    :goto_12
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;

    if-nez v4, :cond_59

    const-string v1, "*"

    .line 44
    .local v1, "pathString":Ljava/lang/String;
    :goto_18
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 40
    .end local v0    # "hostString":Ljava/lang/String;
    .end local v1    # "pathString":Ljava/lang/String;
    .end local v2    # "portString":Ljava/lang/String;
    .end local v3    # "schemeString":Ljava/lang/String;
    :cond_44
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->scheme:Ljava/util/regex/Pattern;

    invoke-virtual {v4}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_6

    .line 41
    .restart local v3    # "schemeString":Ljava/lang/String;
    :cond_4b
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->host:Ljava/util/regex/Pattern;

    invoke-virtual {v4}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 42
    .restart local v0    # "hostString":Ljava/lang/String;
    :cond_52
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->port:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_12

    .line 43
    .restart local v2    # "portString":Ljava/lang/String;
    :cond_59
    iget-object v4, p0, Lorg/apache/cordova/Whitelist$URLPattern;->path:Ljava/util/regex/Pattern;

    invoke-virtual {v4}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_18
.end method
