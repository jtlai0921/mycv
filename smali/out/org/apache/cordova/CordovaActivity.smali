.class public Lorg/apache/cordova/CordovaActivity;
.super Landroid/app/Activity;
.source "CordovaActivity.java"


# static fields
.field private static ACTIVITY_EXITING:I

.field private static ACTIVITY_RUNNING:I

.field private static ACTIVITY_STARTING:I

.field public static TAG:Ljava/lang/String;


# instance fields
.field protected appView:Lorg/apache/cordova/CordovaWebView;

.field protected cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

.field protected immersiveMode:Z

.field protected keepRunning:Z

.field protected launchUrl:Ljava/lang/String;

.field protected pluginEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected preferences:Lorg/apache/cordova/CordovaPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 85
    const-string v0, "CordovaActivity"

    sput-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/CordovaActivity;->ACTIVITY_STARTING:I

    .line 91
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/CordovaActivity;->ACTIVITY_RUNNING:I

    .line 92
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/CordovaActivity;->ACTIVITY_EXITING:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 84
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    .line 84
    return-void
.end method


# virtual methods
.method protected createViews()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 184
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    .line 185
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v2

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 187
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 185
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/cordova/CordovaActivity;->setContentView(Landroid/view/View;)V

    .line 191
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "BackgroundColor"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CordovaPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 193
    :try_start_2d
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "BackgroundColor"

    const/high16 v4, -0x1000000

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 195
    .local v0, "backgroundColor":I
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_40
    .catch Ljava/lang/NumberFormatException; {:try_start_2d .. :try_end_40} :catch_4a

    .line 202
    .end local v0    # "backgroundColor":I
    :cond_40
    :goto_40
    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->requestFocusFromTouch()Z

    .line 203
    return-void

    .line 197
    :catch_4a
    move-exception v1

    .line 198
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_40
.end method

.method public displayError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 12
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "button"    # Ljava/lang/String;
    .param p4, "exit"    # Z

    .prologue
    .line 424
    move-object v2, p0

    .line 425
    .local v2, "me":Lorg/apache/cordova/CordovaActivity;
    new-instance v0, Lorg/apache/cordova/CordovaActivity$4;

    move-object v1, p0

    move-object v3, p2

    move-object v4, p1

    move-object v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaActivity$4;-><init>(Lorg/apache/cordova/CordovaActivity;Lorg/apache/cordova/CordovaActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v2, v0}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 448
    return-void
.end method

.method protected init()V
    .registers 6

    .prologue
    .line 155
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeWebView()Lorg/apache/cordova/CordovaWebView;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 156
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->createViews()V

    .line 157
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 158
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v3, p0, Lorg/apache/cordova/CordovaActivity;->pluginEntries:Ljava/util/ArrayList;

    iget-object v4, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-interface {v1, v2, v3, v4}, Lorg/apache/cordova/CordovaWebView;->init(Lorg/apache/cordova/CordovaInterface;Ljava/util/List;Lorg/apache/cordova/CordovaPreferences;)V

    .line 160
    :cond_1c
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaInterfaceImpl;->onCordovaInit(Lorg/apache/cordova/PluginManager;)V

    .line 163
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "DefaultVolumeStream"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "volumePref":Ljava/lang/String;
    const-string v1, "media"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 165
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaActivity;->setVolumeControlStream(I)V

    .line 167
    :cond_43
    return-void
.end method

.method protected loadConfig()V
    .registers 4

    .prologue
    .line 171
    new-instance v0, Lorg/apache/cordova/ConfigXmlParser;

    invoke-direct {v0}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 172
    .local v0, "parser":Lorg/apache/cordova/ConfigXmlParser;
    invoke-virtual {v0, p0}, Lorg/apache/cordova/ConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 173
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    .line 174
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaPreferences;->setPreferencesBundle(Landroid/os/Bundle;)V

    .line 175
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrl()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->launchUrl:Ljava/lang/String;

    .line 176
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getPluginEntries()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->pluginEntries:Ljava/util/ArrayList;

    .line 177
    sput-object v0, Lorg/apache/cordova/Config;->parser:Lorg/apache/cordova/ConfigXmlParser;

    .line 178
    return-void
.end method

.method public loadUrl(Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 232
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_8

    .line 233
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->init()V

    .line 237
    :cond_8
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "KeepRunning"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    .line 239
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0, p1, v2}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;Z)V

    .line 242
    return-void
