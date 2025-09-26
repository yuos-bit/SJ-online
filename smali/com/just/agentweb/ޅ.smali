.class public Lcom/just/agentweb/ޅ;
.super Lcom/just/agentweb/ކ;


# static fields
.field public static final ̅:Ljava/lang/String; = "android.webkit.WebChromeClient"

.field public static final ̍:I = 0x18

.field public static final ̎:I = 0x60


# instance fields
.field private ̐:Ljava/lang/String;

.field private ̒:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private ̓:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/just/agentweb/\u0337;",
            ">;"
        }
    .end annotation
.end field

.field private ̔:Landroid/webkit/GeolocationPermissions$Callback;

.field private ̕:Ljava/lang/Object;

.field private ̖:Lcom/just/agentweb/ԩ;

.field private ̗:Lcom/just/agentweb/Ԭ;

.field private ̘:Z

.field private ̙:Ljava/lang/String;

.field private ̚:Lcom/just/agentweb/֋;

.field private ̜:Lcom/just/agentweb/̼;

.field private ̝:Landroid/webkit/WebChromeClient;

.field private ̞:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/just/agentweb/Ԭ;Landroid/webkit/WebChromeClient;Lcom/just/agentweb/ԩ;Lcom/just/agentweb/֋;Landroid/webkit/WebView;)V
    .locals 2

    invoke-direct {p0, p3}, Lcom/just/agentweb/ކ;-><init>(Landroid/webkit/WebChromeClient;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    const-class v1, Lcom/just/agentweb/ޅ;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/just/agentweb/ޅ;->̘:Z

    iput-object v0, p0, Lcom/just/agentweb/ޅ;->̙:Ljava/lang/String;

    iput-object v0, p0, Lcom/just/agentweb/ޅ;->̔:Landroid/webkit/GeolocationPermissions$Callback;

    iput-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    new-instance v0, Lcom/just/agentweb/އ;

    invoke-direct {v0, p0}, Lcom/just/agentweb/އ;-><init>(Lcom/just/agentweb/ޅ;)V

    iput-object v0, p0, Lcom/just/agentweb/ޅ;->̜:Lcom/just/agentweb/̼;

    iput-object p2, p0, Lcom/just/agentweb/ޅ;->̗:Lcom/just/agentweb/Ԭ;

    if-eqz p3, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/just/agentweb/ޅ;->̘:Z

    iput-object p3, p0, Lcom/just/agentweb/ޅ;->̝:Landroid/webkit/WebChromeClient;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    iput-object p4, p0, Lcom/just/agentweb/ޅ;->̖:Lcom/just/agentweb/ԩ;

    iput-object p5, p0, Lcom/just/agentweb/ޅ;->̚:Lcom/just/agentweb/֋;

    iput-object p6, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-static {p6}, Lcom/just/agentweb/͎;->̡(Landroid/webkit/WebView;)Lcom/just/agentweb/̷;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic ̍(Lcom/just/agentweb/ޅ;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic ̓(Lcom/just/agentweb/ޅ;)Landroid/webkit/GeolocationPermissions$Callback;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/ޅ;->̔:Landroid/webkit/GeolocationPermissions$Callback;

    return-object p0
.end method

.method static synthetic ̔(Lcom/just/agentweb/ޅ;Landroid/webkit/GeolocationPermissions$Callback;)Landroid/webkit/GeolocationPermissions$Callback;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ޅ;->̔:Landroid/webkit/GeolocationPermissions$Callback;

    return-object p1
.end method

.method static synthetic ̕(Lcom/just/agentweb/ޅ;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/ޅ;->̙:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic ̖(Lcom/just/agentweb/ޅ;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ޅ;->̙:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic ̗(Lcom/just/agentweb/ޅ;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method private ̘(Landroid/webkit/ValueCallback;Ljava/lang/String;)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    iget-object v5, p0, Lcom/just/agentweb/ޅ;->̚:Lcom/just/agentweb/֋;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v8, 0x0

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v1 .. v8}, Lcom/just/agentweb/͎;->͓(Landroid/app/Activity;Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Lcom/just/agentweb/֋;Landroid/webkit/ValueCallback;Ljava/lang/String;Landroid/os/Handler$Callback;)Z

    return-void

    :cond_2
    :goto_0
    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1, p2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    return-void
.end method

.method private ̙(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 5

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̚:Lcom/just/agentweb/֋;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/just/agentweb/͍;->̒:[Ljava/lang/String;

    const-string v4, "021F0E001A08080B"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v3, v4}, Lcom/just/agentweb/֋;->̓(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2, p1, v1, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    invoke-interface {p2, p1, v1, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void

    :cond_1
    sget-object v2, Lcom/just/agentweb/͍;->̒:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/just/agentweb/͎;->̬(Landroid/app/Activity;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const-string v2, "011E2A04010D0806131A19020F3E0415081B1D03040E0012340D1D19201F0E0311132C1C1A151F0F0F0D5D11001B15"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    goto :goto_0

    :cond_2
    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-static {v1}, Lcom/just/agentweb/̹;->̍([Ljava/lang/String;)Lcom/just/agentweb/̹;

    move-result-object v1

    const/16 v2, 0x60

    invoke-virtual {v1, v2}, Lcom/just/agentweb/̹;->̚(I)Lcom/just/agentweb/̹;

    iget-object v2, p0, Lcom/just/agentweb/ޅ;->̜:Lcom/just/agentweb/̼;

    invoke-virtual {v1, v2}, Lcom/just/agentweb/̹;->̝(Lcom/just/agentweb/̼;)V

    iput-object p2, p0, Lcom/just/agentweb/ޅ;->̔:Landroid/webkit/GeolocationPermissions$Callback;

    iput-object p1, p0, Lcom/just/agentweb/ޅ;->̙:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/just/agentweb/AgentActionFragment;->̗(Landroid/app/Activity;Lcom/just/agentweb/̹;)V

    :goto_0
    return-void
.end method

.method private ̚(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    const/4 p1, 0x0

    if-nez p2, :cond_0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    iget-object v5, p0, Lcom/just/agentweb/ޅ;->̚:Lcom/just/agentweb/֋;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v1 .. v8}, Lcom/just/agentweb/͎;->͓(Landroid/app/Activity;Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Lcom/just/agentweb/֋;Landroid/webkit/ValueCallback;Ljava/lang/String;Landroid/os/Handler$Callback;)Z

    move-result p1

    :cond_2
    :goto_0
    return p1
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 0

    invoke-super {p0, p1}, Lcom/just/agentweb/׼;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 0

    const-wide/16 p1, 0x2

    mul-long p7, p7, p1

    invoke-interface {p9, p7, p8}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    return-void
.end method

.method public onGeolocationPermissionsHidePrompt()V
    .locals 0

    invoke-super {p0}, Lcom/just/agentweb/׼;->onGeolocationPermissionsHidePrompt()V

    return-void
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ޅ;->̙(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    return-void
.end method

.method public onHideCustomView()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̖:Lcom/just/agentweb/ԩ;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/just/agentweb/ԩ;->̲()V

    :cond_0
    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0, p1, p2, p3}, Lcom/just/agentweb/̷;->̖(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p4}, Landroid/webkit/JsResult;->confirm()V

    const/4 p1, 0x1

    return p1
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/just/agentweb/̷;->̗(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 6

    :try_start_0
    iget-object p1, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/just/agentweb/̷;

    iget-object v1, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/just/agentweb/̷;->̘(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    array-length v1, v0

    if-gtz v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    const-string v2, "0F1E09130108034B050B1206081A4F15000101051F020B4F312C362B3F32222F313330202B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "0F1E09130108034B020B0200081D120E0A1C40332C2C2B3326"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    const-string v2, "0F1E09130108034B050B1206081A4F15000101051F020B4F263036273F32222F313330202B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "0F1E09130108034B020B0200081D120E0A1C402228222133233A333B34242E"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-object v1, p0, Lcom/just/agentweb/ޅ;->̚:Lcom/just/agentweb/֋;

    if-eqz v1, :cond_4

    iget-object v2, p0, Lcom/just/agentweb/ޅ;->̞:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v3, "011E3D041C0C0E1601071F03330B101200011A"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v0, v3}, Lcom/just/agentweb/֋;->̓(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    return-void

    :cond_4
    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0, p1}, Lcom/just/agentweb/̷;->̝(Landroid/webkit/PermissionRequest;)V

    :cond_5
    return-void

    :cond_6
    :goto_0
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->deny()V

    return-void
.end method

.method public onPermissionRequestCanceled(Landroid/webkit/PermissionRequest;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/just/agentweb/׼;->onPermissionRequestCanceled(Landroid/webkit/PermissionRequest;)V

    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/׼;->onProgressChanged(Landroid/webkit/WebView;I)V

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̗:Lcom/just/agentweb/Ԭ;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/just/agentweb/Ԭ;->̻(Landroid/webkit/WebView;I)V

    :cond_0
    return-void
.end method

.method public onReachedMaxAppCacheSize(JJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 0

    const-wide/16 p3, 0x2

    mul-long p1, p1, p3

    invoke-interface {p5, p1, p2}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    return-void
.end method

.method public onReceivedIcon(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/׼;->onReceivedIcon(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/just/agentweb/ޅ;->̘:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/׼;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̖:Lcom/just/agentweb/ԩ;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/just/agentweb/ԩ;->̳(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    :cond_0
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const-string v1, "0100080F28080B0031061F02120B135958474040"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/just/agentweb/ޅ;->̚(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z

    move-result p1

    return p1
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const-string v1, "0100080F28080B0031061F02120B135B565C5E"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "445F47"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/just/agentweb/ޅ;->̘(Landroid/webkit/ValueCallback;Ljava/lang/String;)V

    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const-string v1, "0100080F28080B0031061F02120B1359565C5E"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ޅ;->̘(Landroid/webkit/ValueCallback;Ljava/lang/String;)V

    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iget-object p3, p0, Lcom/just/agentweb/ޅ;->̐:Ljava/lang/String;

    const-string v0, "0100080F28080B0031061F02120B135958464041"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ޅ;->̘(Landroid/webkit/ValueCallback;Ljava/lang/String;)V

    return-void
.end method
