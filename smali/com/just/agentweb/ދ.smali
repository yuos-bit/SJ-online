.class public Lcom/just/agentweb/ދ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/׿;


# instance fields
.field private ̅:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/webkit/WebView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    return-void
.end method


# virtual methods
.method public ͆()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->resumeTimers()V

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    invoke-static {v0}, Lcom/just/agentweb/͎;->̖(Landroid/webkit/WebView;)V

    return-void
.end method

.method public ͇()V
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->pauseTimers()V

    :cond_1
    return-void
.end method

.method public ͈()V
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ދ;->̅:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->resumeTimers()V

    :cond_1
    return-void
.end method
