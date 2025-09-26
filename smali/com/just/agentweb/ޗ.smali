.class public Lcom/just/agentweb/ޗ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/ސ;


# static fields
.field private static final ̅:Ljava/lang/String; = "DefaultWebCreator"


# instance fields
.field private ̍:Landroid/app/Activity;

.field private ̎:Lcom/just/agentweb/͑;

.field private ̐:I

.field private ̒:Landroid/widget/FrameLayout;

.field private ̓:I

.field private ̔:Lcom/just/agentweb/ԫ;

.field private ̕:I

.field private ̖:Z

.field private ̗:Z

.field private ̘:Landroid/view/ViewGroup$LayoutParams;

.field private ̙:Lcom/just/agentweb/BaseIndicatorView;

.field private ̚:Landroid/view/View;

.field private ̜:Landroid/view/ViewGroup;

.field private ̝:Landroid/webkit/WebView;

.field private ̞:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;IIILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    iput v1, p0, Lcom/just/agentweb/ޗ;->̐:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/just/agentweb/ޗ;->̖:Z

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    const/4 v0, 0x1

    iput v0, p0, Lcom/just/agentweb/ޗ;->̞:I

    iput-object p1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    iput-object p2, p0, Lcom/just/agentweb/ޗ;->̜:Landroid/view/ViewGroup;

    iput-boolean v0, p0, Lcom/just/agentweb/ޗ;->̗:Z

    iput p4, p0, Lcom/just/agentweb/ޗ;->̕:I

    iput p5, p0, Lcom/just/agentweb/ޗ;->̐:I

    iput-object p3, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    iput p6, p0, Lcom/just/agentweb/ޗ;->̓:I

    iput-object p7, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object p8, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    return-void
.end method

.method protected constructor <init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;ILandroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    iput v1, p0, Lcom/just/agentweb/ޗ;->̐:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/just/agentweb/ޗ;->̖:Z

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    const/4 v0, 0x1

    iput v0, p0, Lcom/just/agentweb/ޗ;->̞:I

    iput-object p1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    iput-object p2, p0, Lcom/just/agentweb/ޗ;->̜:Landroid/view/ViewGroup;

    iput-boolean v1, p0, Lcom/just/agentweb/ޗ;->̗:Z

    iput p4, p0, Lcom/just/agentweb/ޗ;->̕:I

    iput-object p3, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    iput-object p5, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object p6, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    return-void
.end method

