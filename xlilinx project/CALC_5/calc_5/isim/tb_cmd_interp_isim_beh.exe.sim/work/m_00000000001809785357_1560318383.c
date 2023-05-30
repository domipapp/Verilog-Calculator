/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/cmd_interp_decoder.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {48U, 0U};
static unsigned int ng3[] = {57U, 0U};
static unsigned int ng4[] = {42U, 0U};
static unsigned int ng5[] = {43U, 0U};
static unsigned int ng6[] = {45U, 0U};
static unsigned int ng7[] = {47U, 0U};
static unsigned int ng8[] = {61U, 0U};
static unsigned int ng9[] = {13U, 0U};
static unsigned int ng10[] = {27U, 0U};



static void Always_33_0(char *t0)
{
    char t6[8];
    char t24[8];
    char t60[8];
    char t68[8];
    char t84[8];
    char t114[8];
    char t130[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t113;
    char *t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    char *t135;
    char *t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    char *t144;
    char *t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    char *t158;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 5280);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 1528U);
    t7 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t7 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t4) == 0)
        goto LAB6;

LAB8:    t13 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t6 + 4);
    t15 = (t7 + 4);
    t16 = *((unsigned int *)t7);
    t17 = (~(t16));
    *((unsigned int *)t6) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB10:    t22 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t25 = *((unsigned int *)t5);
    t26 = *((unsigned int *)t6);
    t27 = (t25 | t26);
    *((unsigned int *)t24) = t27;
    t28 = (t5 + 4);
    t29 = (t6 + 4);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t28);
    t32 = *((unsigned int *)t29);
    t33 = (t31 | t32);
    *((unsigned int *)t30) = t33;
    t34 = *((unsigned int *)t30);
    t35 = (t34 != 0);
    if (t35 == 1)
        goto LAB12;

LAB13:
LAB14:    t52 = (t24 + 4);
    t53 = *((unsigned int *)t52);
    t54 = (~(t53));
    t55 = *((unsigned int *)t24);
    t56 = (t55 & t54);
    t57 = (t56 != 0);
    if (t57 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(40, ng0);

LAB19:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB21;

LAB20:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB21;

LAB24:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB23;

LAB22:    *((unsigned int *)t6) = 1;

LAB23:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng3)));
    memset(t24, 0, 8);
    t15 = (t14 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB26;

LAB25:    t28 = (t13 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB26;

LAB29:    if (*((unsigned int *)t14) > *((unsigned int *)t13))
        goto LAB28;

LAB27:    *((unsigned int *)t24) = 1;

LAB28:    t8 = *((unsigned int *)t6);
    t9 = *((unsigned int *)t24);
    t10 = (t8 & t9);
    *((unsigned int *)t60) = t10;
    t30 = (t6 + 4);
    t38 = (t24 + 4);
    t39 = (t60 + 4);
    t11 = *((unsigned int *)t30);
    t12 = *((unsigned int *)t38);
    t16 = (t11 | t12);
    *((unsigned int *)t39) = t16;
    t17 = *((unsigned int *)t39);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB30;

LAB31:
LAB32:    t59 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t59, t60, 0, 0, 1, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t16 = (t11 ^ t12);
    t17 = (t10 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB36;

LAB33:    if (t20 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t6) = 1;

LAB36:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng5)));
    memset(t24, 0, 8);
    t15 = (t14 + 4);
    t28 = (t13 + 4);
    t23 = *((unsigned int *)t14);
    t25 = *((unsigned int *)t13);
    t26 = (t23 ^ t25);
    t27 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t28);
    t32 = (t27 ^ t31);
    t33 = (t26 | t32);
    t34 = *((unsigned int *)t15);
    t35 = *((unsigned int *)t28);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t40 = (t33 & t37);
    if (t40 != 0)
        goto LAB40;

LAB37:    if (t36 != 0)
        goto LAB39;

LAB38:    *((unsigned int *)t24) = 1;

LAB40:    t41 = *((unsigned int *)t6);
    t42 = *((unsigned int *)t24);
    t44 = (t41 | t42);
    *((unsigned int *)t60) = t44;
    t30 = (t6 + 4);
    t38 = (t24 + 4);
    t39 = (t60 + 4);
    t45 = *((unsigned int *)t30);
    t46 = *((unsigned int *)t38);
    t48 = (t45 | t46);
    *((unsigned int *)t39) = t48;
    t49 = *((unsigned int *)t39);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB41;

LAB42:
LAB43:    t59 = (t0 + 1048U);
    t67 = *((char **)t59);
    t59 = ((char*)((ng6)));
    memset(t68, 0, 8);
    t69 = (t67 + 4);
    t70 = (t59 + 4);
    t71 = *((unsigned int *)t67);
    t72 = *((unsigned int *)t59);
    t73 = (t71 ^ t72);
    t74 = *((unsigned int *)t69);
    t75 = *((unsigned int *)t70);
    t76 = (t74 ^ t75);
    t77 = (t73 | t76);
    t78 = *((unsigned int *)t69);
    t79 = *((unsigned int *)t70);
    t80 = (t78 | t79);
    t81 = (~(t80));
    t82 = (t77 & t81);
    if (t82 != 0)
        goto LAB47;

