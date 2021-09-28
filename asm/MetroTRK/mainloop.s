.include "macros.inc"

.section .text  # 0x80005940 - 0x803B7240

.global TRKHandleRequestEvent
TRKHandleRequestEvent:
/* 80326714 003232F4  7C 08 02 A6 */	mflr r0
/* 80326718 003232F8  90 01 00 04 */	stw r0, 4(r1)
/* 8032671C 003232FC  94 21 FF F8 */	stwu r1, -8(r1)
/* 80326720 00323300  80 63 00 08 */	lwz r3, 8(r3)
/* 80326724 00323304  48 00 06 8D */	bl TRKGetBuffer
/* 80326728 00323308  48 00 0F 95 */	bl TRKDispatchMessage
/* 8032672C 0032330C  38 21 00 08 */	addi r1, r1, 8
/* 80326730 00323310  80 01 00 04 */	lwz r0, 4(r1)
/* 80326734 00323314  7C 08 03 A6 */	mtlr r0
/* 80326738 00323318  4E 80 00 20 */	blr 

.global TRKHandleSupportEvent
TRKHandleSupportEvent:
/* 8032673C 0032331C  7C 08 02 A6 */	mflr r0
/* 80326740 00323320  90 01 00 04 */	stw r0, 4(r1)
/* 80326744 00323324  94 21 FF F8 */	stwu r1, -8(r1)
/* 80326748 00323328  48 00 3A 4D */	bl TRKTargetSupportRequest
/* 8032674C 0032332C  38 21 00 08 */	addi r1, r1, 8
/* 80326750 00323330  80 01 00 04 */	lwz r0, 4(r1)
/* 80326754 00323334  7C 08 03 A6 */	mtlr r0
/* 80326758 00323338  4E 80 00 20 */	blr 

.global TRKIdle
TRKIdle:
/* 8032675C 0032333C  7C 08 02 A6 */	mflr r0
/* 80326760 00323340  90 01 00 04 */	stw r0, 4(r1)
/* 80326764 00323344  94 21 FF F8 */	stwu r1, -8(r1)
/* 80326768 00323348  48 00 3B 59 */	bl TRKTargetStopped
/* 8032676C 0032334C  2C 03 00 00 */	cmpwi r3, 0
/* 80326770 00323350  40 82 00 08 */	bne lbl_80326778
/* 80326774 00323354  48 00 48 0D */	bl TRKTargetContinue
lbl_80326778:
/* 80326778 00323358  38 21 00 08 */	addi r1, r1, 8
/* 8032677C 0032335C  80 01 00 04 */	lwz r0, 4(r1)
/* 80326780 00323360  7C 08 03 A6 */	mtlr r0
/* 80326784 00323364  4E 80 00 20 */	blr 

