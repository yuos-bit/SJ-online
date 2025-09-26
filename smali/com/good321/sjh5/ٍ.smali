.class public Lcom/good321/sjh5/ٍ;
.super Landroidx/fragment/app/Fragment;


# static fields
.field private static final ̅:Ljava/lang/String; = "GameFragment"


# instance fields
.field private ̍:Lcom/just/agentweb/ކ;

.field private ̎:Lcom/just/agentweb/MiddlewareWebClientBase;

.field protected ̐:Lcom/just/agentweb/֋;

.field protected ̒:Lcom/just/agentweb/WebViewClient;

.field protected ̓:Lcom/just/agentweb/AgentWeb;

.field private ̔:Landroidx/recyclerview/widget/RecyclerView;

.field private ̕:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/good321/sjh5/adapter/\u0334;",
            ">;"
        }
    .end annotation
.end field

.field private ̖:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lcom/good321/sjh5/ٟ;

    invoke-direct {v0, p0}, Lcom/good321/sjh5/ٟ;-><init>(Lcom/good321/sjh5/ٍ;)V

    iput-object v0, p0, Lcom/good321/sjh5/ٍ;->̐:Lcom/just/agentweb/֋;

    new-instance v0, Lcom/good321/sjh5/GameFragment$6;

    invoke-direct {v0, p0}, Lcom/good321/sjh5/GameFragment$6;-><init>(Lcom/good321/sjh5/ٍ;)V

    iput-object v0, p0, Lcom/good321/sjh5/ٍ;->̒:Lcom/just/agentweb/WebViewClient;

    return-void
.end method

.method private native ̍()Ljava/lang/String;
.end method

.method public static native ̎(Ljava/lang/String;)Ljava/lang/String;
.end method


# virtual methods
.method public native onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end method

.method public native onDestroyView()V
.end method

.method public native onHiddenChanged(Z)V
.end method

.method public native onPause()V
.end method

.method public native onResume()V
.end method

.method protected native ̐()Lcom/just/agentweb/ކ;
.end method

.method protected native ̒()Lcom/just/agentweb/MiddlewareWebClientBase;
.end method

.method public native ̓()Lcom/just/agentweb/҅;
.end method
