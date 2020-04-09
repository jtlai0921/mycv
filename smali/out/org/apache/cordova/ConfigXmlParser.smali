.class public Lorg/apache/cordova/ConfigXmlParser;
.super Ljava/lang/Object;
.source "ConfigXmlParser.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private final DebugHost:Ljava/lang/String;

.field private debugHost:Ljava/lang/String;

.field private debugPage:Ljava/lang/String;

.field insideFeature:Z

.field private launchUrl:Ljava/lang/String;

.field onload:Z

.field paramType:Ljava/lang/String;

.field pluginClass:Ljava/lang/String;

.field private pluginEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private prefs:Lorg/apache/cordova/CordovaPreferences;

.field schemeRegex:Ljava/util/regex/Pattern;

.field service:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "ConfigXmlParser"

    sput-object v0, Lorg/apache/cordova/ConfigXmlParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, "file:///android_asset/www/index.html"

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    .line 39
    new-instance v0, Lorg/apache/cordova/CordovaPreferences;

    invoke-direct {v0}, Lorg/apache/cordova/CordovaPreferences;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    .line 69
    iput-boolean v2, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 70
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    .line 71
    iput-boolean v2, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    .line 92
    const-string v0, "DebugHost"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->DebugHost:Ljava/lang/String;

    .line 93
    iput-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->debugPage:Ljava/lang/String;

    .line 94
    iput-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->debugHost:Ljava/lang/String;

    .line 182
    const-string v0, "^[a-z-]+://"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->schemeRegex:Ljava/util/regex/Pattern;

    .line 35
    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->debugHost:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lorg/apache/cordova/ConfigXmlParser;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->debugPage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lorg/apache/cordova/ConfigXmlParser;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 38
    iput-object p1, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    return-void
.end method

.method private setStartUrl(Ljava/lang/String;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 185
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->schemeRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 186
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 187
    iput-object p1, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    .line 194
    :goto_e
    return-void

    .line 189
    :cond_f
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_1d

    .line 190
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 192
    :cond_1d
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "file:///android_asset/www/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    goto :goto_e
.end method


# virtual methods
.method public gerateDebugURL()V
    .registers 4

    .prologue
    .line 97
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->debugPage:Ljava/lang/String;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->debugHost:Ljava/lang/String;

    if-nez v1, :cond_9

    .line 133
    :cond_8
    :goto_8
    return-void

    .line 100
    :cond_9
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->schemeRegex:Ljava/util/regex/Pattern;

    iget-object v2, p0, Lorg/apache/cordova/ConfigXmlParser;->debugPage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_8

    .line 103
    new-instance v0, Lorg/apache/cordova/ConfigXmlParser$1;

    invoke-direct {v0, p0}, Lorg/apache/cordova/ConfigXmlParser$1;-><init>(Lorg/apache/cordova/ConfigXmlParser;)V

    .line 128
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 130
    :try_start_1f
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_22
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_8

    .line 131
    :catch_23
    move-exception v1

    goto :goto_8
.end method

.method public getLaunchUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginEntries()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPreferences()Lorg/apache/cordova/CordovaPreferences;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    return-object v0
.end method

.method public handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 9
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v6, 0x0

    .line 171
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 172
    .local v0, "strNode":Ljava/lang/String;
    const-string v1, "feature"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 173
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    new-instance v2, Lorg/apache/cordova/PluginEntry;

    iget-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    iget-boolean v5, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    .line 176
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    .line 177
    iput-boolean v6, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 178
    iput-boolean v6, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    .line 180
    :cond_29
    return-void
.end method

.method public handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 9
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v6, 0x0

    .line 136
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, "strNode":Ljava/lang/String;
    const-string v4, "feature"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 141
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 142
    const-string v4, "name"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    .line 168
    :cond_18
    :goto_18
    return-void

    .line 143
    :cond_19
    iget-boolean v4, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    if-eqz v4, :cond_76

    const-string v4, "param"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    .line 144
    const-string v4, "name"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    .line 145
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v5, "service"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 147
    const-string v4, "value"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    goto :goto_18

    .line 148
    :cond_40
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v5, "package"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_54

    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v5, "android-package"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 149
    :cond_54
    const-string v4, "value"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    goto :goto_18

    .line 150
    :cond_5d
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v5, "onload"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 151
    const-string v4, "true"

    const-string v5, "value"

    invoke-interface {p1, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    goto :goto_18

    .line 152
    :cond_76
    const-string v4, "preference"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a6

    .line 153
    const-string v4, "name"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "name":Ljava/lang/String;
    const-string v4, "value"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 155
    .local v3, "value":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    invoke-virtual {v4, v0, v3}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->DebugHost:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    if-eqz v3, :cond_18

    .line 157
    iput-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->debugHost:Ljava/lang/String;

    .line 158
    invoke-virtual {p0}, Lorg/apache/cordova/ConfigXmlParser;->gerateDebugURL()V

    goto/16 :goto_18

    .line 160
    .end local v0    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_a6
    const-string v4, "content"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 161
    const-string v4, "src"

    invoke-interface {p1, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "src":Ljava/lang/String;
    if-eqz v1, :cond_18

    .line 163
    invoke-direct {p0, v1}, Lorg/apache/cordova/ConfigXmlParser;->setStartUrl(Ljava/lang/String;)V

    .line 164
    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->debugPage:Ljava/lang/String;

    .line 165
    invoke-virtual {p0}, Lorg/apache/cordova/ConfigXmlParser;->gerateDebugURL()V

    goto/16 :goto_18
.end method

.method public parse(Landroid/content/Context;)V
    .registers 7
    .param p1, "action"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "config"

    const-string v3, "xml"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 57
    .local v0, "id":I
    if-nez v0, :cond_34

    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "config"

    const-string v3, "xml"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 61
    if-nez v0, :cond_34

    .line 62
    sget-object v1, Lorg/apache/cordova/ConfigXmlParser;->TAG:Ljava/lang/String;

    const-string v2, "res/xml/config.xml is missing!"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    :goto_33
    return-void

    .line 66
    :cond_34
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/cordova/ConfigXmlParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_33
.end method

.method public parse(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 5
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 74
    const/4 v1, -0x1

    .line 76
    .local v1, "eventType":I
    :goto_1
    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 90
    return-void

    .line 77
    :cond_5
    const/4 v2, 0x2

    if-ne v1, v2, :cond_10

    .line 78
    invoke-virtual {p0, p1}, Lorg/apache/cordova/ConfigXmlParser;->handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 83
    :cond_b
    :goto_b
    :try_start_b
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_e} :catch_17
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_e} :catch_1c

    move-result v1

    goto :goto_1

    .line 79
    :cond_10
    const/4 v2, 0x3

    if-ne v1, v2, :cond_b

    .line 80
    invoke-virtual {p0, p1}, Lorg/apache/cordova/ConfigXmlParser;->handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_b

    .line 84
    :catch_17
    move-exception v0

    .line 85
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_1

    .line 86
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_1c
    move-exception v0

    .line 87
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method
