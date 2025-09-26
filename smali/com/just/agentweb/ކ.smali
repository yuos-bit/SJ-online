.class public Lcom/just/agentweb/ކ;
.super Lcom/just/agentweb/׼;


# instance fields
.field private ̅:Lcom/just/agentweb/ކ;


# direct methods
.method protected constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/just/agentweb/׼;-><init>(Landroid/webkit/WebChromeClient;)V

    return-void
.end method

.method protected constructor <init>(Landroid/webkit/WebChromeClient;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/׼;-><init>(Landroid/webkit/WebChromeClient;)V

    return-void
.end method


# virtual methods
.method final ̎(Lcom/just/agentweb/ކ;)Lcom/just/agentweb/ކ;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/just/agentweb/ކ;->̼(Landroid/webkit/WebChromeClient;)V

    iput-object p1, p0, Lcom/just/agentweb/ކ;->̅:Lcom/just/agentweb/ކ;

    return-object p1
.end method

.method final ̒()Lcom/just/agentweb/ކ;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ކ;->̅:Lcom/just/agentweb/ކ;

    return-object v0
.end method

.method final ̼(Landroid/webkit/WebChromeClient;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/just/agentweb/׼;->̼(Landroid/webkit/WebChromeClient;)V

    return-void
.end method
