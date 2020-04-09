.class public Lcom/app/jtlai/MainActivity;
.super Lorg/apache/cordova/CordovaActivity;
.source "MainActivity.java"


# static fields
.field public static hasSplashPlugin:Z


# instance fields
.field private splashImageView:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const/4 v0, 0x0

    sput-boolean v0, Lcom/app/jtlai/MainActivity;->hasSplashPlugin:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/app/jtlai/MainActivity;)Lorg/apache/cordova/CordovaWebView;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/app/jtlai/MainActivity;)Lorg/apache/cordova/CordovaWebView;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/app/jtlai/MainActivity;)Lorg/apache/cordova/CordovaInterfaceImpl;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    return-object v0
.end method


# virtual methods
.method public checkDeviceHasNavigationBar(Landroid/content/Context;)Z
    .registers 6

    .prologue
    .line 104
    const/4 v0, 0x4

    .line 105
    invoke-static {v0}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v0

    .line 107
    if-nez v0, :cond_34

    .line 109
    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p0, p1}, Lcom/app/jtlai/MainActivity;->getNavigationBarHeight(Landroid/app/Activity;)I

    move-result v0

    .line 110
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    .line 111
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 112
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 113
    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v3

    sub-int v0, v3, v0

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 114
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 115
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 117
    const/4 v0, 0x1

    .line 121
    :goto_33
    return v0

    .line 119
    :cond_34
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->hideBottomUIMenu()V

    .line 121
    const/4 v0, 0x0

    goto :goto_33
.end method

.method public fitScreen()V
    .registers 2

    .prologue
    .line 134
    new-instance v0, Lcom/app/jtlai/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/app/jtlai/MainActivity$2;-><init>(Lcom/app/jtlai/MainActivity;)V

    .line 149
    invoke-virtual {v0}, Lcom/app/jtlai/MainActivity$2;->start()V

    .line 150
    return-void
.end method

.method public getNavigationBarHeight(Landroid/app/Activity;)I
    .registers 6

    .prologue
    .line 125
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 126
    const-string v1, "navigation_bar_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 129
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 130
    return v0
.end method

.method public getSplashImageView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method protected hideBottomUIMenu()V
    .registers 4

    .prologue
    const/16 v2, 0x13

    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_1a

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v2, :cond_1a

    .line 89
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 90
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 98
    :cond_19
    :goto_19
    return-void

    .line 91
    :cond_1a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_19

    .line 93
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 94
    const/16 v1, 0x1002

    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_19
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 7

    .prologue
    const/16 v2, 0x400

    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 27
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 29
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_23

    .line 30
    invoke-virtual {p0, v4}, Lcom/app/jtlai/MainActivity;->requestWindowFeature(I)Z

    .line 31
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 34
    :cond_23
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 35
    if-eqz v0, :cond_39

    const-string v1, "cdvStartInBackground"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 36
    invoke-virtual {p0, v4}, Lcom/app/jtlai/MainActivity;->moveTaskToBack(Z)Z

    .line 39
    :cond_39
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    .line 40
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    const/high16 v1, 0x7f020000

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 43
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 44
    iget-object v1, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    iget-object v1, p0, Lcom/app/jtlai/MainActivity;->launchUrl:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/app/jtlai/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 49
    iget-object v1, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Lcom/app/jtlai/MainActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->fitScreen()V

    .line 51
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .prologue
    .line 54
    const-string v0, "onPageFinished"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 55
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_25

    sget-boolean v0, Lcom/app/jtlai/MainActivity;->hasSplashPlugin:Z

    if-nez v0, :cond_25

    .line 56
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 58
    :cond_25
    invoke-virtual {p0}, Lcom/app/jtlai/MainActivity;->setFullScreen()V

    .line 60
    :cond_28
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaActivity;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 79
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 80
    iget-object v0, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/app/jtlai/MainActivity;->splashImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 81
    :cond_19
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/CordovaActivity;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public setFullScreen()V
    .registers 2

    .prologue
    .line 63
    new-instance v0, Lcom/app/jtlai/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/app/jtlai/MainActivity$1;-><init>(Lcom/app/jtlai/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/app/jtlai/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 73
    return-void
.end method