.end method

.method protected makeCordovaInterface()Lorg/apache/cordova/CordovaInterfaceImpl;
    .registers 2

    .prologue
    .line 219
    new-instance v0, Lorg/apache/cordova/CordovaActivity$1;

    invoke-direct {v0, p0, p0}, Lorg/apache/cordova/CordovaActivity$1;-><init>(Lorg/apache/cordova/CordovaActivity;Landroid/app/Activity;)V

    return-object v0
.end method

.method protected makeWebView()Lorg/apache/cordova/CordovaWebView;
    .registers 3

    .prologue
    .line 211
    new-instance v0, Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeWebViewEngine()Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/cordova/CordovaWebViewImpl;-><init>(Lorg/apache/cordova/CordovaWebViewEngine;)V

    return-object v0
.end method

.method protected makeWebViewEngine()Lorg/apache/cordova/CordovaWebViewEngine;
    .registers 2

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-static {p0, v0}, Lorg/apache/cordova/CordovaWebViewImpl;->createEngine(Landroid/content/Context;Lorg/apache/cordova/CordovaPreferences;)Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v0

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 368
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Incoming Result. Request code = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 370
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl;->onActivityResult(IILandroid/content/Intent;)Z

    .line 371
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 510
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 511
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v1, :cond_8

    .line 518
    :cond_7
    :goto_7
    return-void

    .line 514
    :cond_8
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    .line 515
    .local v0, "pm":Lorg/apache/cordova/PluginManager;
    if-eqz v0, :cond_7

    .line 516
    invoke-virtual {v0, p1}, Lorg/apache/cordova/PluginManager;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_7
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x800

    const/16 v6, 0x400

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 114
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->loadConfig()V

    .line 116
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "loglevel"

    const-string v3, "ERROR"

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "logLevel":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/cordova/LOG;->setLogLevel(Ljava/lang/String;)V

    .line 119
    sget-object v1, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v2, "Apache Cordova native platform version 7.1.4 is starting"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    sget-object v1, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v2, "CordovaActivity.onCreate()"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "ShowTitle"

    invoke-virtual {v1, v2, v4}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_35

    .line 123
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/Window;->requestFeature(I)Z

    .line 126
    :cond_35
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "SetFullscreen"

    invoke-virtual {v1, v2, v4}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 127
    sget-object v1, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v2, "The SetFullscreen configuration is deprecated in favor of Fullscreen, and will be removed in a future version."

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "Fullscreen"

    invoke-virtual {v1, v2, v5}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;Z)V

    .line 130
    :cond_4d
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "Fullscreen"

    invoke-virtual {v1, v2, v4}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_7c

    .line 135
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "FullscreenNotImmersive"

    invoke-virtual {v1, v2, v4}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_74

    .line 136
    iput-boolean v5, p0, Lorg/apache/cordova/CordovaActivity;->immersiveMode:Z

    .line 146
    :goto_63
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 148
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeCordovaInterface()Lorg/apache/cordova/CordovaInterfaceImpl;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    .line 149
    if-eqz p1, :cond_73

    .line 150
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v1, p1}, Lorg/apache/cordova/CordovaInterfaceImpl;->restoreInstanceState(Landroid/os/Bundle;)V

    .line 152
    :cond_73
    return-void

    .line 138
    :cond_74
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v6, v6}, Landroid/view/Window;->setFlags(II)V

    goto :goto_63

    .line 142
    :cond_7c
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v7, v7}, Landroid/view/Window;->setFlags(II)V

    goto :goto_63
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 455
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_f

    .line 456
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onCreateOptionsMenu"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    :cond_f
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 322
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "CordovaActivity.onDestroy()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 325
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_13

    .line 326
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleDestroy()V

    .line 328
    :cond_13
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 485
    const-string v2, "onReceivedError"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    move-object v0, p2

    .line 486
    check-cast v0, Lorg/json/JSONObject;

    .line 488
    .local v0, "d":Lorg/json/JSONObject;
    :try_start_b
    const-string v2, "errorCode"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "description"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "url"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/cordova/CordovaActivity;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_20} :catch_22

    .line 495
    .end local v0    # "d":Lorg/json/JSONObject;
    :cond_20
    :goto_20
    const/4 v2, 0x0

    return-object v2

    .line 489
    .restart local v0    # "d":Lorg/json/JSONObject;
    :catch_22
    move-exception v1

    .line 490
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_20

    .line 492
    .end local v0    # "d":Lorg/json/JSONObject;
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_27
    const-string v2, "exit"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 493
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->finish()V

    goto :goto_20
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 265
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 267
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_c

    .line 268
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0, p1}, Lorg/apache/cordova/CordovaWebView;->onNewIntent(Landroid/content/Intent;)V

    .line 269
    :cond_c
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 471
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_f

    .line 472
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onOptionsItemSelected"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    :cond_f
    const/4 v0, 0x1

    return v0
