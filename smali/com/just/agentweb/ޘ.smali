.class public Lcom/just/agentweb/ޘ;
.super Lcom/just/agentweb/ގ;


# static fields
.field private static final ̅:Ljava/lang/String; = "JsInterfaceHolderImpl"


# instance fields
.field private ̍:Lcom/just/agentweb/͆;

.field private ̎:Lcom/just/agentweb/ސ;

.field private ̐:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ގ;-><init>(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)V

    iput-object p1, p0, Lcom/just/agentweb/ޘ;->̎:Lcom/just/agentweb/ސ;

    invoke-interface {p1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object p1

    iput-object p1, p0, Lcom/just/agentweb/ޘ;->̐:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/just/agentweb/ޘ;->̍:Lcom/just/agentweb/͆;

    return-void
.end method

.method private ̐(Ljava/lang/String;Ljava/lang/Object;)Lcom/just/agentweb/՗;
    .locals 3

    sget-object v0, Lcom/just/agentweb/ޘ;->̅:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "054A"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E501B5B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/just/agentweb/ޘ;->̐:Landroid/webkit/WebView;

    invoke-virtual {v0, p2, p1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method static ̒(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)Lcom/just/agentweb/ޘ;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ޘ;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/ޘ;-><init>(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)V

    return-object v0
.end method


# virtual methods
.method public ̼(Ljava/lang/String;Ljava/lang/Object;)Lcom/just/agentweb/՗;
    .locals 1

    invoke-virtual {p0}, Lcom/just/agentweb/ގ;->̎()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/just/agentweb/ގ;->̿(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/ޘ;->̐(Ljava/lang/String;Ljava/lang/Object;)Lcom/just/agentweb/՗;

    return-object p0

    :cond_1
    new-instance p1, Lcom/just/agentweb/՘;

    const-string p2, "1A1804124E0E050F170D044D090F12470B1D1A500207080415451F0B04050E0A410D04040F030E13071113450601500E00020D4749521E1C08001D0447061A0B1306410F05032F1318111E021C0817113B0004081308000400520F1E030E1A00130C1D00501A001D410500520F1409040A"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/just/agentweb/՘;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public ̾(Ljava/util/Map;)Lcom/just/agentweb/՗;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/just/agentweb/\u0557;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/just/agentweb/ގ;->̎()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object p1, Lcom/just/agentweb/ޘ;->̅:Ljava/lang/String;

    const-string v0, "3A180841070F0D00111A15094101030D00111A5004124E0F0811521D110B044241000C040B5018114E08090F170D04040E00"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/just/agentweb/ގ;->̿(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/just/agentweb/ޘ;->̐(Ljava/lang/String;Ljava/lang/Object;)Lcom/just/agentweb/՗;

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/just/agentweb/՘;

    const-string v0, "3A1804124E0E050F170D044D090F12470B1D1A500207080415451F0B04050E0A410D04040F030E13071113450601500E00020D47490202150C120B41040D170D1B4D000A052D04040F030E130711132C1C1A151F070F02024513001E02150F150E0A1C4E070C124E030245130A140805"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/just/agentweb/՘;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    return-object p0
.end method
