.class public Lcom/just/agentweb/JsCallback;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/just/agentweb/԰;
    }
.end annotation


# static fields
.field private static final ̅:Ljava/lang/String; = "javascript:%s.callback(%d, %d %s);"


# instance fields
.field private ̍:Z

.field private ̎:I

.field private ̐:Ljava/lang/String;

.field private ̒:I

.field private ̓:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/webkit/WebView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/just/agentweb/JsCallback;->̍:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/just/agentweb/JsCallback;->̓:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/just/agentweb/JsCallback;->̐:Ljava/lang/String;

    iput p3, p0, Lcom/just/agentweb/JsCallback;->̎:I

    return-void
.end method

.method private ̍(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lorg/json/JSONObject;

    const/4 v1, 0x1

    if-nez v0, :cond_1

    instance-of v0, p1, Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :try_start_1
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return v1

    :catch_1
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_1
    return v1
.end method


# virtual methods
.method public varargs ̎([Ljava/lang/Object;)V
    .locals 8

    iget-object v0, p0, Lcom/just/agentweb/JsCallback;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/just/agentweb/JsCallback;->̍:Z

    if-eqz v0, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p1, v3

    const-string v5, "42"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    instance-of v5, v4, Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/just/agentweb/JsCallback;->̍(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "4C"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v5, :cond_0

    if-nez v6, :cond_0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v5, :cond_1

    if-nez v6, :cond_1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/just/agentweb/JsCallback;->̐:Ljava/lang/String;

    aput-object v1, p1, v2

    iget v1, p0, Lcom/just/agentweb/JsCallback;->̎:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, p1, v3

    iget v1, p0, Lcom/just/agentweb/JsCallback;->̒:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v4, 0x2

    aput-object v1, p1, v4

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, p1, v1

    const-string v0, "04111B001D02150C021A4A4812400206091E0C110E0A46440349524B144D441D485C"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "24032E00020D25041105"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iget-object v0, p0, Lcom/just/agentweb/JsCallback;->̓:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget p1, p0, Lcom/just/agentweb/JsCallback;->̒:I

    if-lez p1, :cond_4

    const/4 v2, 0x1

    :cond_4
    iput-boolean v2, p0, Lcom/just/agentweb/JsCallback;->̍:Z

    return-void

    :cond_5
    new-instance p1, Lcom/just/agentweb/԰;

    const-string v0, "1A180841241224041E02120C0205410E161C49044D110B130A041C0B1E194D0D00090B1D1A500F044E0206091E0B144D0C011302450606110341010F0400"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/just/agentweb/԰;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Lcom/just/agentweb/԰;

    const-string v0, "1A180841390405331B0B074D130B0D0611170A50190E4E150F005224032E00020D050411055005001D4105001700501F040D180409170A"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/just/agentweb/԰;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public ̐(Z)V
    .locals 0

    iput p1, p0, Lcom/just/agentweb/JsCallback;->̒:I

    return-void
.end method
