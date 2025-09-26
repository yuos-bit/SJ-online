.class public Lcom/just/agentweb/ޕ;
.super Lcom/just/agentweb/ށ;


# instance fields
.field private ̒:Lcom/just/agentweb/AgentWeb;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/just/agentweb/ށ;-><init>()V

    return-void
.end method

.method private ̍(Landroid/content/Context;)Landroid/app/Activity;
    .locals 1

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    return-object p1

    :cond_0
    :goto_0
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_2

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/app/Activity;

    return-object p1

    :cond_1
    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected ̓(Lcom/just/agentweb/AgentWeb;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ޕ;->̒:Lcom/just/agentweb/AgentWeb;

    return-void
.end method

.method public ͉(Landroid/webkit/WebView;Landroid/webkit/DownloadListener;)Lcom/just/agentweb/؄;
    .locals 1

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/just/agentweb/ޕ;->̒:Lcom/just/agentweb/AgentWeb;

    invoke-virtual {p2}, Lcom/just/agentweb/AgentWeb;->̩()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/just/agentweb/ޕ;->̒:Lcom/just/agentweb/AgentWeb;

    invoke-virtual {v0}, Lcom/just/agentweb/AgentWeb;->̳()Lcom/just/agentweb/֋;

    move-result-object v0

    invoke-static {p2, p1, v0}, Lcom/just/agentweb/͛;->̐(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/just/agentweb/֋;)Lcom/just/agentweb/͛;

    move-result-object p2

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/ށ;->͉(Landroid/webkit/WebView;Landroid/webkit/DownloadListener;)Lcom/just/agentweb/؄;

    move-result-object p1

    return-object p1
.end method
