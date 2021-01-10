; Matt's Bindkeys for metal layers viewing
;*******************************************************************************
; The following alias is used to make the bindKey definitions more readable.
;*******************************************************************************
; use : load "/home/felder/skill/mattsBindKeys.il"

alias bk hiSetBindKey

bk("Layout"   "Alt<Key>0"  "{	leSetAllLayerVisible(t)
				hiRedraw()
				}")
bk("Layout"   "Ctrl<Key>0" "{	leSetAllLayerVisible(nil)
				hiRedraw()
				}")
;;put poly on key 9
bk("Layout"   "Ctrl<Key>9" "{	leiMouseToggleLayerVisible(4)
				leiMouseToggleLayerVisible(39)
				hiRedraw()
				}")
;;put metal layers in order M1 on 1 , M2 on 2, etc
bk("Layout"   "Ctrl<Key>1" "{	leiMouseToggleLayerVisible(10)
				leiMouseToggleLayerVisible(43)
				hiRedraw()
				}")
bk("Layout"   "Ctrl<Key>2" "{	leiMouseToggleLayerVisible(12)
				leiMouseToggleLayerVisible(44)
				hiRedraw()
				}")
bk("Layout"   "Ctrl<Key>3" "{	leiMouseToggleLayerVisible(14)
				leiMouseToggleLayerVisible(45)
				hiRedraw()
				}")
bk("Layout"   "Ctrl<Key>4" "{	leiMouseToggleLayerVisible(17)
				leiMouseToggleLayerVisible(46)
				hiRedraw()
				}")
bk("Layout"   "Ctrl<Key>5" "{	leiMouseToggleLayerVisible(19)
				hiRedraw()
				}")
				

;***************************************************************************
; (Metal and Via layer viewing)
;***************************************************************************

;; poly, cnt, and metal1
bk("Layout"   "Shift<Key>1"    "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(4)
 				leiMouseToggleLayerVisible(9)
 				leiMouseToggleLayerVisible(10)
				leiMouseToggleLayerVisible(43)
				leiMouseToggleLayerVisible(39)
				hiRedraw()
				}")
;; metal1, via1, and metal2
bk("Layout"   "Shift<Key>2"  "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(10)
 				leiMouseToggleLayerVisible(11)
 				leiMouseToggleLayerVisible(12)
				leiMouseToggleLayerVisible(43)
				leiMouseToggleLayerVisible(44)
				hiRedraw()
				}")
;; metal2, via2, and metal3
bk("Layout"   "Shift<Key>3"  "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(12)
 				leiMouseToggleLayerVisible(13)
 				leiMouseToggleLayerVisible(14)
				leiMouseToggleLayerVisible(44)
				leiMouseToggleLayerVisible(45)
				hiRedraw()
				}")
;; metal3, TV, and TM
bk("Layout"   "Shift<Key>4"  "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(14)
 				leiMouseToggleLayerVisible(16)
 				leiMouseToggleLayerVisible(17)
				leiMouseToggleLayerVisible(45)
				leiMouseToggleLayerVisible(46)
				hiRedraw()
				}")
				
;; TM, PV, RD
bk("Layout"   "Shift<Key>5"  "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(17)
 				leiMouseToggleLayerVisible(18)
 				leiMouseToggleLayerVisible(19)
				leiMouseToggleLayerVisible(46)
				hiRedraw()
				}")

;; sub and well ties check (nplus, pplus, pw,act, and cnt)
bk("Layout"   "Shift<Key>5"  "{leSetAllLayerVisible(nil) 
 				leiMouseToggleLayerVisible(0)
 				leiMouseToggleLayerVisible(1)
 				leiMouseToggleLayerVisible(2)
 				leiMouseToggleLayerVisible(3)
 				leiMouseToggleLayerVisible(9)
				hiRedraw()
				}")



