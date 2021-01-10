; Language   SKILL
; Date       Apr 02, 2007
; Lint Score 100%
; 
; Function for changing the width of a wire. For example;
; 
;     CCSchangeWireWidth(?width 0)
; 
; Will change selected wires to narrow.
; 
;     CCSchangeWireWidth()
; 
; Will change selected wires to the default wide wire width

 

; ***************************************************
; *                                                                *
; *  (CCSchangeWireWidth [?width (schGetEnv "defWideWireWidth")]   *
; *                    [?wires (geGetSelSet)])                     *
; *                                                                *
; * Change the wire widths on the specified wires, or the selected *
; *  set if not specified, to the width given - which defaults to  *
; *   the width for wide wires. To set to narrow lines, use nil    *
; *                       or 0 as the width.                       *

 
(defun CCSchangeWireWidth (@key (width (schGetEnv "defWideWireWidth"))
                   (wires (geGetSelSet)))
  (let (objType newWires cellView childInfo points finalWs )
    (foreach wire wires
         (setq objType (dbGetq wire objType))
         (setq childInfo nil)
         (setq finalWs nil)
         (cond
           ;---------------------------------------------------------
           ; If it needs to be recreated, capture any child
           ; label information, then delete the wire, then
           ; recreate it using the new width
           ;---------------------------------------------------------
           ((or
          (and (equal objType "line") (numberp width)
               (null (zerop width)))
          (and (equal objType "path") (or (null width)
                          (zerop width)))
          )
        (setq cellView (dbGetq wire cellView))
        (setq points (dbGetq wire points))
        (setq childInfo
              (foreach mapcan child (dbGetq wire children)
                   (when (equal (dbGetq child objType) "label")
                 (list
                   (list
                     (dbGetq child xy)
                     (dbGetq child theLabel)
                     (dbGetq child justify)
                     (dbGetq child orient)
                     (dbGetq child font)
                     (dbGetq child height)
                     )))
                   ))
        (dbDeleteObject wire)
        (setq newWires
              (schCreateWire
            cellView
            "draw"
            "full"
            points
            0 0
            (if width width 0)
            ))
        )
           ;---------------------------------------------------------
           ; If it is currently a path, and the wire width is non-zero,
           ; then just change the width of the path
           ;---------------------------------------------------------
           ((and (equal objType "path") (numberp width)
             (null (zerop width)))
        (dbSetq wire width width)
        )
           )
         ;-----------------------------------------------------------
         ; Create new wire labels, based on the previous wire
         ; label information captured earlier
         ;-----------------------------------------------------------
             (foreach child childInfo
                finalWs = append( finalWs list(
                             (apply
                               'schCreateWireLabel
                               `(
                                 ,cellView
                                 ,(car newWires)
                                 ,@child
                                 nil
                                 )
                            ) ; apply
                    ) ; list
                ) ; append
             ) ; foreach child
         ) ; foreach wire
; email - how to mainain selected set?
        foreach(mapcar x newWires geSelectFig(x))
; doesn't work when crossing type boundary (line/path) :(
    t
    ) ; let
  ) ; defun
