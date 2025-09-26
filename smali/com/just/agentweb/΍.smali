.class public final enum Lcom/just/agentweb/΍;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/DefaultWebClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/just/agentweb/\u038d;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ̅:[Lcom/just/agentweb/΍;

.field public static final enum ̍:Lcom/just/agentweb/΍;

.field public static final enum ̎:Lcom/just/agentweb/΍;

.field public static final enum ̐:Lcom/just/agentweb/΍;


# instance fields
.field ̒:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/just/agentweb/΍;

    const-string v1, "2A353F242D35"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x3e9

    invoke-direct {v0, v1, v2, v3}, Lcom/just/agentweb/΍;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/just/agentweb/΍;->̎:Lcom/just/agentweb/΍;

    new-instance v1, Lcom/just/agentweb/΍;

    const-string v3, "2F2326"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    const/16 v5, 0xfa

    invoke-direct {v1, v3, v4, v5}, Lcom/just/agentweb/΍;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/just/agentweb/΍;->̍:Lcom/just/agentweb/΍;

    new-instance v3, Lcom/just/agentweb/΍;

    const-string v5, "2A393E20222D2832"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    const/16 v7, 0x3e

    invoke-direct {v3, v5, v6, v7}, Lcom/just/agentweb/΍;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/just/agentweb/΍;->̐:Lcom/just/agentweb/΍;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/just/agentweb/΍;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/just/agentweb/΍;->̅:[Lcom/just/agentweb/΍;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/just/agentweb/΍;->̒:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/just/agentweb/΍;
    .locals 1

    const-class v0, Lcom/just/agentweb/΍;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/just/agentweb/΍;

    return-object p0
.end method

.method public static values()[Lcom/just/agentweb/΍;
    .locals 1

    sget-object v0, Lcom/just/agentweb/΍;->̅:[Lcom/just/agentweb/΍;

    invoke-virtual {v0}, [Lcom/just/agentweb/΍;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/just/agentweb/΍;

    return-object v0
.end method
