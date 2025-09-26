.class public Lcom/just/agentweb/ލ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/Ԭ;


# instance fields
.field private ̅:Lcom/just/agentweb/͑;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ̍()Lcom/just/agentweb/ލ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ލ;

    invoke-direct {v0}, Lcom/just/agentweb/ލ;-><init>()V

    return-object v0
.end method


# virtual methods
.method ̐(Lcom/just/agentweb/͑;)Lcom/just/agentweb/ލ;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    return-object p0
.end method

.method public ̔()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/just/agentweb/͑;->̕()V

    :cond_0
    return-void
.end method

.method public ̖(I)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/just/agentweb/͑;->̖(I)V

    :cond_0
    return-void
.end method

.method public ̷()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/just/agentweb/͑;->̔()V

    :cond_0
    return-void
.end method

.method public ̹()Lcom/just/agentweb/͑;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    return-object v0
.end method

.method public ̻(Landroid/webkit/WebView;I)V
    .locals 0

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/ލ;->̔()V

    goto :goto_0

    :cond_0
    const/16 p1, 0xa

    if-lez p2, :cond_1

    if-gt p2, p1, :cond_1

    invoke-virtual {p0}, Lcom/just/agentweb/ލ;->̽()V

    goto :goto_0

    :cond_1
    if-le p2, p1, :cond_2

    const/16 p1, 0x5f

    if-ge p2, p1, :cond_2

    invoke-virtual {p0, p2}, Lcom/just/agentweb/ލ;->̖(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p2}, Lcom/just/agentweb/ލ;->̖(I)V

    invoke-virtual {p0}, Lcom/just/agentweb/ލ;->̷()V

    :goto_0
    return-void
.end method

.method public ̽()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ލ;->̅:Lcom/just/agentweb/͑;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/just/agentweb/͑;->̗()V

    :cond_0
    return-void
.end method
