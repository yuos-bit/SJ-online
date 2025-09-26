.class public final Lcom/just/agentweb/AgentWeb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/just/agentweb/ނ;,
        Lcom/just/agentweb/͂;,
        Lcom/just/agentweb/̓;,
        Lcom/just/agentweb/̿;,
        Lcom/just/agentweb/͆;,
        Lcom/just/agentweb/ͅ;
    }
.end annotation


# static fields
.field private static final ̅:I = 0x0

.field private static final ̍:I = 0x1

.field private static final ̎:Ljava/lang/String; = "AgentWeb"


# instance fields
.field private ̐:Landroid/app/Activity;

.field private ̒:Lcom/just/agentweb/AgentWeb;

.field private ̓:Lcom/just/agentweb/͋;

.field private ̔:Lcom/just/agentweb/҅;

.field private ̕:Z

.field private ̖:Lcom/just/agentweb/΢;

.field private ̗:Lcom/just/agentweb/҆;

.field private ̘:Lcom/just/agentweb/Ԩ;

.field private ̙:Lcom/just/agentweb/ԩ;

.field private ̚:Lcom/just/agentweb/Ԭ;

.field private ̜:Z

.field private ̝:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private ̞:Lcom/just/agentweb/͓;

.field private ̟:Lcom/just/agentweb/՗;

.field private ̠:Lcom/just/agentweb/MiddlewareWebClientBase;

.field private ̡:Lcom/just/agentweb/ކ;

.field private ̢:Lcom/just/agentweb/֋;

.field private ̩:Lcom/just/agentweb/͆;

.field private ̪:I

.field private ̫:Landroid/webkit/WebChromeClient;

.field private ̬:I

.field private ̯:Landroid/view/ViewGroup;

.field private ̲:Lcom/just/agentweb/ޙ;

.field private ̳:Z

.field private ̴:Lcom/just/agentweb/ސ;

.field private ̵:Lcom/just/agentweb/׿;

.field private ̶:Lcom/just/agentweb/؄;

.field private ̷:Lcom/just/agentweb/؝;

.field private ̹:Lcom/just/agentweb/ؠ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/just/agentweb/\u0620<",
            "Lcom/just/agentweb/\u061d;",
            ">;"
        }
    .end annotation
.end field

