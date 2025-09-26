.class public Lcom/good321/sjh5/adapter/݌;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/good321/sjh5/adapter/GameButtonsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field ̅:Landroid/widget/Button;

.field final ̍:Lcom/good321/sjh5/adapter/GameButtonsAdapter;

.field ̎:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/good321/sjh5/adapter/GameButtonsAdapter;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/good321/sjh5/adapter/݌;->̍:Lcom/good321/sjh5/adapter/GameButtonsAdapter;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lcom/good321/sjh5/adapter/݌;->̎:Landroid/view/View;

    const v0, 0x7f080058

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/good321/sjh5/adapter/݌;->̅:Landroid/widget/Button;

    return-void
.end method
