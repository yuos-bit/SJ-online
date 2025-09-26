.class public Lcom/just/agentweb/ޒ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/؝;


# instance fields
.field private ̅:Ljava/lang/String;

.field private ̍:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/ޒ;->̅:Ljava/lang/String;

    iput p1, p0, Lcom/just/agentweb/ޒ;->̍:I

    return-void
.end method

.method public static ̍(I)Lcom/just/agentweb/ޒ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ޒ;

    invoke-direct {v0, p0}, Lcom/just/agentweb/ޒ;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public ͌(Landroid/webkit/WebView;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-gt v1, v0, :cond_1

    const/16 v1, 0x11

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "1D150C130D09250A0A24111B002C130E01150B2F"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    const-string v0, "0F130E041D120E071B02191918"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    const-string v0, "0F130E041D120E071B021919183A130613171C030C0D"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public ͍(Landroidx/collection/ArrayMap;Lcom/just/agentweb/͆;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/just/agentweb/\u0346;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/just/agentweb/͆;->̎:Lcom/just/agentweb/͆;

    if-ne p2, v0, :cond_0

    iget p2, p0, Lcom/just/agentweb/ޒ;->̍:I

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x11

    if-ge p2, v0, :cond_0

    iget-object p2, p0, Lcom/just/agentweb/ޒ;->̅:Ljava/lang/String;

    const-string v0, "29191B044E14174513021C4D08000B0206064E1F0F0B0B021316"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/collection/ArrayMap;->clear()V

    invoke-static {}, Ljava/lang/System;->gc()V

    :cond_0
    return-void
.end method