LAB44:    if (t80 != 0)
        goto LAB46;

LAB45:    *((unsigned int *)t68) = 1;

LAB47:    t85 = *((unsigned int *)t60);
    t86 = *((unsigned int *)t68);
    t87 = (t85 | t86);
    *((unsigned int *)t84) = t87;
    t88 = (t60 + 4);
    t89 = (t68 + 4);
    t90 = (t84 + 4);
    t91 = *((unsigned int *)t88);
    t92 = *((unsigned int *)t89);
    t93 = (t91 | t92);
    *((unsigned int *)t90) = t93;
    t94 = *((unsigned int *)t90);
    t95 = (t94 != 0);
    if (t95 == 1)
        goto LAB48;

LAB49:
LAB50:    t112 = (t0 + 1048U);
    t113 = *((char **)t112);
    t112 = ((char*)((ng7)));
    memset(t114, 0, 8);
    t115 = (t113 + 4);
    t116 = (t112 + 4);
    t117 = *((unsigned int *)t113);
    t118 = *((unsigned int *)t112);
    t119 = (t117 ^ t118);
    t120 = *((unsigned int *)t115);
    t121 = *((unsigned int *)t116);
    t122 = (t120 ^ t121);
    t123 = (t119 | t122);
    t124 = *((unsigned int *)t115);
    t125 = *((unsigned int *)t116);
    t126 = (t124 | t125);
    t127 = (~(t126));
    t128 = (t123 & t127);
    if (t128 != 0)
        goto LAB54;

LAB51:    if (t126 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t114) = 1;

LAB54:    t131 = *((unsigned int *)t84);
    t132 = *((unsigned int *)t114);
    t133 = (t131 | t132);
    *((unsigned int *)t130) = t133;
    t134 = (t84 + 4);
    t135 = (t114 + 4);
    t136 = (t130 + 4);
    t137 = *((unsigned int *)t134);
    t138 = *((unsigned int *)t135);
    t139 = (t137 | t138);
    *((unsigned int *)t136) = t139;
    t140 = *((unsigned int *)t136);
    t141 = (t140 != 0);
    if (t141 == 1)
        goto LAB55;

LAB56:
LAB57:    t158 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t158, t130, 0, 0, 1, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t16 = (t11 ^ t12);
    t17 = (t10 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB61;

LAB58:    if (t20 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t6) = 1;

LAB61:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng9)));
    memset(t24, 0, 8);
    t15 = (t14 + 4);
    t28 = (t13 + 4);
    t23 = *((unsigned int *)t14);
    t25 = *((unsigned int *)t13);
    t26 = (t23 ^ t25);
    t27 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t28);
    t32 = (t27 ^ t31);
    t33 = (t26 | t32);
    t34 = *((unsigned int *)t15);
    t35 = *((unsigned int *)t28);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t40 = (t33 & t37);
    if (t40 != 0)
        goto LAB65;

LAB62:    if (t36 != 0)
        goto LAB64;

LAB63:    *((unsigned int *)t24) = 1;

LAB65:    t41 = *((unsigned int *)t6);
    t42 = *((unsigned int *)t24);
    t44 = (t41 | t42);
    *((unsigned int *)t60) = t44;
    t30 = (t6 + 4);
    t38 = (t24 + 4);
    t39 = (t60 + 4);
    t45 = *((unsigned int *)t30);
    t46 = *((unsigned int *)t38);
    t48 = (t45 | t46);
    *((unsigned int *)t39) = t48;
    t49 = *((unsigned int *)t39);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB66;

LAB67:
LAB68:    t59 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t59, t60, 0, 0, 1, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng10)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t16 = (t11 ^ t12);
    t17 = (t10 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB72;

LAB69:    if (t20 != 0)
        goto LAB71;

LAB70:    *((unsigned int *)t6) = 1;

LAB72:    t13 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t13, t6, 0, 0, 1, 0LL);

LAB17:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB11:    t18 = *((unsigned int *)t6);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t6) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB10;

LAB12:    t36 = *((unsigned int *)t24);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t24) = (t36 | t37);
    t38 = (t5 + 4);
    t39 = (t6 + 4);
    t40 = *((unsigned int *)t38);
    t41 = (~(t40));
    t42 = *((unsigned int *)t5);
    t43 = (t42 & t41);
    t44 = *((unsigned int *)t39);
    t45 = (~(t44));
    t46 = *((unsigned int *)t6);
    t47 = (t46 & t45);
    t48 = (~(t43));
    t49 = (~(t47));
    t50 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t50 & t48);
    t51 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t51 & t49);
    goto LAB14;

