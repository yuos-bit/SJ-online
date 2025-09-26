.class public Lcom/just/agentweb/ޑ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/ؠ;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/just/agentweb/\u0620<",
        "Lcom/just/agentweb/\u061d;",
        ">;"
    }
.end annotation


# instance fields
.field private ̅:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private ̍:Lcom/just/agentweb/͆;

.field private ̎:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Landroidx/collection/ArrayMap;Lcom/just/agentweb/͆;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/just/agentweb/\u0346;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/just/agentweb/ޑ;->̎:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/just/agentweb/ޑ;->̅:Landroidx/collection/ArrayMap;

    iput-object p3, p0, Lcom/just/agentweb/ޑ;->̍:Lcom/just/agentweb/͆;

    return-void
.end method


# virtual methods
.method public ͎(Lcom/just/agentweb/؝;)V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ޑ;->̎:Landroid/webkit/WebView;

    invoke-interface {p1, v0}, Lcom/just/agentweb/؝;->͌(Landroid/webkit/WebView;)V

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ޑ;->̅:Landroidx/collection/ArrayMap;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/just/agentweb/ޑ;->̍:Lcom/just/agentweb/͆;

    sget-object v2, Lcom/just/agentweb/͆;->̎:Lcom/just/agentweb/͆;

    if-ne v1, v2, :cond_1

    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/just/agentweb/ޑ;->̅:Landroidx/collection/ArrayMap;

    iget-object v1, p0, Lcom/just/agentweb/ޑ;->̍:Lcom/just/agentweb/͆;

    invoke-interface {p1, v0, v1}, Lcom/just/agentweb/؝;->͍(Landroidx/collection/ArrayMap;Lcom/just/agentweb/͆;)V

    :cond_1
    return-void
.end method

.method public bridge synthetic ͎(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/just/agentweb/؝;

    invoke-virtual {p0, p1}, Lcom/just/agentweb/ޑ;->͎(Lcom/just/agentweb/؝;)V

    return-void
.end method
