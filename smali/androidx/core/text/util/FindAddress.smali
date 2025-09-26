.class Landroidx/core/text/util/FindAddress;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/text/util/FindAddress$ZipRange;
    }
.end annotation


# static fields
.field private static final HOUSE_COMPONENT:Ljava/lang/String; = "(?:one|[0-9]+([a-z](?=[^a-z]|$)|st|nd|rd|th)?)"

.field private static final HOUSE_END:Ljava/lang/String; = "(?=[,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

.field private static final HOUSE_POST_DELIM:Ljava/lang/String; = ",\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final HOUSE_PRE_DELIM:Ljava/lang/String; = ":,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final MAX_ADDRESS_LINES:I = 0x5

.field private static final MAX_ADDRESS_WORDS:I = 0xe

.field private static final MAX_LOCATION_NAME_DISTANCE:I = 0x5

.field private static final MIN_ADDRESS_WORDS:I = 0x4

.field private static final NL:Ljava/lang/String; = "\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final SP:Ljava/lang/String; = "\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000"

.field private static final WORD_DELIM:Ljava/lang/String; = ",*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final WORD_END:Ljava/lang/String; = "(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

.field private static final WS:Ljava/lang/String; = "\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final kMaxAddressNameWordLength:I = 0x19

.field private static final sHouseNumberRe:Ljava/util/regex/Pattern;

.field private static final sLocationNameRe:Ljava/util/regex/Pattern;

.field private static final sStateRe:Ljava/util/regex/Pattern;

.field private static final sStateZipCodeRanges:[Landroidx/core/text/util/FindAddress$ZipRange;

.field private static final sSuffixedNumberRe:Ljava/util/regex/Pattern;

.field private static final sWordRe:Ljava/util/regex/Pattern;

.field private static final sZipCodeRe:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    const/16 v0, 0x3b

    new-array v0, v0, [Landroidx/core/text/util/FindAddress$ZipRange;

    .line 72
    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x63

    const/4 v3, -0x1

    invoke-direct {v1, v2, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v4, 0x0

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v5, 0x23

    const/16 v6, 0x24

    invoke-direct {v1, v5, v6, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v5, 0x1

    aput-object v1, v0, v5

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v6, 0x47

    const/16 v7, 0x48

    invoke-direct {v1, v6, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v6, 0x2

    aput-object v1, v0, v6

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v7, 0x60

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v8, 0x3

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v9, 0x55

    const/16 v10, 0x56

    invoke-direct {v1, v9, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v9, 0x4

    aput-object v1, v0, v9

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v10, 0x5a

    invoke-direct {v1, v10, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v10, 0x5

    aput-object v1, v0, v10

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v11, 0x50

    const/16 v12, 0x51

    invoke-direct {v1, v11, v12, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v11, 0x6

    aput-object v1, v0, v11

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v11, v11, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v12, 0x7

    aput-object v1, v0, v12

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v12, 0x14

    invoke-direct {v1, v12, v12, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v13, 0x8

    aput-object v1, v0, v13

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v13, 0x13

    invoke-direct {v1, v13, v13, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0x9

    aput-object v1, v0, v14

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v15, 0x20

    const/16 v2, 0x22

    invoke-direct {v1, v15, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x1e

    const/16 v15, 0x1f

    invoke-direct {v1, v2, v15, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x32

    const/16 v15, 0x34

    invoke-direct {v1, v2, v15, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x53

    invoke-direct {v1, v2, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v15, 0x10

    aput-object v1, v0, v15

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v15, 0x3c

    const/16 v2, 0x3e

    invoke-direct {v1, v15, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x2e

    const/16 v15, 0x2f

    invoke-direct {v1, v2, v15, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x42

    const/16 v15, 0x43

    const/16 v10, 0x49

    invoke-direct {v1, v2, v15, v10, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v13

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x28

    const/16 v10, 0x2a

    invoke-direct {v1, v2, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v12

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x46

    const/16 v10, 0x47

    invoke-direct {v1, v2, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v5, v6, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x15

    invoke-direct {v1, v12, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v8, v9, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v5, 0x19

    aput-object v1, v0, v5

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v5, 0x30

    const/16 v10, 0x31

    invoke-direct {v1, v5, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v5, 0x1a

    aput-object v1, v0, v5

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v5, 0x37

    const/16 v10, 0x38

    invoke-direct {v1, v5, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v15, 0x1b

    aput-object v1, v0, v15

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v15, 0x3f

    const/16 v2, 0x41

    invoke-direct {v1, v15, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v15, 0x26

    const/16 v12, 0x27

    invoke-direct {v1, v15, v12, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v12, 0x1e

    aput-object v1, v0, v12

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v5, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v12, 0x1f

    aput-object v1, v0, v12

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v12, 0x1b

    const/16 v10, 0x1c

    invoke-direct {v1, v12, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v10, 0x20

    aput-object v1, v0, v10

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v10, 0x3a

    invoke-direct {v1, v10, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v12, 0x21

    aput-object v1, v0, v12

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v12, 0x44

    const/16 v10, 0x45

    invoke-direct {v1, v12, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v10, 0x22

    aput-object v1, v0, v10

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v8, v9, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x23

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/4 v8, 0x7

    const/16 v9, 0x8

    invoke-direct {v1, v8, v9, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x24

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0x57

    const/16 v9, 0x58

    const/16 v10, 0x56

    invoke-direct {v1, v8, v9, v10, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x25

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0x59

    invoke-direct {v1, v9, v8, v7, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v15

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0xa

    const/16 v10, 0xe

    invoke-direct {v1, v8, v10, v4, v11}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x27

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0x2b

    const/16 v10, 0x2d

    invoke-direct {v1, v8, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x28

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0x49

    const/16 v10, 0x4a

    invoke-direct {v1, v8, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x29

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0x61

    const/16 v10, 0x61

    invoke-direct {v1, v8, v10, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x2a

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v8, 0xf

    invoke-direct {v1, v8, v13, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v8, 0x2b

    aput-object v1, v0, v8

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v11, v11, v4, v14}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2c

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2d

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2e

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v2, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x39

    invoke-direct {v1, v2, v2, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x30

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x25

    invoke-direct {v1, v4, v15, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x31

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x4b

    const/16 v7, 0x4f

    const/16 v8, 0x57

    invoke-direct {v1, v4, v7, v8, v9}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x32

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x54

    const/16 v7, 0x54

    invoke-direct {v1, v4, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x33

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x16

    const/16 v7, 0x18

    const/16 v8, 0x14

    invoke-direct {v1, v4, v7, v8, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x34

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v11, v14, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x35

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/4 v4, 0x5

    invoke-direct {v1, v4, v4, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x36

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x62

    const/16 v7, 0x63

    invoke-direct {v1, v4, v7, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v5

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x35

    const/16 v5, 0x36

    invoke-direct {v1, v4, v5, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x38

    aput-object v1, v0, v4

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v4, 0x1a

    const/16 v5, 0x18

    invoke-direct {v1, v5, v4, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v2

    new-instance v1, Landroidx/core/text/util/FindAddress$ZipRange;

    const/16 v2, 0x52

    const/16 v4, 0x53

    invoke-direct {v1, v2, v4, v3, v3}, Landroidx/core/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x3a

    aput-object v1, v0, v2

    sput-object v0, Landroidx/core/text/util/FindAddress;->sStateZipCodeRanges:[Landroidx/core/text/util/FindAddress$ZipRange;

    const-string v0, "352E414B8CE1C56C52ACD08CFBEE83E7E590EEF18FE1EC83E7E690EEF48FE1EB83E7E390EEF78FE1E683E7EC90EEFA8FE1C183E6FA91EEF0676A626CA5E090EED88FE1C73C4C4D4D532B414B8CE1C56C52ACD08CFBEE83E7E590EEF18FE1EC83E7E690EEF48FE1EB83E7E390EEF78FE1E683E7EC90EEFA8FE1C183E6FA91EEF0676A626CA5E090EED88FE1C73C1B415B"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 153
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    const-string v0, "464F570E00041B3E424349304A463A0648083358525C353F064808330C4948121213191C0A0C1F0512150F4C4D4758525B4349585F1D0015113A5E4C5E3859462B0C4C143C4F5A4F352E0C4C143C1B415B1203191D00051B17161204054851484E4F5A514D364D4C466E45B0CE91F7E18CE1E787F2EF92EDE38CE1E487F2EA92EDE48CE1E187F2E992EDE98CE1EE87F2E492EDCE8CE0F886F2EE7A666D63A3E287F2C692EDC8331D434C"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    const-string v0, "464F57490F0A1B041E0F030600471D4F041E121101000C000A045B12580C131200150E1300030C12471D4F0401121100041C0804041C35794DA3CE80FDE590EEF08FE1EF83E7E790EEF38FE1EA83E7E090EEF68FE1E983E7ED90EEF98FE1E483E7CA90EFEF8EE1EE3C4C1613031F0C481249061F0E0F02041B010F064C0E46130C1D0D000B0C14010203080F481B4D11010C0E0E020E150416015911490D151B061D001E08021A08041006470C45050D1D030C011A0204021A3A6E45B0CE91F7E18CE1E787F2EF92EDE38CE1E487F2EA92EDE48CE1E187F2E992EDE98CE1EE87F2E492EDCE8CE0F886F2EE2D460E083A6E45B0CE91F7E18CE1E787F2EF92EDE38CE1E487F2EA92EDE48CE1E187F2E992EDE98CE1EE87F2E492EDCE8CE0F886F2EE2D4602010D1208100711441D46050219160B1C0C160F13024C0E4616011D080D08171B0A11441D46070A19140B1408130F150201296750AFC18FFBE787F2EE92EDE08CE1E587F2ED92EDE58CE1E287F2E892EDE68CE1EF87F2E792EDEB8CE1C887F3F193EDE1334A1411131A151E3A6741A5C593F4F08FE1EE83E7E490EEF28FE1ED83E7E190EEF58FE1E883E7E290EEF88FE1E783E7EF90EEDF8FE0F182E7E52F451F0B3A6741A5C593F4F08FE1EE83E7E490EEF28FE1ED83E7E190EEF58FE1E883E7E290EEF88FE1E783E7EF90EEDF8FE0F182E7E52F451D04021C0E0900010711441D46060619150B1F1F0607004E195A090511061B000A4C0E4618041D060010041B0759114907001B0C1D1911441D460803191B0A11050E471D4F0C1E1219010D070F080C01470C4508001D0E0B1607110300471D4F0E01121B0C0F1D00144C0E461B141D05040911070D1B144812490B040E021F18081D08060B13470C450C0F1D0A04011D110E091B120211061D59114903051B08131C09010000054E195A0315110C0F0809005B12580009120C0617010611010D356847A7D28FEAED83EEE185E5F38CF0EF83EEE285E5F68CF0E883EEE785E5F58CF0E583EEE885E5F88CF0C283EFFE84E5F2335B04120200090101470C450C071D0A0C1106190A0000481B4D1F000C0008000F02161D1A11441D460C08191F07031E0E1B130E4C0E461D1D1D000E15111A0B02033A6741A5C593F4F08FE1EE83E7E490EEF28FE1ED83E7E190EEF58FE1E883E7E290EEF88FE1E783E7EF90EEDF8FE0F182E7E52F451D0C1307000904296750AFC18FFBE787F2EE92EDE08CE1E587F2ED92EDE58CE1E287F2E892EDE68CE1EF87F2E792EDEB8CE1C887F3F193EDE1334A0E161E0F1E0912471D4F0801121D04121D0814161B1E00044812490A110E031F03150F0F064C0E461E0E1D000E15111A35794DA3CE80FDE590EEF08FE1EF83E7E790EEF38FE1EA83E7E090EEF68FE1E983E7ED90EEF98FE1E483E7CA90EFEF8EE1EE3C4C06131C1F010800004E195A0014110F0113130D296750AFC18FFBE787F2EE92EDE08CE1E587F2ED92EDE58CE1E287F2E892EDE68CE1EF87F2E792EDEB8CE1C887F3F193EDE1334A03041901040C48124909000E00150F130F120C045B12580309120F0212296750AFC18FFBE787F2EE92EDE08CE1E587F2ED92EDE58CE1E287F2E892EDE68CE1EF87F2E792EDEB8CE1C887F3F193EDE1334A0F041F1E0305081C044E195A001A110F0B163C6C52ACD08CFBEE83E7E590EEF18FE1EC83E7E690EEF48FE1EB83E7E390EEF78FE1E683E7EC90EEFA8FE1C183E6FA91EEF0304A040415161717591149000C1B0B17192B6441ACC186FFF28CF0ED83EEE085E5F08CF0EE83EEE585E5F78CF0EB83EEE685E5FA8CF0E483EEEB85E5DD8CF1F282EEE13A4E1F0B08040201481B4D1C180C0304180003045B12580318120F0212296750AFC18FFBE787F2EE92EDE08CE1E587F2ED92EDE58CE1E287F2E892EDE68CE1EF87F2E792EDEB8CE1C887F3F193EDE1334A1E0A000559114901091B0A1A071F441D460E0C191D051C0C09010C064C0E461F1F1D011302021D005911491E001B1517001E1E180217060B1B0F5911491E131B15070B02190E356847A7D28FEAED83EEE185E5F38CF0EF83EEE285E5F68CF0E883EEE785E5F58CF0E583EEE885E5F88CF0C283EFFE84E5F2335B1F080D0E4E195A1E0711110F0D06105B12581F0812130F0A160B2B6441ACC186FFF28CF0ED83EEE085E5F08CF0EE83EEE585E5F78CF0EB83EEE685E5FA8CF0E483EEEB85E5DD8CF1F282EEE13A4E1B1D1C0C0F0A481B4D010D0C1E0E1B150F3E7B4EB2CD80F4E185E5F28CF0EC83EEE385E5F18CF0E983EEE485E5F48CF0EA83EEE985E5FB8CF0E783EECE85E4ED8DF0ED3C450206171D02190300471D4F1616120302141A093C6C52ACD08CFBEE83E7E590EEF18FE1EC83E7E690EEF48FE1EB83E7E390EEF78FE1E683E7EC90EEFA8FE1C183E6FA91EEF0304A0A000C0A060F5911491A0F1B1117001E08121D04024C0E4604151D1A041F0401470C45141A1D1211130659114918001B131B1C17040F07004E195A181911170713000C1C35794DA3CE80FDE590EEF08FE1EF83E7E790EEF38FE1EA83E7E090EEF68FE1E983E7ED90EEF98FE1E483E7CA90EFEF8EE1EE3C4C0C01021103051D481B4D041A0C1B041C0C080B06470C45160F1D100401061903061A0E094C0E4607041D190814061D0003040F471D4F1204120708121A3A6E45B0CE91F7E18CE1E787F2EF92EDE38CE1E487F2EA92EDE48CE1E187F2E992EDE98CE1EE87F2E492EDCE8CE0F886F2EE2D46170713000C1C0711441D46161E1905171F000800064E4C5A514D364D4483E7C77B4EB2CD80F4E185E5F28CF0EC83EEE385E5F18CF0E983EEE485E5F48CF0EA83EEE985E5FB8CF0E783EECE85E4ED8DF0ED6B656D6AA7F78CF0C583EEC83A195647"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 175
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sStateRe:Ljava/util/regex/Pattern;

    const-string v0, "464F5700020D021C0E0F1E0304161D0617110F14081D0F17023E5C334F1100180409101712110100030403040E0C11140E1B1D0500130D1811030B0F03191002050B071D5E1B071D1A04020C120308101E0B060C130A1D0517130013051D0C130E01150B0C0F13010E0C164D12121813091258191017000C121D1D05171D0F141A00171D04041F071E021D0D000A150E0D110318010F1B06131E1511020F141400050F0911020B0F1300001D4F110207130409171D4F11020208010301510C0E0D1B031B061D031D020F120208171C0B021E5E12020810001D1511020114151101510C0E0E1804145A0E0D020804051D0417171D13080F1A1D0417171D0411021C0E14161B001711021C0E1416000111091D0D14151317121304130D140B0A0E0A110104120506080E0A191B080A041B010007060812511D0216060F040812511D021D021C151E1219001E19171604080F1D08080B01510C0B00020D145A0E08151F13171D010C1702141E5E12070B04061D4F1107011303164D121602130B1213191401020A041D5E1B031D1C1B1E5E120708170612161F040B16061C0E09111F050B0F145A0E0911190419001E191502150312511D0017170B1E1E5E1206150A040B03521D060015071D1C03521D060011001C12180808090913160E06190A0919001E191A071C0112511D0F0A1E021F1A1D070F0B000612191E0D0F0F03164D12191E0D0B1D0D101C0D04040E00125819190B091E5E120A090A1E0203521D02000C0001510C010000051B09130014040F091D0B041C0B0C0108090913164D121C0200081D0B0A110503521D020E030217121C020E1E1D0A041E020C0000000E15164D121D08000A0E10164D121D08161D1D0A0C1E0203521D030814161B011E110C01150817050F09110C011409110E031F180F1A000E0B01510C03040D0A1B0A000D180C130A1D081313020C02170B131704011D0C1D001C0A145A0E1E111F0A19001E164D12000C121D1D1704011D110A04121106111A1200040A0B1D170C1C0B03521D1E0D060C1C1D4F111102001D040E1E1F040F1A1258190201021912511D171713070204041211150C040F140C1D1C00030C13020C1F0003111B17130013051D1C00170C161D4F11130A3A49384D120208121A1D150C1609151E5E12130E13171C0C1F0E0F05145A0E1C1F18150B1D150A05120218041213120B0E1D1802000212581901061F1F041D5E1B161917070C18121217171B00171E5E12121710001D4F11121F140617171D4F11121A00130C1D000C1E151C0011001C1B1511121A1302041F1203193A403C5819011A0208041A125819011B1D00081A1D1415170B141A00171D1300001C110E0412150F171D1B1705160F181B11000F13081D1A1306061912041F0008070E06050F0911151C000E090E1A05030F0B0D1B11071C1E1D0805041B101C0A151F110F121419070019020F1D5E1B1313021C08181D5E1B131B0F1418021A1D110C171903521D18080B091309151E5E12170E091E0B0C1B081D150619050F1C0612511D10041E020C1A0017125819050B1C0112511D1F0C1C090C15130A484F5A4F355C4783EEC36E45B0CE91F7E18CE1E787F2EF92EDE38CE1E487F2EA92EDE48CE1E187F2E992EDE98CE1EE87F2E492EDCE8CE0F886F2EE7A666D63A3E287F2C692EDC8331D434C"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 238
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sLocationNameRe:Ljava/util/regex/Pattern;

    const-string v0, "462B5D4C573C4C4C5A1D04110F0A1D15010E1A1844"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 265
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sSuffixedNumberRe:Ljava/util/regex/Pattern;

    const-string v0, "464F573A5E4C5E38095B0D455E544C3C555F572D16551348584C5A514D364D4483E7C77B4EB2CD80F4E185E5F28CF0EC83EEE385E5F18CF0E983EEE485E5F48CF0EA83EEE985E5FB8CF0E783EECE85E4ED8DF0ED6B656D6AA7F78CF0C583EEC83A195647"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 268
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 517
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attemptMatch(Ljava/lang/String;Ljava/util/regex/MatchResult;)I
    .locals 13

    .line 403
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    .line 410
    sget-object v0, Landroidx/core/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, ""

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/4 v10, -0x1

    .line 412
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    if-ge p1, v11, :cond_e

    .line 413
    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v11

    if-nez v11, :cond_0

    .line 415
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    :goto_1
    neg-int p0, p0

    return p0

    .line 417
    :cond_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v11

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v12

    sub-int/2addr v11, v12

    const/16 v12, 0x19

    if-le v11, v12, :cond_1

    .line 419
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    goto :goto_1

    .line 423
    :cond_1
    :goto_2
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v11

    if-ge p1, v11, :cond_3

    add-int/lit8 v11, p1, 0x1

    .line 424
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const-string v12, "647B616CACE485E5DA8CF0C4"

    invoke-static/range {v12 .. v12}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-eq p1, v1, :cond_2

    add-int/lit8 v5, v5, 0x1

    :cond_2
    move p1, v11

    goto :goto_2

    :cond_3
    const/4 v11, 0x5

    if-le v5, v11, :cond_4

    goto/16 :goto_4

    :cond_4
    add-int/2addr v6, v3

    const/16 v12, 0xe

    if-le v6, v12, :cond_5

    goto/16 :goto_4

    .line 433
    :cond_5
    invoke-static {p0, p1}, Landroidx/core/text/util/FindAddress;->matchHouseNumber(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object v12

    if-eqz v12, :cond_7

    if-eqz v7, :cond_6

    if-le v5, v3, :cond_6

    neg-int p0, p1

    return p0

    :cond_6
    if-ne v9, v1, :cond_d

    move v9, p1

    goto :goto_3

    .line 446
    :cond_7
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroidx/core/text/util/FindAddress;->isValidLocationName(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    const/4 v7, 0x0

    const/4 v8, 0x1

    goto :goto_3

    :cond_8
    if-ne v6, v11, :cond_9

    if-nez v8, :cond_9

    .line 453
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result p1

    goto :goto_4

    :cond_9
    if-eqz v8, :cond_c

    const/4 v7, 0x4

    if-le v6, v7, :cond_c

    .line 459
    invoke-static {p0, p1}, Landroidx/core/text/util/FindAddress;->matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object p1

    if-eqz p1, :cond_c

    const-string v7, "0B04"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 461
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {p1, v2}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v4

    const-string v7, "0F1C"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 463
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    goto :goto_4

    .line 468
    :cond_a
    sget-object v4, Landroidx/core/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 469
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 470
    invoke-virtual {v4, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Landroidx/core/text/util/FindAddress;->isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 471
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    return p0

    .line 482
    :cond_b
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result v10

    :cond_c
    const/4 v7, 0x0

    .line 412
    :cond_d
    :goto_3
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result p1

    goto/16 :goto_0

    :cond_e
    :goto_4
    if-lez v10, :cond_f

    return v10

    :cond_f
    if-lez v9, :cond_10

    goto :goto_5

    :cond_10
    move v9, p1

    :goto_5
    neg-int p0, v9

    return p0
.end method

.method private static checkHouseNumber(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 273
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 274
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x5

    if-le v2, v1, :cond_2

    return v0

    .line 279
    :cond_2
    sget-object v1, Landroidx/core/text/util/FindAddress;->sSuffixedNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 280
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    .line 281
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_3

    return v0

    :cond_3
    const/4 v0, 0x2

    .line 285
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 286
    rem-int/lit8 v3, v1, 0xa

    const-string v4, "1A18"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eq v3, v2, :cond_8

    if-eq v3, v0, :cond_6

    const/4 v0, 0x3

    if-eq v3, v0, :cond_4

    .line 294
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 292
    :cond_4
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xd

    if-ne v1, v0, :cond_5

    goto :goto_1

    :cond_5
    const-string v4, "1C14"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 290
    :cond_6
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xc

    if-ne v1, v0, :cond_7

    goto :goto_2

    :cond_7
    const-string v4, "0014"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 288
    :cond_8
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xb

    if-ne v1, v0, :cond_9

    goto :goto_3

    :cond_9
    const-string v4, "1D04"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_3
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_a
    return v2
.end method

.method static findAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 500
    sget-object v0, Landroidx/core/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 502
    :goto_0
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 503
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/text/util/FindAddress;->checkHouseNumber(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 504
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    .line 505
    invoke-static {p0, v0}, Landroidx/core/text/util/FindAddress;->attemptMatch(Ljava/lang/String;Ljava/util/regex/MatchResult;)I

    move-result v3

    if-lez v3, :cond_0

    .line 507
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    neg-int v2, v3

    goto :goto_0

    .line 511
    :cond_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isValidLocationName(Ljava/lang/String;)Z
    .locals 1

    .line 388
    sget-object v0, Landroidx/core/text/util/FindAddress;->sLocationNameRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public static isValidZipCode(Ljava/lang/String;)Z
    .locals 1

    .line 377
    sget-object v0, Landroidx/core/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public static isValidZipCode(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 366
    invoke-static {p1, v0}, Landroidx/core/text/util/FindAddress;->matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object p1

    invoke-static {p0, p1}, Landroidx/core/text/util/FindAddress;->isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z

    move-result p0

    return p0
.end method

.method private static isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 347
    :cond_0
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v1

    :goto_0
    if-lez v1, :cond_2

    add-int/lit8 v2, v1, -0x1

    .line 349
    invoke-interface {p1, v1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    move v1, v2

    goto :goto_0

    .line 351
    :cond_2
    :goto_1
    sget-object p1, Landroidx/core/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Landroidx/core/text/util/FindAddress;->sStateZipCodeRanges:[Landroidx/core/text/util/FindAddress$ZipRange;

    aget-object p1, p1, v1

    .line 352
    invoke-virtual {p1, p0}, Landroidx/core/text/util/FindAddress$ZipRange;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0
.end method

.method public static matchHouseNumber(Ljava/lang/String;I)Ljava/util/regex/MatchResult;
    .locals 3

    const/4 v0, 0x0

    if-lez p1, :cond_0

    add-int/lit8 v1, p1, -0x1

    .line 310
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const-string v2, "545C4F466741A5C593F4F08FE1EE83E7E490EEF28FE1ED83E7E190EEF58FE1E883E7E290EEF88FE1E783E7EF90EEDF8FE0F182E7E578657C60A3EB83E7CD90EED9"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return-object v0

    .line 311
    :cond_0
    sget-object v1, Landroidx/core/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p1, p0}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 312
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 313
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object p0

    const/4 p1, 0x0

    .line 314
    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/text/util/FindAddress;->checkHouseNumber(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object p0

    :cond_1
    return-object v0
.end method

.method public static matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;
    .locals 3

    const/4 v0, 0x0

    if-lez p1, :cond_0

    add-int/lit8 v1, p1, -0x1

    .line 330
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const-string v2, "425A8FE1CC6847A7D28FEAED83EEE185E5F38CF0EF83EEE285E5F68CF0E883EEE785E5F58CF0E583EEE885E5F88CF0C283EFFE84E5F2647B616CACE485E5DA8CF0C4"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return-object v0

    .line 331
    :cond_0
    sget-object v1, Landroidx/core/text/util/FindAddress;->sStateRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p1, p0}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 332
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object v0

    :cond_1
    return-object v0
.end method
