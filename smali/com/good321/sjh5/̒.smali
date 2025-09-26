.class final Lcom/good321/sjh5/̒;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/GDSplashDialog;->̖()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onAnimationCancel(Landroid/animation/Animator;)V
.end method

.method public native onAnimationEnd(Landroid/animation/Animator;)V
.end method

.method public native onAnimationRepeat(Landroid/animation/Animator;)V
.end method

.method public native onAnimationStart(Landroid/animation/Animator;)V
.end method
