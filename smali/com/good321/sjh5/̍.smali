.class final Lcom/good321/sjh5/̍;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/GDSplashDialog;->̐(Landroid/app/Activity;Lcom/good321/sjh5/̓;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final ̅:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xf

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/good321/sjh5/̍;->̅:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onSystemUiVisibilityChange(I)V
.end method
