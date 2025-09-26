.class public Lcom/just/agentweb/ԭ;
.super Lcom/just/agentweb/͒;


# instance fields
.field private ̍:Landroid/os/Handler;

.field private ̎:Landroid/webkit/WebView;


# direct methods
.method private constructor <init>(Landroid/webkit/WebView;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/just/agentweb/͒;-><init>(Landroid/webkit/WebView;)V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/just/agentweb/ԭ;->̍:Landroid/os/Handler;

    iput-object p1, p0, Lcom/just/agentweb/ԭ;->̎:Landroid/webkit/WebView;

    return-void
.end method

.method public static ̍(Landroid/webkit/WebView;)Lcom/just/agentweb/ԭ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ԭ;

    invoke-direct {v0, p0}, Lcom/just/agentweb/ԭ;-><init>(Landroid/webkit/WebView;)V

    return-object v0
.end method

.method private ̎(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/ԭ;->̍:Landroid/os/Handler;

    new-instance v1, Lcom/just/agentweb/Ԯ;

    invoke-direct {v1, p0, p1, p2}, Lcom/just/agentweb/Ԯ;-><init>(Lcom/just/agentweb/ԭ;Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public ̙(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ԭ;->̎(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/͒;->̙(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
