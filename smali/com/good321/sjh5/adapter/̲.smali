.class Lcom/good321/sjh5/adapter/̲;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/adapter/GameButtonsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/good321/sjh5/adapter/݌;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final ̅:Lcom/good321/sjh5/adapter/GameButtonsAdapter;

.field final ̍:Lcom/good321/sjh5/adapter/݌;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xa

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>(Lcom/good321/sjh5/adapter/GameButtonsAdapter;Lcom/good321/sjh5/adapter/݌;)V
    .locals 0

    iput-object p1, p0, Lcom/good321/sjh5/adapter/̲;->̅:Lcom/good321/sjh5/adapter/GameButtonsAdapter;

    iput-object p2, p0, Lcom/good321/sjh5/adapter/̲;->̍:Lcom/good321/sjh5/adapter/݌;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onClick(Landroid/view/View;)V
.end method
