.class public final Landroidx/core/view/accessibility/AccessibilityViewCommand$MoveAtGranularityArguments;
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

    .line 64
    invoke-direct {p0}, Landroidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments;-><init>()V

    return-void
.end method


# virtual methods
.method public getExtendSelection()Z
    .locals 2

    .line 88
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$MoveAtGranularityArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "2F333928212F38242029252024203538202A3A35232531322229372D24242E203E252A3D22352C2F"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getGranularity()I
    .locals 2

    .line 80
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$MoveAtGranularityArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "2F333928212F38242029252024203538283D3835202420353822202F3E382D2F332E312B31392335"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
