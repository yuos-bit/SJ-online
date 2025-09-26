.class public final enum Lcom/just/agentweb/͆;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/AgentWeb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/just/agentweb/\u0346;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ̅:[Lcom/just/agentweb/͆;

.field public static final enum ̍:Lcom/just/agentweb/͆;

.field public static final enum ̎:Lcom/just/agentweb/͆;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/just/agentweb/͆;

    const-string v1, "2A352B203B2D333A3126352E2A"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/just/agentweb/͆;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/just/agentweb/͆;->̍:Lcom/just/agentweb/͆;

    new-instance v1, Lcom/just/agentweb/͆;

    const-string v3, "3D243F282D3538263A2B3326"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/just/agentweb/͆;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/just/agentweb/͆;->̎:Lcom/just/agentweb/͆;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/just/agentweb/͆;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/just/agentweb/͆;->̅:[Lcom/just/agentweb/͆;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/just/agentweb/͆;
    .locals 1

    const-class v0, Lcom/just/agentweb/͆;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/just/agentweb/͆;

    return-object p0
.end method

.method public static values()[Lcom/just/agentweb/͆;
    .locals 1

    sget-object v0, Lcom/just/agentweb/͆;->̅:[Lcom/just/agentweb/͆;

    invoke-virtual {v0}, [Lcom/just/agentweb/͆;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/just/agentweb/͆;

    return-object v0
.end method
