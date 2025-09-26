.class public final Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;
.super Landroidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/accessibility/AccessibilityViewCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 113
    invoke-direct {p0}, Landroidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments;-><init>()V

    return-void
.end method


# virtual methods
.method public getEnd()I
    .locals 2

    .line 126
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "2F333928212F38242029252024203538363722352E35272E293A37203432282035"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getStart()I
    .locals 2

    .line 119
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "2F333928212F38242029252024203538363722352E35272E293A213A313F3531282931"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
