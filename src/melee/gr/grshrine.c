#include "grshrine.h"

#define M_PI 3.14159265358979323846

static const Vec3 lbl_803B8298 = { 0.5f, 0.0f, 0.0f };

static void* lbl_804D6A18;

static StageCallbacks lbl_803E50E8[3] = {
    {
        lbl_80201E08,
        lbl_80201E34,
        lbl_80201E3C,
        lbl_80201E40,
    }, {
        lbl_80201E44,
        lbl_80201E88,
        lbl_80201E90,
        lbl_80201E94,
    }, {
        lbl_80201E9C,
        lbl_80201F14,
        lbl_80201F1C,
        lbl_80201F40,
        0xC0000000,
    },
};

StageData lbl_803E5130 = {
    0x00000007,
    lbl_803E50E8,
    "/GrSh.dat",
    func_80201C64,
    func_80201C60,
    lbl_80201CF0,
    lbl_80201CF4,
    lbl_80201D18,
    lbl_80201F44,
    lbl_80201F4C,
    0x00000001,
};

static void func_80201C60()
{
}

static void func_80201C64()
{
    u32 unused1[2];
    Vec3 v;
    u32 unused2;

    lbl_804D6A18 = func_801C49F8();
    func_80201D20(0);
    func_80201D20(1);
    func_80201D20(2);
    func_801C39C0();
    func_801C3BB4();
    v = lbl_803B8298;
    func_80011A50(&v, -1, 0.5f, 0.0f, M_PI / 3,
        -10000.0f, 10000.0f, 10000.0f, -10000.0f);
}

static void lbl_80201CF0()
{
}

static void lbl_80201CF4()
{
    func_801CAE04(0);
}

static s32 lbl_80201D18()
{
    return 0;
}

static HSD_GObj* func_80201D20(s32 arg0)
{
    HSD_GObj* gobj;
    StageCallbacks* callbacks = &lbl_803E50E8[arg0];

    gobj = func_801C14D0(arg0);
    if (gobj != NULL) {
        Map* map;
        map = gobj->user_data;
        map->x8 = 0;
        map->xC = 0;
        GObj_SetupGXLink(gobj, func_801C5DB0, 3, 0);
        if (callbacks->callback3 != NULL) {
            map->x1C_callback = callbacks->callback3;
        }
        if (callbacks->callback0 != NULL) {
            callbacks->callback0(gobj);
        }
        if (callbacks->callback2 != NULL) {
            func_8038FD54(gobj, callbacks->callback2, 4);
        }
    } else {
        OSReport("%s:%d: couldn t get gobj(id=%d)\n",
            "grshrine.c", 205, arg0);
    }
    return gobj;
}

static void lbl_80201E08(HSD_GObj* gobj)
{
    Map* map = gobj->user_data;
    func_801C8138(gobj, map->map_id, 0);
}

static s32 lbl_80201E34()
{
    return 0;
}

static void lbl_80201E3C()
{
}

static void lbl_80201E40()
{
}

static void lbl_80201E44(HSD_GObj* gobj)
{
    Map* map = gobj->user_data;
    func_801C8138(gobj, map->map_id, 0);
    map->x11_flags.b012 = 2;
}

static s32 lbl_80201E88()
{
    return 0;
}

static void lbl_80201E90()
{
}

static void lbl_80201E94()
{
}

static void lbl_80201E98()
{
}

static void lbl_80201E9C(HSD_GObj* gobj)
{
    u32 unused[2];
    Map* map = gobj->user_data;
    func_801C2ED0(gobj->hsd_obj, map->map_id);
    func_801C8138(gobj, map->map_id, 0);
    func_801C10B8(gobj, lbl_80201E98);
    func_801C2FE0(gobj);
    map->x10_flags.b5 = 1;
}

static s32 lbl_80201F14()
{
    return 0;
}

static void lbl_80201F1C()
{
    func_801C2FE0();
    func_800115F4();
}

static void lbl_80201F40()
{
}

static s32 lbl_80201F44()
{
    return 0;
}

static s32 lbl_80201F4C(Vec3* a, u32 unused, u8* joint)
{
    Vec3 b;
    func_8000B1CC(joint, 0, &b);

    if (a->y > b.y) {
        return TRUE;
    } else {
        return FALSE;
    }
}