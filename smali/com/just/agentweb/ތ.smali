.class public Lcom/just/agentweb/ތ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/҆;


# instance fields
.field private ̅:Lcom/just/agentweb/΢;

.field private ̍:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/just/agentweb/ތ;->̍:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/just/agentweb/ތ;->̅:Lcom/just/agentweb/΢;

    return-void
.end method

.method public static final ̍(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)Lcom/just/agentweb/ތ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ތ;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/ތ;-><init>(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)V

    return-object v0
.end method


# virtual methods
.method public ̞()Z
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/ތ;->̅:Lcom/just/agentweb/΢;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/just/agentweb/΢;->̚()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ތ;->̍:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/just/agentweb/ތ;->̍:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public ̟(ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p2, 0x4

    if-ne p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/ތ;->̞()Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
