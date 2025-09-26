.class public Lcom/just/agentweb/׮;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/Ԩ;


# static fields
.field public static final ̅:Ljava/lang/String; = "UrlLoaderImpl"


# instance fields
.field private ̍:Landroid/os/Handler;

.field private ̎:Lcom/just/agentweb/҄;

.field private ̐:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/webkit/WebView;Lcom/just/agentweb/҄;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    iput-object p1, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/just/agentweb/׮;->̎:Lcom/just/agentweb/҄;

    if-nez p2, :cond_0

    invoke-static {}, Lcom/just/agentweb/҄;->̍()Lcom/just/agentweb/҄;

    move-result-object p1

    iput-object p1, p0, Lcom/just/agentweb/׮;->̎:Lcom/just/agentweb/҄;

    :cond_0
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    return-void
.end method

.method private ̎(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/ׯ;

    invoke-direct {v1, p0, p1}, Lcom/just/agentweb/ׯ;-><init>(Lcom/just/agentweb/׮;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private ̐()V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/׵;

    invoke-direct {v1, p0}, Lcom/just/agentweb/׵;-><init>(Lcom/just/agentweb/׮;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public ̠()Lcom/just/agentweb/҄;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/׮;->̎:Lcom/just/agentweb/҄;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/just/agentweb/҄;->̍()Lcom/just/agentweb/҄;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/׮;->̎:Lcom/just/agentweb/҄;

    :cond_0
    return-object v0
.end method

.method public ̡(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/׸;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/just/agentweb/׸;-><init>(Lcom/just/agentweb/׮;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public ̢(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v8, Lcom/just/agentweb/׺;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/just/agentweb/׺;-><init>(Lcom/just/agentweb/׮;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object v1, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public ̩(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/׮;->̎:Lcom/just/agentweb/҄;

    invoke-virtual {v0, p1}, Lcom/just/agentweb/҄;->̓(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/just/agentweb/׮;->̩(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public ̩(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/just/agentweb/׶;

    invoke-direct {v0, p0, p1, p2}, Lcom/just/agentweb/׶;-><init>(Lcom/just/agentweb/׮;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v0}, Lcom/just/agentweb/͎;->͏(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    sget-object v0, Lcom/just/agentweb/׮;->̅:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "021F0C053B130B5F"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E1808000A04151648"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_2

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {p2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public ̫(Ljava/lang/String;[B)V
    .locals 2

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/׻;

    invoke-direct {v1, p0, p1, p2}, Lcom/just/agentweb/׻;-><init>(Lcom/just/agentweb/׮;Ljava/lang/String;[B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->postUrl(Ljava/lang/String;[B)V

    return-void
.end method

.method public ̬()V
    .locals 2

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/׷;

    invoke-direct {v1, p0}, Lcom/just/agentweb/׷;-><init>(Lcom/just/agentweb/׮;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    return-void
.end method

.method public ̯()V
    .locals 2

    invoke-static {}, Lcom/just/agentweb/͎;->͍()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/׮;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/׹;

    invoke-direct {v1, p0}, Lcom/just/agentweb/׹;-><init>(Lcom/just/agentweb/׮;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/׮;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    return-void
.end method
