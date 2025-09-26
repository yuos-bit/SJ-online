.class Lcom/good321/sjh5/݋;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/good321/sjh5/adapter/̳;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/܎;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final ̅:Lcom/good321/sjh5/܎;

.field final ̍:Lcom/good321/sjh5/adapter/GameButtonsAdapter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x14

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>(Lcom/good321/sjh5/܎;Lcom/good321/sjh5/adapter/GameButtonsAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/good321/sjh5/݋;->̅:Lcom/good321/sjh5/܎;

    iput-object p2, p0, Lcom/good321/sjh5/݋;->̍:Lcom/good321/sjh5/adapter/GameButtonsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native ̍(Landroid/view/View;I)V
.end method

.method public native ̎(Landroid/view/View;I)V
.end method
