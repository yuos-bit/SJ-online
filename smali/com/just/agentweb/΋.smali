.class public Lcom/just/agentweb/΋;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/DefaultWebClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field private ̅:Landroid/app/Activity;

.field private ̍:Landroid/webkit/WebViewClient;

.field private ̎:Z

.field private ̐:Lcom/just/agentweb/֋;

.field private ̒:I

.field private ̓:Z

.field private ̔:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/just/agentweb/΋;->̎:Z

    return-void
.end method

.method static synthetic ̍(Lcom/just/agentweb/΋;)Landroid/webkit/WebViewClient;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/΋;->̍:Landroid/webkit/WebViewClient;

    return-object p0
.end method

.method static synthetic ̎(Lcom/just/agentweb/΋;)Landroid/webkit/WebView;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/΋;->̔:Landroid/webkit/WebView;

    return-object p0
.end method

.method static synthetic ̐(Lcom/just/agentweb/΋;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/΋;->̅:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic ̒(Lcom/just/agentweb/΋;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/just/agentweb/΋;->̓:Z

    return p0
.end method

.method static synthetic ̓(Lcom/just/agentweb/΋;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/just/agentweb/΋;->̎:Z

    return p0
.end method

.method static synthetic ̔(Lcom/just/agentweb/΋;)I
    .locals 0

    iget p0, p0, Lcom/just/agentweb/΋;->̒:I

    return p0
.end method


# virtual methods
.method public ̕()Lcom/just/agentweb/DefaultWebClient;
    .locals 1

    new-instance v0, Lcom/just/agentweb/DefaultWebClient;

    invoke-direct {v0, p0}, Lcom/just/agentweb/DefaultWebClient;-><init>(Lcom/just/agentweb/΋;)V

    return-object v0
.end method

.method public ̖(Landroid/app/Activity;)Lcom/just/agentweb/΋;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΋;->̅:Landroid/app/Activity;

    return-object p0
.end method

.method public ̗(Landroid/webkit/WebViewClient;)Lcom/just/agentweb/΋;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΋;->̍:Landroid/webkit/WebViewClient;

    return-object p0
.end method

.method public ̘(Z)Lcom/just/agentweb/΋;
    .locals 0

    iput-boolean p1, p0, Lcom/just/agentweb/΋;->̎:Z

    return-object p0
.end method

.method public ̙(Lcom/just/agentweb/֋;)Lcom/just/agentweb/΋;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΋;->̐:Lcom/just/agentweb/֋;

    return-object p0
.end method

.method public ̚(I)Lcom/just/agentweb/΋;
    .locals 0

    iput p1, p0, Lcom/just/agentweb/΋;->̒:I

    return-object p0
.end method

.method public ̜(Z)Lcom/just/agentweb/΋;
    .locals 0

    iput-boolean p1, p0, Lcom/just/agentweb/΋;->̓:Z

    return-object p0
.end method

.method public ̝(Landroid/webkit/WebView;)Lcom/just/agentweb/΋;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΋;->̔:Landroid/webkit/WebView;

    return-object p0
.end method
