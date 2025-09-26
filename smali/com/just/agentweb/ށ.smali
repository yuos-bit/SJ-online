.class public abstract Lcom/just/agentweb/ށ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/҅;
.implements Lcom/just/agentweb/؄;


# static fields
.field private static final ̅:Ljava/lang/String; = "AbsAgentWebSettings"

.field public static final ̍:Ljava/lang/String; = " AgentWeb/5.0.0 "

.field public static final ̎:Ljava/lang/String; = " MQQBrowser/8.0 "

.field public static final ̐:Ljava/lang/String; = " UCBrowser/11.6.4.950 "


# instance fields
.field protected ̒:Lcom/just/agentweb/AgentWeb;

.field private ̓:Landroid/webkit/WebSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ̎()Lcom/just/agentweb/ށ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ޕ;

    invoke-direct {v0}, Lcom/just/agentweb/ޕ;-><init>()V

    return-object v0
.end method

.method private ̐(Landroid/webkit/WebView;)V
    .locals 7

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/just/agentweb/͎;->̎(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/16 v6, 0x13

    if-lt v0, v3, :cond_1

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v2}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    :goto_1
    invoke-virtual {p1, v4, v5}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_2

    :cond_1
    if-lt v0, v6, :cond_2

    goto :goto_1

    :cond_2
    if-ge v0, v6, :cond_3

    invoke-virtual {p1, v1, v5}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    :cond_3
    :goto_2
    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const/16 v4, 0x64

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v1}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v1}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v2}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    iget-object v3, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    const/16 v3, 0x10

    if-lt v0, v3, :cond_4

    iget-object v4, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v4, v2}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    iget-object v4, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v4, v2}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    :cond_4
    iget-object v4, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v4, v1}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    if-lt v0, v6, :cond_5

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    sget-object v4, Landroid/webkit/WebSettings$LayoutAlgorithm;->SINGLE_COLUMN:Landroid/webkit/WebSettings$LayoutAlgorithm;

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    sget-object v4, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    :goto_3
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setNeedInitialFocus(Z)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const-string v2, "1B040B4C56"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDefaultFontSize(I)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setMinimumFontSize(I)V

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/just/agentweb/͈;->̔(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/just/agentweb/ށ;->̅:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0A191F5B"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "4E504D001E11040411061557"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/just/agentweb/͈;->̔(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setGeolocationDatabasePath(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    const-wide v2, 0x7fffffffffffffffL

    invoke-virtual {p1, v2, v3}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    iget-object p1, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {p0}, Lcom/just/agentweb/ށ;->̜()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "4E310A04001530001041454351405147"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "4E252E231C0E1016171C5F5C50405749515C57455D41"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "3B0308132F06020B063D041F080006475F52"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method final ̒(Lcom/just/agentweb/AgentWeb;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ށ;->̒:Lcom/just/agentweb/AgentWeb;

    invoke-virtual {p0, p1}, Lcom/just/agentweb/ށ;->̓(Lcom/just/agentweb/AgentWeb;)V

    return-void
.end method

.method protected abstract ̓(Lcom/just/agentweb/AgentWeb;)V
.end method

.method public ̜()Landroid/webkit/WebSettings;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ށ;->̓:Landroid/webkit/WebSettings;

    return-object v0
.end method

.method public ̝(Landroid/webkit/WebView;)Lcom/just/agentweb/҅;
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/ށ;->̐(Landroid/webkit/WebView;)V

    return-object p0
.end method

.method public ͉(Landroid/webkit/WebView;Landroid/webkit/DownloadListener;)Lcom/just/agentweb/؄;
    .locals 0

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    return-object p0
.end method

.method public ͊(Landroid/webkit/WebView;Landroid/webkit/WebChromeClient;)Lcom/just/agentweb/؄;
    .locals 0

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-object p0
.end method

.method public ͋(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)Lcom/just/agentweb/؄;
    .locals 0

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-object p0
.end method