LAB15:    xsi_set_current_line(34, ng0);

LAB18:    xsi_set_current_line(35, ng0);
    t58 = ((char*)((ng1)));
    t59 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t59, t58, 0, 0, 1, 0LL);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(38, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB17;

LAB21:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB23;

LAB26:    t29 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB28;

LAB30:    t19 = *((unsigned int *)t60);
    t20 = *((unsigned int *)t39);
    *((unsigned int *)t60) = (t19 | t20);
    t52 = (t6 + 4);
    t58 = (t24 + 4);
    t21 = *((unsigned int *)t6);
    t22 = (~(t21));
    t23 = *((unsigned int *)t52);
    t25 = (~(t23));
    t26 = *((unsigned int *)t24);
    t27 = (~(t26));
    t31 = *((unsigned int *)t58);
    t32 = (~(t31));
    t43 = (t22 & t25);
    t47 = (t27 & t32);
    t33 = (~(t43));
    t34 = (~(t47));
    t35 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t35 & t33);
    t36 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t36 & t34);
    t37 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t37 & t33);
    t40 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t40 & t34);
    goto LAB32;

LAB35:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB36;

LAB39:    t29 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB40;

LAB41:    t51 = *((unsigned int *)t60);
    t53 = *((unsigned int *)t39);
    *((unsigned int *)t60) = (t51 | t53);
    t52 = (t6 + 4);
    t58 = (t24 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (~(t54));
    t56 = *((unsigned int *)t6);
    t43 = (t56 & t55);
    t57 = *((unsigned int *)t58);
    t61 = (~(t57));
    t62 = *((unsigned int *)t24);
    t47 = (t62 & t61);
    t63 = (~(t43));
    t64 = (~(t47));
    t65 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t65 & t63);
    t66 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t66 & t64);
    goto LAB43;

LAB46:    t83 = (t68 + 4);
    *((unsigned int *)t68) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB47;

LAB48:    t96 = *((unsigned int *)t84);
    t97 = *((unsigned int *)t90);
    *((unsigned int *)t84) = (t96 | t97);
    t98 = (t60 + 4);
    t99 = (t68 + 4);
    t100 = *((unsigned int *)t98);
    t101 = (~(t100));
    t102 = *((unsigned int *)t60);
    t103 = (t102 & t101);
    t104 = *((unsigned int *)t99);
    t105 = (~(t104));
    t106 = *((unsigned int *)t68);
    t107 = (t106 & t105);
    t108 = (~(t103));
    t109 = (~(t107));
    t110 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t110 & t108);
    t111 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t111 & t109);
    goto LAB50;

LAB53:    t129 = (t114 + 4);
    *((unsigned int *)t114) = 1;
    *((unsigned int *)t129) = 1;
    goto LAB54;

LAB55:    t142 = *((unsigned int *)t130);
    t143 = *((unsigned int *)t136);
    *((unsigned int *)t130) = (t142 | t143);
    t144 = (t84 + 4);
    t145 = (t114 + 4);
    t146 = *((unsigned int *)t144);
    t147 = (~(t146));
    t148 = *((unsigned int *)t84);
    t149 = (t148 & t147);
    t150 = *((unsigned int *)t145);
    t151 = (~(t150));
    t152 = *((unsigned int *)t114);
    t153 = (t152 & t151);
    t154 = (~(t149));
    t155 = (~(t153));
    t156 = *((unsigned int *)t136);
    *((unsigned int *)t136) = (t156 & t154);
    t157 = *((unsigned int *)t136);
    *((unsigned int *)t136) = (t157 & t155);
    goto LAB57;

LAB60:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB61;

LAB64:    t29 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB65;

LAB66:    t51 = *((unsigned int *)t60);
    t53 = *((unsigned int *)t39);
    *((unsigned int *)t60) = (t51 | t53);
    t52 = (t6 + 4);
    t58 = (t24 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (~(t54));
    t56 = *((unsigned int *)t6);
    t43 = (t56 & t55);
    t57 = *((unsigned int *)t58);
    t61 = (~(t57));
    t62 = *((unsigned int *)t24);
    t47 = (t62 & t61);
    t63 = (~(t43));
    t64 = (~(t47));
    t65 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t65 & t63);
    t66 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t66 & t64);
    goto LAB68;

LAB71:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB72;

}

static void Cont_49_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5424);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5296);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_50_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5488);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5312);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_51_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5552);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5328);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_52_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5616);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5344);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000001809785357_1560318383_init()
{
	static char *pe[] = {(void *)Always_33_0,(void *)Cont_49_1,(void *)Cont_50_2,(void *)Cont_51_3,(void *)Cont_52_4};
	xsi_register_didat("work_m_00000000001809785357_1560318383", "isim/tb_cmd_interp_isim_beh.exe.sim/work/m_00000000001809785357_1560318383.didat");
	xsi_register_executes(pe);
}