.global TRKNubMainLoop
TRKNubMainLoop:
/* 80326788 00323368  7C 08 02 A6 */	mflr r0
/* 8032678C 0032336C  3C 60 80 4A */	lis r3, lbl_804A4B3C@ha
/* 80326790 00323370  90 01 00 04 */	stw r0, 4(r1)
/* 80326794 00323374  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80326798 00323378  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8032679C 0032337C  3B E3 4B 3C */	addi r31, r3, lbl_804A4B3C@l
/* 803267A0 00323380  93 C1 00 18 */	stw r30, 0x18(r1)
/* 803267A4 00323384  3B C0 00 00 */	li r30, 0
/* 803267A8 00323388  93 A1 00 14 */	stw r29, 0x14(r1)
/* 803267AC 0032338C  3B A0 00 00 */	li r29, 0
/* 803267B0 00323390  48 00 00 A8 */	b lbl_80326858
lbl_803267B4:
/* 803267B4 00323394  38 61 00 08 */	addi r3, r1, 8
/* 803267B8 00323398  48 00 01 45 */	bl TRKGetNextEvent
/* 803267BC 0032339C  2C 03 00 00 */	cmpwi r3, 0
/* 803267C0 003233A0  41 82 00 6C */	beq lbl_8032682C
/* 803267C4 003233A4  88 01 00 08 */	lbz r0, 8(r1)
/* 803267C8 003233A8  3B A0 00 00 */	li r29, 0
/* 803267CC 003233AC  2C 00 00 02 */	cmpwi r0, 2
/* 803267D0 003233B0  41 82 00 28 */	beq lbl_803267F8
/* 803267D4 003233B4  40 80 00 14 */	bge lbl_803267E8
/* 803267D8 003233B8  2C 00 00 00 */	cmpwi r0, 0
/* 803267DC 003233BC  41 82 00 44 */	beq lbl_80326820
/* 803267E0 003233C0  40 80 00 24 */	bge lbl_80326804
/* 803267E4 003233C4  48 00 00 3C */	b lbl_80326820
lbl_803267E8:
/* 803267E8 003233C8  2C 00 00 05 */	cmpwi r0, 5
/* 803267EC 003233CC  41 82 00 2C */	beq lbl_80326818
/* 803267F0 003233D0  40 80 00 30 */	bge lbl_80326820
/* 803267F4 003233D4  48 00 00 18 */	b lbl_8032680C
lbl_803267F8:
/* 803267F8 003233D8  38 61 00 08 */	addi r3, r1, 8
/* 803267FC 003233DC  4B FF FF 19 */	bl TRKHandleRequestEvent
/* 80326800 003233E0  48 00 00 20 */	b lbl_80326820
lbl_80326804:
/* 80326804 003233E4  3B C0 00 01 */	li r30, 1
/* 80326808 003233E8  48 00 00 18 */	b lbl_80326820
lbl_8032680C:
/* 8032680C 003233EC  38 61 00 08 */	addi r3, r1, 8
/* 80326810 003233F0  48 00 35 D5 */	bl TRKTargetInterrupt
/* 80326814 003233F4  48 00 00 0C */	b lbl_80326820
lbl_80326818:
/* 80326818 003233F8  38 61 00 08 */	addi r3, r1, 8
/* 8032681C 003233FC  4B FF FF 21 */	bl TRKHandleSupportEvent
lbl_80326820:
/* 80326820 00323400  38 61 00 08 */	addi r3, r1, 8
/* 80326824 00323404  48 00 02 91 */	bl TRKDestructEvent
/* 80326828 00323408  48 00 00 30 */	b lbl_80326858
lbl_8032682C:
/* 8032682C 0032340C  2C 1D 00 00 */	cmpwi r29, 0
/* 80326830 00323410  41 82 00 14 */	beq lbl_80326844
/* 80326834 00323414  80 7F 00 00 */	lwz r3, 0(r31)
/* 80326838 00323418  88 03 00 00 */	lbz r0, 0(r3)
/* 8032683C 0032341C  28 00 00 00 */	cmplwi r0, 0
/* 80326840 00323420  41 82 00 10 */	beq lbl_80326850
lbl_80326844:
/* 80326844 00323424  3B A0 00 01 */	li r29, 1
/* 80326848 00323428  48 00 0D 65 */	bl TRKGetInput
/* 8032684C 0032342C  48 00 00 0C */	b lbl_80326858
lbl_80326850:
/* 80326850 00323430  4B FF FF 0D */	bl TRKIdle
/* 80326854 00323434  3B A0 00 00 */	li r29, 0
lbl_80326858:
/* 80326858 00323438  2C 1E 00 00 */	cmpwi r30, 0
/* 8032685C 0032343C  41 82 FF 58 */	beq lbl_803267B4
/* 80326860 00323440  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80326864 00323444  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80326868 00323448  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8032686C 0032344C  38 21 00 20 */	addi r1, r1, 0x20
/* 80326870 00323450  80 01 00 04 */	lwz r0, 4(r1)
/* 80326874 00323454  7C 08 03 A6 */	mtlr r0
/* 80326878 00323458  4E 80 00 20 */	blr 