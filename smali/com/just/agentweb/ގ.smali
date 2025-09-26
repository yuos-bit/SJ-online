.class public abstract Lcom/just/agentweb/ގ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/՗;


# instance fields
.field private ̅:Lcom/just/agentweb/͆;

.field private ̍:Lcom/just/agentweb/ސ;


# direct methods
.method protected constructor <init>(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/just/agentweb/ގ;->̅:Lcom/just/agentweb/͆;

    iput-object p1, p0, Lcom/just/agentweb/ގ;->̍:Lcom/just/agentweb/ސ;

    return-void
.end method


# virtual methods
.method protected ̎()Z
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/ގ;->̅:Lcom/just/agentweb/͆;

    sget-object v1, Lcom/just/agentweb/͆;->̎:Lcom/just/agentweb/͆;

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ގ;->̍:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->͒()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-le v0, v1, :cond_2

    :goto_0
    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public ̿(Ljava/lang/Object;)Z
    .locals 9

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x11

    if-ge v0, v2, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ގ;->̍:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->͒()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    return v1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object p1

    array-length v0, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v0, :cond_5

    aget-object v5, p1, v3

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v6, :cond_3

    aget-object v8, v5, v7

    instance-of v8, v8, Landroid/webkit/JavascriptInterface;

    if-eqz v8, :cond_2

    const/4 v4, 0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_5
    :goto_3
    return v4
.end method