.end method

.method protected onPause()V
    .registers 4

    .prologue
    .line 249
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 250
    sget-object v1, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v2, "Paused the activity."

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v1, :cond_1e

    .line 255
    iget-boolean v1, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    if-nez v1, :cond_1f

    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v1, v1, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    if-nez v1, :cond_1f

    const/4 v0, 0x0

    .line 256
    .local v0, "keepRunning":Z
    :goto_19
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1, v0}, Lorg/apache/cordova/CordovaWebView;->handlePause(Z)V

    .line 258
    .end local v0    # "keepRunning":Z
    :cond_1e
    return-void

    .line 255
    :cond_1f
    const/4 v0, 0x1

    goto :goto_19
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 463
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_f

    .line 464
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onPrepareOptionsMenu"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    :cond_f
    const/4 v0, 0x1

    return v0
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .registers 16
    .param p1, "errorCode"    # I
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 382
    move-object v4, p0

    .line 385
    .local v4, "me":Lorg/apache/cordova/CordovaActivity;
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "errorUrl"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 386
    .local v5, "errorUrl":Ljava/lang/String;
    if-eqz v5, :cond_22

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_22

    .line 388
    new-instance v0, Lorg/apache/cordova/CordovaActivity$2;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/CordovaActivity$2;-><init>(Lorg/apache/cordova/CordovaActivity;ILjava/lang/String;Lorg/apache/cordova/CordovaActivity;Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 418
    :goto_21
    return-void

    .line 408
    :cond_22
    const/4 v0, -0x2

    if-ne p1, v0, :cond_33

    const/4 v8, 0x0

    .line 409
    .local v8, "exit":Z
    :goto_26
    new-instance v6, Lorg/apache/cordova/CordovaActivity$3;

    move-object v7, p0

    move-object v9, v4

    move-object v10, p2

    move-object v11, p3

    invoke-direct/range {v6 .. v11}, Lorg/apache/cordova/CordovaActivity$3;-><init>(Lorg/apache/cordova/CordovaActivity;ZLorg/apache/cordova/CordovaActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_21

    .line 408
    .end local v8    # "exit":Z
    :cond_33
    const/4 v8, 0x1

    goto :goto_26
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 532
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl;->onRequestPermissionResult(I[Ljava/lang/String;[I)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    .line 540
    :goto_5
    return-void

    .line 534
    :catch_6
    move-exception v0

    .line 536
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v2, "JSONException: Parameters fed into the method are not valid"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 276
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 277
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Resumed the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_f

    .line 287
    :goto_e
    return-void

    .line 284
    :cond_f
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 286
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-boolean v1, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    invoke-interface {v0, v1}, Lorg/apache/cordova/CordovaWebView;->handleResume(Z)V

    goto :goto_e
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 499
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaInterfaceImpl;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 500
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 501
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 308
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 309
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Started the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_f

    .line 315
    :goto_e
    return-void

    .line 314
    :cond_f
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleStart()V

    goto :goto_e
.end method

.method protected onStop()V
    .registers 3

    .prologue
    .line 294
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 295
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Stopped the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_f

    .line 301
    :goto_e
    return-void

    .line 300
    :cond_f
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleStop()V

    goto :goto_e
.end method

.method public onWindowFocusChanged(Z)V
    .registers 5
    .param p1, "hasFocus"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 336
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 337
    if-eqz p1, :cond_18

    iget-boolean v1, p0, Lorg/apache/cordova/CordovaActivity;->immersiveMode:Z

    if-eqz v1, :cond_18

    .line 338
    const/16 v0, 0x1706

    .line 345
    .local v0, "uiOptions":I
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x1706

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 347
    .end local v0    # "uiOptions":I
    :cond_18
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I
    .param p3, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CordovaInterfaceImpl;->setActivityResultRequestCode(I)V

    .line 354
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 355
    return-void
.end method
