.class public Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;
.super Ljava/lang/Object;
.source "AndroidBug5497Workaround.java"


# instance fields
.field private frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

.field private mActivity:Landroid/app/Activity;

.field private mChildOfContent:Landroid/view/View;

.field private statusBarHeight:I

.field private usableHeightPrevious:I


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mActivity:Landroid/app/Activity;

    .line 35
    const v1, 0x1020002

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 36
    .local v0, "content":Landroid/widget/FrameLayout;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    .line 37
    invoke-direct {p0}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->getStatusBarHeight()I

    move-result v1

    iput v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->statusBarHeight:I

    .line 38
    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;

    invoke-direct {v2, p0, p1}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround$1;-><init>(Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 43
    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iput-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    .line 44
    return-void
.end method

.method static synthetic access$0(Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;Landroid/app/Activity;)V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->possiblyResizeChildOfContent(Landroid/app/Activity;)V

    return-void
.end method

.method public static assistActivity(Landroid/app/Activity;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 24
    new-instance v0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;

    invoke-direct {v0, p0}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;-><init>(Landroid/app/Activity;)V

    .line 25
    return-void
.end method

.method private computeUsableHeight()I
    .registers 4

    .prologue
    .line 70
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 71
    .local v0, "r":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 72
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->statusBarHeight:I

    add-int/2addr v1, v2

    return v1
.end method

.method private getStatusBarHeight()I
    .registers 8

    .prologue
    .line 77
    :try_start_0
    const-string v6, "com.android.internal.R$dimen"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 78
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 79
    .local v4, "obj":Ljava/lang/Object;
    const-string v6, "status_bar_height"

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 80
    .local v3, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 81
    .local v5, "x":I
    iget-object v6, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mActivity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_27

    move-result v1

    .line 86
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "field":Ljava/lang/reflect/Field;
    .end local v4    # "obj":Ljava/lang/Object;
    .end local v5    # "x":I
    :goto_26
    return v1

    .line 83
    :catch_27
    move-exception v2

    .line 84
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 86
    const/4 v1, 0x0

    goto :goto_26
.end method

.method private possiblyResizeChildOfContent(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->computeUsableHeight()I

    move-result v1

    .line 48
    .local v1, "usableHeightNow":I
    iget v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->usableHeightPrevious:I

    if-eq v1, v3, :cond_25

    .line 49
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 50
    .local v2, "usableHeightSansKeyboard":I
    sub-int v0, v2, v1

    .line 51
    .local v0, "heightDifference":I
    div-int/lit8 v3, v2, 0x4

    if-le v0, v3, :cond_26

    .line 53
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    sub-int v4, v2, v0

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 54
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 55
    iput v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->usableHeightPrevious:I

    .line 67
    .end local v0    # "heightDifference":I
    .end local v2    # "usableHeightSansKeyboard":I
    :cond_25
    :goto_25
    return-void

    .line 59
    .restart local v0    # "heightDifference":I
    .restart local v2    # "usableHeightSansKeyboard":I
    :cond_26
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 60
    iget-object v3, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 61
    iput v1, p0, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->usableHeightPrevious:I

    goto :goto_25
.end method


# virtual methods
.method public checkDeviceHasNavigationBar(Landroid/content/Context;)Z
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 110
    const/4 v5, 0x4

    invoke-static {v5}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v1

    .line 112
    .local v1, "hasBackKey":Z
    if-nez v1, :cond_3c

    move-object v5, p1

    .line 114
    check-cast v5, Landroid/app/Activity;

    invoke-virtual {p0, v5}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->getNavigationBarHeight(Landroid/app/Activity;)I

    move-result v3

    .local v3, "navHeight":I
    move-object v5, p1

    .line 115
    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    .line 116
    .local v2, "m":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .local v0, "d":Landroid/view/Display;
    move-object v5, p1

    .line 117
    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    .line 118
    .local v4, "p":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v5

    sub-int/2addr v5, v3

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 119
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v5

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 120
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 122
    const/4 v5, 0x1

    .line 126
    .end local v0    # "d":Landroid/view/Display;
    .end local v2    # "m":Landroid/view/WindowManager;
    .end local v3    # "navHeight":I
    .end local v4    # "p":Landroid/view/WindowManager$LayoutParams;
    :goto_3b
    return v5

    .line 124
    .restart local p1    # "context":Landroid/content/Context;
    :cond_3c
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1}, Lcom/lbuilder/cordova/plugins/AndroidBug5497Workaround;->hideBottomUIMenu(Landroid/app/Activity;)V

    .line 126
    const/4 v5, 0x0

    goto :goto_3b
.end method

.method public getNavigationBarHeight(Landroid/app/Activity;)I
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 130
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 131
    .local v2, "resources":Landroid/content/res/Resources;
    const-string v3, "navigation_bar_height"

    .line 132
    const-string v4, "dimen"

    const-string v5, "android"

    .line 131
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 134
    .local v1, "resourceId":I
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 135
    .local v0, "height":I
    return v0
.end method

.method protected hideBottomUIMenu(Landroid/app/Activity;)V
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/16 v5, 0x13

    .line 93
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-le v3, v4, :cond_1a

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v5, :cond_1a

    .line 94
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 95
    .local v2, "v":Landroid/view/View;
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 103
    .end local v2    # "v":Landroid/view/View;
    :cond_19
    :goto_19
    return-void

    .line 96
    :cond_1a
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v5, :cond_19

    .line 98
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 99
    .local v0, "decorView":Landroid/view/View;
    const/16 v1, 0x1002

    .line 101
    .local v1, "uiOptions":I
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_19
.end method