.method protected constructor <init>(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;ILcom/just/agentweb/BaseIndicatorView;Landroid/webkit/WebView;Lcom/just/agentweb/ԫ;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    iput v1, p0, Lcom/just/agentweb/ޗ;->̐:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/just/agentweb/ޗ;->̖:Z

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    const/4 v0, 0x1

    iput v0, p0, Lcom/just/agentweb/ޗ;->̞:I

    iput-object p1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    iput-object p2, p0, Lcom/just/agentweb/ޗ;->̜:Landroid/view/ViewGroup;

    iput-boolean v1, p0, Lcom/just/agentweb/ޗ;->̗:Z

    iput p4, p0, Lcom/just/agentweb/ޗ;->̕:I

    iput-object p3, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    iput-object p5, p0, Lcom/just/agentweb/ޗ;->̙:Lcom/just/agentweb/BaseIndicatorView;

    iput-object p6, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iput-object p7, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    return-void
.end method

.method private ̒()Landroid/view/ViewGroup;
    .locals 7

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    new-instance v1, Lcom/just/agentweb/WebParentLayout;

    invoke-direct {v1, v0}, Lcom/just/agentweb/WebParentLayout;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/just/agentweb/׊;->֎:I

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setId(I)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v3, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    if-nez v3, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̓()Landroid/webkit/WebView;

    move-result-object v3

    iput-object v3, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̔()Landroid/view/View;

    move-result-object v3

    :goto_0
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Lcom/just/agentweb/WebParentLayout;->bindWebView(Landroid/webkit/WebView;)V

    sget-object v3, Lcom/just/agentweb/ޗ;->̅:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "4E50040F1D15060B110B1F0B414E2000001C1A2708033808021248"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    instance-of v5, v5, Lcom/just/agentweb/AgentWebView;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    instance-of v3, v3, Lcom/just/agentweb/AgentWebView;

    if-eqz v3, :cond_1

    const/4 v3, 0x2

    iput v3, p0, Lcom/just/agentweb/ޗ;->̞:I

    :cond_1
    new-instance v3, Landroid/view/ViewStub;

    invoke-direct {v3, v0}, Landroid/view/ViewStub;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/just/agentweb/׊;->͒:I

    invoke-virtual {v3, v4}, Landroid/view/ViewStub;->setId(I)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v3, p0, Lcom/just/agentweb/ޗ;->̗:Z

    const/16 v4, 0x8

    if-eqz v3, :cond_4

    new-instance v3, Lcom/just/agentweb/WebIndicator;

    invoke-direct {v3, v0}, Lcom/just/agentweb/WebIndicator;-><init>(Landroid/content/Context;)V

    iget v5, p0, Lcom/just/agentweb/ޗ;->̓:I

    if-lez v5, :cond_2

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    iget v6, p0, Lcom/just/agentweb/ޗ;->̓:I

    int-to-float v6, v6

    invoke-static {v0, v6}, Lcom/just/agentweb/͎;->̟(Landroid/content/Context;F)I

    move-result v0

    const/4 v6, -0x2

    invoke-direct {v5, v6, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    goto :goto_1

    :cond_2
    invoke-virtual {v3}, Lcom/just/agentweb/WebIndicator;->͂()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v5

    :goto_1
    iget v0, p0, Lcom/just/agentweb/ޗ;->̐:I

    if-eq v0, v2, :cond_3

    invoke-virtual {v3, v0}, Lcom/just/agentweb/WebIndicator;->setColor(I)V

    :cond_3
    const/16 v0, 0x30

    iput v0, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput-object v3, p0, Lcom/just/agentweb/ޗ;->̎:Lcom/just/agentweb/͑;

    invoke-virtual {v1, v3, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_2

    :cond_4
    if-nez v3, :cond_5

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̙:Lcom/just/agentweb/BaseIndicatorView;

    if-eqz v0, :cond_5

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̎:Lcom/just/agentweb/͑;

    invoke-interface {v0}, Lcom/just/agentweb/ՠ;->͂()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̙:Lcom/just/agentweb/BaseIndicatorView;

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_5
    :goto_2
    return-object v1
.end method

.method private ̓()Landroid/webkit/WebView;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    :goto_0
    iput v1, p0, Lcom/just/agentweb/ޗ;->̞:I

    goto :goto_1

    :cond_0
    sget-boolean v0, Lcom/just/agentweb/͈;->̕:Z

    if-eqz v0, :cond_1

    new-instance v0, Lcom/just/agentweb/AgentWebView;

    iget-object v1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/just/agentweb/AgentWebView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/just/agentweb/LollipopFixedWebView;

    iget-object v1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/just/agentweb/LollipopFixedWebView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    goto :goto_0

    :goto_1
    return-object v0
.end method

.method private ̔()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    invoke-interface {v0}, Lcom/just/agentweb/ԫ;->̶()Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̓()Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    invoke-interface {v1}, Lcom/just/agentweb/ԫ;->̵()Landroid/view/ViewGroup;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    sget-object v1, Lcom/just/agentweb/ޗ;->̅:Ljava/lang/String;

    const-string v2, "0F140941190405131B0B07"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    iput v1, p0, Lcom/just/agentweb/ޗ;->̞:I

    :goto_0
    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̔:Lcom/just/agentweb/ԫ;

    invoke-interface {v0}, Lcom/just/agentweb/ԫ;->̵()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public ̗()Landroid/widget/FrameLayout;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public ̘()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̚:Landroid/view/View;

    return-object v0
.end method

.method public ̞(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ޗ;->̚:Landroid/view/View;

    return-void
.end method

.method public ̟(Landroid/webkit/WebView;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    return-void
.end method

.method public ̴()Lcom/just/agentweb/͑;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̎:Lcom/just/agentweb/͑;

    return-object v0
.end method

.method public ̶()Landroid/webkit/WebView;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̝:Landroid/webkit/WebView;

    return-object v0
.end method

.method public bridge synthetic ͏()Lcom/just/agentweb/ސ;
    .locals 1

    invoke-virtual {p0}, Lcom/just/agentweb/ޗ;->͏()Lcom/just/agentweb/ޗ;

    move-result-object v0

    return-object v0
.end method

.method public ͏()Lcom/just/agentweb/ޗ;
    .locals 4

    iget-boolean v0, p0, Lcom/just/agentweb/ޗ;->̖:Z

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/just/agentweb/ޗ;->̖:Z

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̜:Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̒()Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/just/agentweb/ޗ;->̍:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    iget v1, p0, Lcom/just/agentweb/ޗ;->̕:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̒()Landroid/view/ViewGroup;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/just/agentweb/ޗ;->̒()Landroid/view/ViewGroup;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    iget v2, p0, Lcom/just/agentweb/ޗ;->̕:I

    iget-object v3, p0, Lcom/just/agentweb/ޗ;->̘:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-object p0
.end method

.method public ͐()Landroid/widget/FrameLayout;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޗ;->̒:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public ͒()I
    .locals 1

    iget v0, p0, Lcom/just/agentweb/ޗ;->̞:I

    return v0
.end method
