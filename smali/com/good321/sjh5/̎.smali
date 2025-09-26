.class final Lcom/good321/sjh5/̎;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/GDSplashDialog;->̐(Landroid/app/Activity;Lcom/good321/sjh5/̓;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final ̅:Lcom/good321/sjh5/̓;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x12

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>(Lcom/good321/sjh5/̓;)V
    .locals 0

    iput-object p1, p0, Lcom/good321/sjh5/̎;->̅:Lcom/good321/sjh5/̓;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onShow(Landroid/content/DialogInterface;)V
.end method