.field private ̻:Lcom/just/agentweb/WebViewClient;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/just/agentweb/̿;)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̒:Lcom/just/agentweb/AgentWeb;

    new-instance v1, Landroidx/collection/ArrayMap;

    invoke-direct {v1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    iput v1, p0, Lcom/just/agentweb/AgentWeb;->̪:I

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̹:Lcom/just/agentweb/ؠ;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̷:Lcom/just/agentweb/؝;

    sget-object v1, Lcom/just/agentweb/͆;->̍:Lcom/just/agentweb/͆;

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̩:Lcom/just/agentweb/͆;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̓:Lcom/just/agentweb/͋;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̞:Lcom/just/agentweb/͓;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̘:Lcom/just/agentweb/Ԩ;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̙:Lcom/just/agentweb/ԩ;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/just/agentweb/AgentWeb;->̳:Z

    iput-boolean v1, p0, Lcom/just/agentweb/AgentWeb;->̜:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/just/agentweb/AgentWeb;->̬:I

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̟:Lcom/just/agentweb/՗;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̎(Lcom/just/agentweb/̿;)I

    move-result v1

    iput v1, p0, Lcom/just/agentweb/AgentWeb;->̪:I

    invoke-static {p1}, Lcom/just/agentweb/̿;->̐(Lcom/just/agentweb/̿;)Landroid/app/Activity;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̩(Lcom/just/agentweb/̿;)Landroid/view/ViewGroup;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̯:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/just/agentweb/̿;->͆(Lcom/just/agentweb/̿;)Lcom/just/agentweb/҆;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    invoke-static {p1}, Lcom/just/agentweb/̿;->͒(Lcom/just/agentweb/̿;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/just/agentweb/AgentWeb;->̕:Z

    invoke-static {p1}, Lcom/just/agentweb/̿;->͕(Lcom/just/agentweb/̿;)Lcom/just/agentweb/ސ;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/just/agentweb/̿;->͖(Lcom/just/agentweb/̿;)Lcom/just/agentweb/BaseIndicatorView;

    move-result-object v3

    invoke-static {p1}, Lcom/just/agentweb/̿;->͘(Lcom/just/agentweb/̿;)I

    move-result v4

    invoke-static {p1}, Lcom/just/agentweb/̿;->͙(Lcom/just/agentweb/̿;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-static {p1}, Lcom/just/agentweb/̿;->͚(Lcom/just/agentweb/̿;)I

    move-result v6

    invoke-static {p1}, Lcom/just/agentweb/̿;->̒(Lcom/just/agentweb/̿;)I

    move-result v7

    invoke-static {p1}, Lcom/just/agentweb/̿;->̔(Lcom/just/agentweb/̿;)Landroid/webkit/WebView;

    move-result-object v8

    invoke-static {p1}, Lcom/just/agentweb/̿;->̖(Lcom/just/agentweb/̿;)Lcom/just/agentweb/ԫ;

    move-result-object v9

    move-object v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/just/agentweb/AgentWeb;->̓(Lcom/just/agentweb/BaseIndicatorView;ILandroid/view/ViewGroup$LayoutParams;IILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)Lcom/just/agentweb/ސ;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/just/agentweb/̿;->͕(Lcom/just/agentweb/̿;)Lcom/just/agentweb/ސ;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̘(Lcom/just/agentweb/̿;)Lcom/just/agentweb/Ԭ;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̚:Lcom/just/agentweb/Ԭ;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̙(Lcom/just/agentweb/̿;)Lcom/just/agentweb/ޙ;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̲:Lcom/just/agentweb/ޙ;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̜(Lcom/just/agentweb/̿;)Lcom/just/agentweb/WebViewClient;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̻:Lcom/just/agentweb/WebViewClient;

    iput-object p0, p0, Lcom/just/agentweb/AgentWeb;->̒:Lcom/just/agentweb/AgentWeb;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̞(Lcom/just/agentweb/̿;)Lcom/just/agentweb/҅;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̔:Lcom/just/agentweb/҅;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̠(Lcom/just/agentweb/̿;)Landroidx/collection/ArrayMap;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/just/agentweb/̿;->̠(Lcom/just/agentweb/̿;)Landroidx/collection/ArrayMap;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/collection/ArrayMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̠(Lcom/just/agentweb/̿;)Landroidx/collection/ArrayMap;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/collection/ArrayMap;->putAll(Ljava/util/Map;)V

    sget-object v1, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "033A0C170F2E050F170D044D12071B025F"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    invoke-virtual {v3}, Landroidx/collection/ArrayMap;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-static {p1}, Lcom/just/agentweb/̿;->̡(Lcom/just/agentweb/̿;)Lcom/just/agentweb/֋;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    new-instance v1, Lcom/just/agentweb/ނ;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̡(Lcom/just/agentweb/̿;)Lcom/just/agentweb/֋;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/just/agentweb/ނ;-><init>(Lcom/just/agentweb/֋;Lcom/just/agentweb/̾;)V

    move-object v0, v1

    :goto_1
    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̢:Lcom/just/agentweb/֋;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̪(Lcom/just/agentweb/̿;)Lcom/just/agentweb/͆;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̩:Lcom/just/agentweb/͆;

    new-instance v0, Lcom/just/agentweb/׮;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->͏()Lcom/just/agentweb/ސ;

    move-result-object v1

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-static {p1}, Lcom/just/agentweb/̿;->̬(Lcom/just/agentweb/̿;)Lcom/just/agentweb/҄;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/just/agentweb/׮;-><init>(Landroid/webkit/WebView;Lcom/just/agentweb/҄;)V

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̘:Lcom/just/agentweb/Ԩ;

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->͐()Landroid/widget/FrameLayout;

    move-result-object v0

    instance-of v0, v0, Lcom/just/agentweb/WebParentLayout;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->͐()Landroid/widget/FrameLayout;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/WebParentLayout;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̯(Lcom/just/agentweb/̿;)Lcom/just/agentweb/̷;

    move-result-object v1

    if-nez v1, :cond_3

    invoke-static {}, Lcom/just/agentweb/ބ;->̍()Lcom/just/agentweb/̷;

    move-result-object v1

    goto :goto_2

    :cond_3
    invoke-static {p1}, Lcom/just/agentweb/̿;->̯(Lcom/just/agentweb/̿;)Lcom/just/agentweb/̷;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Lcom/just/agentweb/WebParentLayout;->bindController(Lcom/just/agentweb/̷;)V

    invoke-static {p1}, Lcom/just/agentweb/̿;->̳(Lcom/just/agentweb/̿;)I

    move-result v1

    invoke-static {p1}, Lcom/just/agentweb/̿;->̵(Lcom/just/agentweb/̿;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/just/agentweb/WebParentLayout;->setErrorLayoutRes(II)V

    invoke-static {p1}, Lcom/just/agentweb/̿;->̷(Lcom/just/agentweb/̿;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/just/agentweb/WebParentLayout;->setErrorView(Landroid/view/View;)V

    :cond_4
    new-instance v0, Lcom/just/agentweb/ދ;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/just/agentweb/ދ;-><init>(Landroid/webkit/WebView;)V

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̵:Lcom/just/agentweb/׿;

    new-instance v0, Lcom/just/agentweb/ޑ;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̒:Lcom/just/agentweb/AgentWeb;

    iget-object v2, v2, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    iget-object v3, p0, Lcom/just/agentweb/AgentWeb;->̩:Lcom/just/agentweb/͆;

    invoke-direct {v0, v1, v2, v3}, Lcom/just/agentweb/ޑ;-><init>(Landroid/webkit/WebView;Landroidx/collection/ArrayMap;Lcom/just/agentweb/͆;)V

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̹:Lcom/just/agentweb/ؠ;

    invoke-static {p1}, Lcom/just/agentweb/̿;->̻(Lcom/just/agentweb/̿;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/just/agentweb/AgentWeb;->̳:Z

    invoke-static {p1}, Lcom/just/agentweb/̿;->̽(Lcom/just/agentweb/̿;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/just/agentweb/AgentWeb;->̜:Z

    invoke-static {p1}, Lcom/just/agentweb/̿;->̿(Lcom/just/agentweb/̿;)Lcom/just/agentweb/΍;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-static {p1}, Lcom/just/agentweb/̿;->̿(Lcom/just/agentweb/̿;)Lcom/just/agentweb/΍;

    move-result-object v0

    iget v0, v0, Lcom/just/agentweb/΍;->̒:I

    iput v0, p0, Lcom/just/agentweb/AgentWeb;->̬:I

    :cond_5
    invoke-static {p1}, Lcom/just/agentweb/̿;->̓(Lcom/just/agentweb/̿;)Lcom/just/agentweb/MiddlewareWebClientBase;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̠:Lcom/just/agentweb/MiddlewareWebClientBase;

    invoke-static {p1}, Lcom/just/agentweb/̿;->͇(Lcom/just/agentweb/̿;)Lcom/just/agentweb/ކ;

    move-result-object p1

    iput-object p1, p0, Lcom/just/agentweb/AgentWeb;->̡:Lcom/just/agentweb/ކ;

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̜()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/just/agentweb/̿;Lcom/just/agentweb/̾;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/AgentWeb;-><init>(Lcom/just/agentweb/̿;)V

    return-void
.end method

.method static synthetic ̐(Lcom/just/agentweb/AgentWeb;)Lcom/just/agentweb/AgentWeb;
    .locals 0

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̝()Lcom/just/agentweb/AgentWeb;

    move-result-object p0

    return-object p0
.end method

.method static synthetic ̒(Lcom/just/agentweb/AgentWeb;Ljava/lang/String;)Lcom/just/agentweb/AgentWeb;
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/AgentWeb;->̚(Ljava/lang/String;)Lcom/just/agentweb/AgentWeb;

    move-result-object p0

    return-object p0
.end method

.method private ̓(Lcom/just/agentweb/BaseIndicatorView;ILandroid/view/ViewGroup$LayoutParams;IILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)Lcom/just/agentweb/ސ;
    .locals 12

    move-object v0, p0

    if-eqz p1, :cond_0

    iget-boolean v1, v0, Lcom/just/agentweb/AgentWeb;->̕:Z

    if-eqz v1, :cond_0

    new-instance v9, Lcom/just/agentweb/ޗ;

    iget-object v2, v0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    iget-object v3, v0, Lcom/just/agentweb/AgentWeb;->̯:Landroid/view/ViewGroup;

    move-object v1, v9

    move-object v4, p3

    move v5, p2

    move-object v6, p1

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/just/agentweb/ޗ;-><init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;ILcom/just/agentweb/BaseIndicatorView;Landroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V

    return-object v9

    :cond_0
    iget-boolean v1, v0, Lcom/just/agentweb/AgentWeb;->̕:Z

    if-eqz v1, :cond_1

    new-instance v1, Lcom/just/agentweb/ޗ;

    iget-object v3, v0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    iget-object v4, v0, Lcom/just/agentweb/AgentWeb;->̯:Landroid/view/ViewGroup;

    move-object v2, v1

    move-object v5, p3

    move v6, p2

    move/from16 v7, p4

    move/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    invoke-direct/range {v2 .. v10}, Lcom/just/agentweb/ޗ;-><init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;IIILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/just/agentweb/ޗ;

    iget-object v6, v0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    iget-object v7, v0, Lcom/just/agentweb/AgentWeb;->̯:Landroid/view/ViewGroup;

    move-object v5, v1

    move-object v8, p3

    move v9, p2

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v5 .. v11}, Lcom/just/agentweb/ޗ;-><init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;ILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V

    :goto_0
    return-object v1
.end method

.method private ̔()V
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    new-instance v1, Lcom/just/agentweb/͋;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-direct {v1, p0, v2}, Lcom/just/agentweb/͋;-><init>(Lcom/just/agentweb/AgentWeb;Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̓:Lcom/just/agentweb/͋;

    const-string v2, "0F17080F1A360207"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private ̕()V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̷:Lcom/just/agentweb/؝;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->͒()I

    move-result v0

    invoke-static {v0}, Lcom/just/agentweb/ޒ;->̍(I)Lcom/just/agentweb/ޒ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̷:Lcom/just/agentweb/؝;

    :cond_0
    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̹:Lcom/just/agentweb/ؠ;

    invoke-interface {v1, v0}, Lcom/just/agentweb/ؠ;->͎(Ljava/lang/Object;)V

    return-void
.end method

.method private ̖()Landroid/webkit/WebChromeClient;
    .locals 8

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̚:Lcom/just/agentweb/Ԭ;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/just/agentweb/ލ;->̍()Lcom/just/agentweb/ލ;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/Ԫ;->̴()Lcom/just/agentweb/͑;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/just/agentweb/ލ;->̐(Lcom/just/agentweb/͑;)Lcom/just/agentweb/ލ;

    move-result-object v0

    :cond_0
    move-object v3, v0

    new-instance v0, Lcom/just/agentweb/ޅ;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    iput-object v3, p0, Lcom/just/agentweb/AgentWeb;->̚:Lcom/just/agentweb/Ԭ;

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̗()Lcom/just/agentweb/ԩ;

    move-result-object v5

    iput-object v5, p0, Lcom/just/agentweb/AgentWeb;->̙:Lcom/just/agentweb/ԩ;

    iget-object v6, p0, Lcom/just/agentweb/AgentWeb;->̢:Lcom/just/agentweb/֋;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v7

    const/4 v4, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/just/agentweb/ޅ;-><init>(Landroid/app/Activity;Lcom/just/agentweb/Ԭ;Landroid/webkit/WebChromeClient;Lcom/just/agentweb/ԩ;Lcom/just/agentweb/֋;Landroid/webkit/WebView;)V

    sget-object v1, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "39150F2206130808172D1C040400155D"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/just/agentweb/AgentWeb;->̲:Lcom/just/agentweb/ޙ;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̡:Lcom/just/agentweb/ކ;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̲:Lcom/just/agentweb/ޙ;

    if-eqz v2, :cond_1

    invoke-virtual {v2, v1}, Lcom/just/agentweb/ކ;->̎(Lcom/just/agentweb/ކ;)Lcom/just/agentweb/ކ;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̲:Lcom/just/agentweb/ޙ;

    :cond_1
    if-eqz v1, :cond_3

    const/4 v2, 0x1

    move-object v3, v1

    :goto_0
    invoke-virtual {v3}, Lcom/just/agentweb/ކ;->̒()Lcom/just/agentweb/ކ;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Lcom/just/agentweb/ކ;->̒()Lcom/just/agentweb/ކ;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    sget-object v4, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "2319090502041004000B2708032D0D0E001C1A320C120B410A0C160A1C08160F130245110105031554"

    invoke-static {v6}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lcom/just/agentweb/ކ;->̼(Landroid/webkit/WebChromeClient;)V

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̫:Landroid/webkit/WebChromeClient;

    return-object v1

    :cond_3
    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̫:Landroid/webkit/WebChromeClient;

    return-object v0
.end method

.method private ̗()Lcom/just/agentweb/ԩ;
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̙:Lcom/just/agentweb/ԩ;

    if-nez v0, :cond_0

    new-instance v0, Lcom/just/agentweb/ޏ;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v2}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/just/agentweb/ޏ;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V

    :cond_0
    return-object v0
.end method

.method private ̘()Lcom/just/agentweb/΢;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̖:Lcom/just/agentweb/΢;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̙:Lcom/just/agentweb/ԩ;

    instance-of v1, v0, Lcom/just/agentweb/ޏ;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/just/agentweb/΢;

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̖:Lcom/just/agentweb/΢;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private ̙()Landroid/webkit/WebViewClient;
    .locals 7

    sget-object v0, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "091519250B0D0202131A1557"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̠:Lcom/just/agentweb/MiddlewareWebClientBase;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/just/agentweb/DefaultWebClient;->createBuilder()Lcom/just/agentweb/΋;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̖(Landroid/app/Activity;)Lcom/just/agentweb/΋;

    move-result-object v0

    iget-boolean v1, p0, Lcom/just/agentweb/AgentWeb;->̳:Z

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̜(Z)Lcom/just/agentweb/΋;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̢:Lcom/just/agentweb/֋;

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̙(Lcom/just/agentweb/֋;)Lcom/just/agentweb/΋;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̝(Landroid/webkit/WebView;)Lcom/just/agentweb/΋;

    move-result-object v0

    iget-boolean v1, p0, Lcom/just/agentweb/AgentWeb;->̜:Z

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̘(Z)Lcom/just/agentweb/΋;

    move-result-object v0

    iget v1, p0, Lcom/just/agentweb/AgentWeb;->̬:I

    invoke-virtual {v0, v1}, Lcom/just/agentweb/΋;->̚(I)Lcom/just/agentweb/΋;

    move-result-object v0

    invoke-virtual {v0}, Lcom/just/agentweb/΋;->̕()Lcom/just/agentweb/DefaultWebClient;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̠:Lcom/just/agentweb/MiddlewareWebClientBase;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̻:Lcom/just/agentweb/WebViewClient;

    if-eqz v2, :cond_0

    invoke-virtual {v2, v1}, Lcom/just/agentweb/MiddlewareWebClientBase;->enq(Lcom/just/agentweb/MiddlewareWebClientBase;)Lcom/just/agentweb/MiddlewareWebClientBase;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̻:Lcom/just/agentweb/WebViewClient;

    :cond_0
    if-eqz v1, :cond_2

    const/4 v2, 0x1

    move-object v3, v1

    :goto_0
    invoke-virtual {v3}, Lcom/just/agentweb/MiddlewareWebClientBase;->next()Lcom/just/agentweb/MiddlewareWebClientBase;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Lcom/just/agentweb/MiddlewareWebClientBase;->next()Lcom/just/agentweb/MiddlewareWebClientBase;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object v4, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "2319090502041004000B2708032D0D0E001C1A320C120B410A0C160A1C08160F130245110105031554"

    invoke-static {v6}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lcom/just/agentweb/MiddlewareWebClientBase;->setDelegate(Landroid/webkit/WebViewClient;)V

    return-object v1

    :cond_2
    return-object v0
.end method

.method private ̚(Ljava/lang/String;)Lcom/just/agentweb/AgentWeb;
    .locals 1

    invoke-virtual {p0}, Lcom/just/agentweb/AgentWeb;->̴()Lcom/just/agentweb/Ԩ;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/just/agentweb/Ԩ;->̩(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/AgentWeb;->̬()Lcom/just/agentweb/Ԭ;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/just/agentweb/Ԭ;->̹()Lcom/just/agentweb/͑;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/AgentWeb;->̬()Lcom/just/agentweb/Ԭ;

    move-result-object p1

    invoke-interface {p1}, Lcom/just/agentweb/Ԭ;->̹()Lcom/just/agentweb/͑;

    move-result-object p1

    invoke-interface {p1}, Lcom/just/agentweb/͑;->̗()V

    :cond_0
    return-object p0
.end method

.method private ̜()V
    .locals 0

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̔()V

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̕()V

    return-void
.end method

.method private ̝()Lcom/just/agentweb/AgentWeb;
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/just/agentweb/͈;->̙(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̔:Lcom/just/agentweb/҅;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/just/agentweb/ށ;->̎()Lcom/just/agentweb/ށ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̔:Lcom/just/agentweb/҅;

    :cond_0
    instance-of v1, v0, Lcom/just/agentweb/ށ;

    if-eqz v1, :cond_1

    move-object v2, v0

    check-cast v2, Lcom/just/agentweb/ށ;

    invoke-virtual {v2, p0}, Lcom/just/agentweb/ށ;->̒(Lcom/just/agentweb/AgentWeb;)V

    :cond_1
    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̶:Lcom/just/agentweb/؄;

    if-nez v2, :cond_2

    if-eqz v1, :cond_2

    move-object v1, v0

    check-cast v1, Lcom/just/agentweb/؄;

    iput-object v1, p0, Lcom/just/agentweb/AgentWeb;->̶:Lcom/just/agentweb/؄;

    :cond_2
    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/just/agentweb/҅;->̝(Landroid/webkit/WebView;)Lcom/just/agentweb/҅;

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̟:Lcom/just/agentweb/՗;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̩:Lcom/just/agentweb/͆;

    invoke-static {v0, v1}, Lcom/just/agentweb/ޘ;->̒(Lcom/just/agentweb/ސ;Lcom/just/agentweb/͆;)Lcom/just/agentweb/ޘ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̟:Lcom/just/agentweb/՗;

    :cond_3
    sget-object v0, Lcom/just/agentweb/AgentWeb;->̎:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "033A0C170F2E050F170D041E5B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    invoke-virtual {v2}, Landroidx/collection/ArrayMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̟:Lcom/just/agentweb/՗;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̝:Landroidx/collection/ArrayMap;

    invoke-interface {v0, v1}, Lcom/just/agentweb/՗;->̾(Ljava/util/Map;)Lcom/just/agentweb/՗;

    :cond_4
    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̶:Lcom/just/agentweb/؄;

    if-eqz v0, :cond_5

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/just/agentweb/؄;->͉(Landroid/webkit/WebView;Landroid/webkit/DownloadListener;)Lcom/just/agentweb/؄;

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̶:Lcom/just/agentweb/؄;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̖()Landroid/webkit/WebChromeClient;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/just/agentweb/؄;->͊(Landroid/webkit/WebView;Landroid/webkit/WebChromeClient;)Lcom/just/agentweb/؄;

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̶:Lcom/just/agentweb/؄;

    iget-object v1, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̙()Landroid/webkit/WebViewClient;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/just/agentweb/؄;->͋(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)Lcom/just/agentweb/؄;

    :cond_5
    return-object p0
.end method

.method public static ̞(Landroid/app/Activity;)Lcom/just/agentweb/̿;
    .locals 1

    if-eqz p0, :cond_0

    new-instance v0, Lcom/just/agentweb/̿;

    invoke-direct {v0, p0}, Lcom/just/agentweb/̿;-><init>(Landroid/app/Activity;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "0F1319081808131C520D110341000E1345100B500314020D474B"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ̞(Landroidx/fragment/app/Fragment;)Lcom/just/agentweb/̿;
    .locals 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/just/agentweb/̿;

    invoke-direct {v1, v0, p0}, Lcom/just/agentweb/̿;-><init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)V

    return-object v1

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "0F1319081808131C520D110341000E1345100B500314020D474B"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public ̠()Z
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̘()Lcom/just/agentweb/΢;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ތ;->̍(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)Lcom/just/agentweb/ތ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    invoke-interface {v0}, Lcom/just/agentweb/҆;->̞()Z

    move-result v0

    return v0
.end method

.method public ̡()Lcom/just/agentweb/AgentWeb;
    .locals 2

    invoke-virtual {p0}, Lcom/just/agentweb/AgentWeb;->̵()Lcom/just/agentweb/ސ;

    move-result-object v0

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/just/agentweb/AgentWeb;->̵()Lcom/just/agentweb/ސ;

    move-result-object v1

    invoke-interface {v1}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/͎;->̗(Landroid/content/Context;Landroid/webkit/WebView;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    invoke-static {v0}, Lcom/just/agentweb/͎;->̗(Landroid/content/Context;)V

    :goto_0
    return-object p0
.end method

.method public ̢()V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̵:Lcom/just/agentweb/׿;

    invoke-interface {v0}, Lcom/just/agentweb/׿;->͆()V

    return-void
.end method

.method ̩()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̐:Landroid/app/Activity;

    return-object v0
.end method

.method public ̪()Lcom/just/agentweb/҅;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̔:Lcom/just/agentweb/҅;

    return-object v0
.end method

.method public ̫()Lcom/just/agentweb/҆;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̘()Lcom/just/agentweb/΢;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ތ;->̍(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)Lcom/just/agentweb/ތ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    :cond_0
    return-object v0
.end method

.method public ̬()Lcom/just/agentweb/Ԭ;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̚:Lcom/just/agentweb/Ԭ;

    return-object v0
.end method

.method public ̯()Lcom/just/agentweb/͓;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̞:Lcom/just/agentweb/͓;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    invoke-static {v0}, Lcom/just/agentweb/ԭ;->̍(Landroid/webkit/WebView;)Lcom/just/agentweb/ԭ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̞:Lcom/just/agentweb/͓;

    :cond_0
    return-object v0
.end method

.method public ̲()Lcom/just/agentweb/՗;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̟:Lcom/just/agentweb/՗;

    return-object v0
.end method

.method public ̳()Lcom/just/agentweb/֋;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̢:Lcom/just/agentweb/֋;

    return-object v0
.end method

.method public ̴()Lcom/just/agentweb/Ԩ;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̘:Lcom/just/agentweb/Ԩ;

    return-object v0
.end method

.method public ̵()Lcom/just/agentweb/ސ;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    return-object v0
.end method

.method public ̶()Lcom/just/agentweb/׿;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̵:Lcom/just/agentweb/׿;

    return-object v0
.end method

.method public ̷(ILandroid/view/KeyEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̴:Lcom/just/agentweb/ސ;

    invoke-interface {v0}, Lcom/just/agentweb/ސ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    invoke-direct {p0}, Lcom/just/agentweb/AgentWeb;->̘()Lcom/just/agentweb/΢;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ތ;->̍(Landroid/webkit/WebView;Lcom/just/agentweb/΢;)Lcom/just/agentweb/ތ;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentWeb;->̗:Lcom/just/agentweb/҆;

    invoke-interface {v0, p1, p2}, Lcom/just/agentweb/҆;->̟(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
